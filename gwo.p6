#!/usr/bin/env perl6
use v6;


=for comment
Inicializa la matriz de posiciones de los lobos (agentes de búsqueda)
    $cantidad_lobos     : Cantidad de lobos a participar en la cazería. 
    $numero_parametros  : Cantidad de parametros por problema
    @limites_inferiores : Límites inferiores de los parámetros
    @limites_superiores : Límites superiores de los parámetros

sub inicializar($cantidad_lobos, $numero_parametros, @limites_inferiores, @limites_superiores){
    
    # Completo las filas
    my @matrix = [];

    eager loop (my $i = 0; $i < $cantidad_lobos; $i++) {

        # Completo columnas
        eager loop (my $j = 0; $j < $numero_parametros; $j++) {

            #say(@limites_inferiores[$j]," " ,@limites_superiores[$j]);
            # Selecciona un número random en el rango dado.
            @matrix[$i][$j] = random(@limites_inferiores[$j] , @limites_superiores[$j]);
        }
    }

    return @matrix
}

=for comment
Verifica que los nuevos valores calculados por el algoritmo no esten fuera del
espacio de parámetros designado para el experimento 

sub retornar_espacio( $cantidad_parametros, $cantidad_lobos, @posiciones, @limites_inferiores, @limites_superiores){

    eager loop (my $i = 0; $i < $cantidad_lobos; $i++){
        eager loop (my $j = 0; $j < $cantidad_parametros; $j++){

            if @posiciones[$i][$j] <= @limites_inferiores[$j] or @posiciones[$i][$j] >= @limites_superiores[$j] {
                @posiciones[$i][$j] = random( @limites_inferiores[$j] , @limites_superiores[$j] );
            }
        }
    }
}

=for comment
Se realiza una selección de parámetros para libsvm utilizando libsvm 

sub libsvm_grey_wolf_optimizer($cantidad_lobos, $cantidad_iteraciones, $dataset){

	my $INF = Inf;

	my @alpha_position 	= [0, 0];
	my $alpha_score		= -Inf;

	my @beta_position 	= [0, 0] ;
	my $beta_score		= -Inf;

	my @delta_position 	= [0, 0] ;
	my $delta_score		= -Inf;

    my $cantidad_parametros = 2;


    #    my @limites_inferiores= [2**-5, 2**-15];
    #   my @limites_superiores = [2**15, 2**3];
    my @limites_inferiores  = [-5, -15];
    my @limites_superiores  = [15, 3];
	my @positions 		    = inicializar($cantidad_lobos, $cantidad_parametros, @limites_inferiores, @limites_superiores);

    eager loop (my $iteration = 0; $iteration < $cantidad_iteraciones; $iteration++){
        say "ITERACION    $iteration";

        retornar_espacio( $cantidad_parametros, $cantidad_lobos, @positions, @limites_inferiores, @limites_superiores);

        my @promesas = ();
        
        # Crea los hilos y recolecta las promesas.
        for 0..($cantidad_lobos-1) -> $position {

            my $promesa = start conveniencia($position, @(@positions[$position]), $dataset);
            push @promesas, $promesa;
        }

        # Espera la salida de las respuestas
        my @resultados = await @promesas;

        my $fitness = 0;
        my $position = 0;

        # Revisa los resultados de los hilos para asignar los nuevos lobos alfa,
        # beta y delta
        for @resultados -> $resultado {

            # resultado es escalar, por lo que debo sacarlo uno a uno.
            $position = $resultado[0];
            $fitness  = $resultado[1];

            if $fitness == Inf {


            }

            # Muestra la situación actual
            say "$position: A[$alpha_score] B[$beta_score] C[$delta_score] Fitness [$fitness] para C: @positions[$position][0] y Gamma: @positions[$position][1] ";

            # Escribe a un archivo los puntos que se evaluaron.
            # spurt "gwo.$dataset.$iteration", "@positions[$position][0],@positions[$position][1],$fitness\n", :append;

            if ($fitness > $alpha_score) {
                $alpha_score = $fitness;
                @alpha_position = @(@positions[$position]);

            }elsif ($fitness > $beta_score) {
                $beta_score = $fitness;
                @beta_position = @(@positions[$position]);

            }elsif ($fitness > $delta_score) {
                $delta_score = $fitness;
                @delta_position = @(@positions[$position]);
            }
        }

        #spurt "mejores.lobos.$iteration", "@alpha_position[0],@alpha_position[1]\n", :append;
        #spurt "mejores.lobos.$iteration", "@beta_position[0],@beta_position[1]\n", :append;
        #spurt "mejores.lobos.$iteration", "@delta_position[0],@delta_position[1]\n", :append;

        # Recalcula el valor de a
        my $a = Num(2 - $iteration) * Num(2 / $cantidad_iteraciones);

        # Recalcula las posiciones de los lobos con respecto a los lobos alfa,
        # beta y delta.
		eager loop (my $i = 0; $i < $cantidad_lobos; $i++){

			eager loop (my $j = 0; $j < $cantidad_parametros; $j++){

                my $d_alpha	= abs( (2*1.rand)* @alpha_position[$j] - @positions[$i][$j]);
                my $x1 		= @alpha_position[$j] - ((2.0*$a*1.rand) - 1.0) * $d_alpha;

		    	my $d_beta 	= abs((2*1.rand)*@beta_position[$j] - @positions[$i][$j]);
		    	my $x2 		= @beta_position[$j] - ((2.0*$a*1.rand) - 1.0) * $d_beta;

		    	my $d_delta	= abs(2 * 1.rand * @delta_position[$j] - @positions[$i][$j]);
		    	my $x3 		= @delta_position[$j] - ((2.0*$a*1.rand) - 1.0) * $d_delta;

		    	@positions[$i][$j] = ($x1 + $x2 + $x3) / 3.0;
			}
		}
	}

    # Retorna el mayor valor (pos del lobo gris).
	return @alpha_position;
}

=for comment
Funcion de conveniencia para el algoritmo de gwo

sub conveniencia($position, @parametros, $dataset){

    my $output = Inf;

    # Comando a ejecutar
    #my $libsvm_command = "svm-train -v 2 -s 0 -t 2 -c {2**@parametros[0]} -g  {2**@parametros[1]}  CasasolaTass.Freq20.2C.Casasola.libsvm";
    #my $libsvm_command = "svm-train -v 2 -s 0 -t 2 -c {2**@parametros[0]} -g  {2**@parametros[1]}  $dataset";
    my $libsvm_command = "svm-train -v 10 -s 0 -t 2 -c {2**@parametros[0]} -g  {2**@parametros[1]}  {$dataset}";

    #say $position," ", @parametros[0]," ", @parametros[0];
    #say $libsvm_command;
    #say "";

    #Ejecuta el comando en un shell
    my $proc = shell($libsvm_command, :out);

    # Saco el texto 
    my $libsvm_result = $proc.out.slurp-rest;

    #Saco donde está el número
    if  $libsvm_result ~~ m:s/Cross Validation Accuracy \= (\d+[.\d+]?)\%/ {
        $output = "$0";
    }

    # Retorno el valor final
    return @($position, Num($output.Str));

}

=for comment
Random dentro de parámetros

sub random($limite_inferior, $limite_superior){

    my $resultado = $limite_inferior + (1.rand() / (1 / ($limite_superior - $limite_inferior)));

    return $resultado ;
}

sub main(){

    if @*ARGS.elems < 3 {
        die "no hay suficientes argumentos";
    }

    my $wolfs = Int(@*ARGS[0]);
    my $runs  = Int(@*ARGS[1]);
    my $dataset  = @*ARGS[2];

    # $cantidad_lobos | $cantidad_iteraciones | Nombre del archivo de datos
    
    my @resultado = libsvm_grey_wolf_optimizer($wolfs, $runs, $dataset );

    say "$dataset.result --> C:@resultado[0],G:@resultado[1]\n";
    spurt "$dataset-$wolfs-$runs.result", " C:@resultado[0],G:@resultado[1]\n";

}

main();

