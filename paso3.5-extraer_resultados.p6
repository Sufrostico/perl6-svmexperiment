#!/usr/bin/env perl6
use v6.c;

if @*ARGS.elems < 1 {
    die "Necesita, al menos, el nombre del archivo como argumento";
}

my $texto = slurp "@*ARGS[0]";

my @archivo = split "\n", $texto ;


loop (my $i = 0; $i < @archivo.elems; $i++){

    given @archivo[$i] {

        when /^^ [ malla || default || gwo ]'-'\d+ ('-' \d+)? $$/ {

            reunir_resultados($_, @archivo, $i+2);
        }
    }
}

sub reunir_resultados($tratamiento, @archivo, $inicio) {

    print "$tratamiento,";

    for @archivo[$inicio..$inicio+4] -> $linea {

        given $linea {

            when / 'Precision = '(\d+.\d+)'%' / {
                print "$0,";
            }

            when / 'Recall = '(\d+.\d+)'%' / {
                print "$0,";
            }

            when / 'F-score = '(\d+.\d+) / {
                print "$0,";
            }

            when / 'Accuracy = '(\d+.\d+)'%' / {
                say "$0";
            }
        }
    }
}

