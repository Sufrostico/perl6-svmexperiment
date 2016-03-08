use v6.c;

use FileActions;
use FileGrammar;

sub normalizar_archivo( %configuración){


    my @orden = @(%configuración<orden>);

    for @orden -> $id_actual {

        # para el paso 1
        if %configuración{$id_actual}<paso1-comando> === Any {
            %configuración{$id_actual}<paso1-comandos> = %configuración<general><paso1-comandos>;
        } 

        if %configuración{$id_actual}<paso1-parametros> === Any {
            %configuración{$id_actual}<paso1-parametros> = %configuración<general><paso1-parametros>;
        }
        
        # para el paso 2
        if %configuración{$id_actual}<paso2-comando> === Any {
            %configuración{$id_actual}<paso2-comandos> = %configuración<general><paso2-comandos>;
        } 

        if %configuración{$id_actual}<paso2-parametros> === Any {
            %configuración{$id_actual}<paso2-parametros> = %configuración<general><paso2-parametros>;
        }

        # para el paso 3
        if %configuración{$id_actual}<paso3-comando> === Any {
            %configuración{$id_actual}<paso3-comandos> = %configuración<general><paso3-comandos>;
        } 

        if %configuración{$id_actual}<paso3-parametros> === Any {
            %configuración{$id_actual}<paso3-parametros> = %configuración<general><paso3-parametros>;
        }

        # para el elemento paso 
        if %configuración{$id_actual}<paso> === Any {
            %configuración{$id_actual}<paso> = 0; 
        }
    }

    return %configuración;
}


# Test para probar cómo funcionan las gramáticas
sub parsear_archivo() is export {

    my $texto = slurp "config";
    my $a = FileActions.new(); 
    my $parser = FileGrammar.subparse($texto, :actions($a));

    my  %res =   $parser.made;

    %res = normalizar_archivo(%res);

    return %res;
}
