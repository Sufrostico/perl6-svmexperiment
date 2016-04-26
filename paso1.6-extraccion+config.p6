#!/usr/bin/env perl6
use v6.c;

use lib 'parser';
use process-config;



if @*ARGS.elems < 1 {
    die "Necesita, al menos, el nombre del archivo como argumento";
}

my %configuracion = parsear_archivo();

my $texto = slurp "@*ARGS[0]";

my @archivo = split "\n", $texto ;

# Escribe la sección general
escribir_tratamiento("general", %configuracion<general>);
say "\n";

loop (my $i = 0; $i < @archivo.elems; $i++){


    given @archivo[$i] {

        when / malla'-'\d+ / {

            $i += 112;
            escribir_tratamiento($_, %configuracion{$_});
            mostrar_tratamiento($_, @archivo, $i);
            print "\n";

        }

        when / gwo'-'56'-'\d+ / {

            $i += 72;
            escribir_tratamiento($_, %configuracion{$_});
            mostrar_tratamiento($_, @archivo, $i);
            print "\n";

        }

        when / gwo'-'112'-'\d+ / {

            $i += 142;
            escribir_tratamiento($_, %configuracion{$_});
            mostrar_tratamiento($_, @archivo, $i);
            print "\n";

        }

        when / gwo'-'168'-'\d+ / {

            $i += 212;
            escribir_tratamiento($_, %configuracion{$_});
            mostrar_tratamiento($_, @archivo, $i);
            print "\n";

        }
    }
}

escribir_orden(@(%configuracion<orden>));

sub mostrar_tratamiento($tratamiento, @archivo, $brinco) {

    given @archivo[$brinco] {

        when / C':'('-'?\d+.\d+)','G':'('-'?\d+.\d+) / {

            say "paso2-c = $0";
            say "paso2-g = $1";
        }

        when  / ('-'?\d+.\d+['e-'\d+]?) ' ' ('-'?\d+.\d+['e-'\d+]?) / {

            say "paso2-c = { log(Num($0))/log(2) }";
            say "paso2-g = { log(Num($1))/log(2) }";
        }
    }

}


sub escribir_tratamiento($nombre_tratamiento, %tratamiento){

    say "[ $nombre_tratamiento ] ";

#    say "paso1-comando = %tratamiento<paso1-comando>";
#    say "paso1-parametros  = %tratamiento<paso1-parametros>";
#    say "subconjunto = %tratamiento<subconjunto>";

    for %tratamiento.sort(*.key)>>.kv -> ($llave, $valor) {
        say "$llave = $valor";
    }
}

sub escribir_orden(@orden){

    say "[ orden ] ";

    for @orden -> $tratamiento {
        say $tratamiento;
    }
}


