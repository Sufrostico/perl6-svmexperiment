#!/usr/bin/env perl6
use v6.c;


if @*ARGS.elems < 1 {
    die "Necesita, al menos, el nombre del archivo como argumento";
}

my $texto = slurp "@*ARGS[0]";

my @archivo = split "\n", $texto ;


loop (my $i = 0; $i < @archivo.elems; $i++){


    given @archivo[$i] {

        when / malla'-'\d+ / {

            $i += 112;
            mostrar_tratamiento($_, @archivo, $i);

        }

        when / gwo'-'56'-'\d+ / {

            $i += 72;
            mostrar_tratamiento($_, @archivo, $i);

        }

        when / gwo'-'112'-'\d+ / {

            $i += 142;
            mostrar_tratamiento($_, @archivo, $i);

        }

        when / gwo'-'168'-'\d+ / {

            $i += 212;
            mostrar_tratamiento($_, @archivo, $i);

        }
    }
}

sub mostrar_tratamiento($tratamiento, @archivo, $brinco) {

    say $tratamiento;
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

    say "\n";
}


#    my $ejemplo = "Freq20.2C.train.5.result --> C:9.88841450165424,G:-11.6053638365711";
#    
#    if $ejemplo ~~ / C':'('-'?\d+.\d+)','G':'('-'?\d+.\d+) / {
#    
#        say "paso2-c = $0";
#        say "paso2-g = $1";
#    }


#    my $ejemplo = "512.0 0.00048828125 70.9539";

#    my $ejemplo = "8192.0 3.0517578125e-05 70.0987";
#    
#    
#    if $ejemplo ~~ / ('-'?\d+.\d+['e-'\d+]?) ' ' ('-'?\d+.\d+['e-'\d+]?) / {
#    
#        say "paso2-c = { log(Num($0))/log(2) }";
#        say "paso2-g = { log(Num($1))/log(2) }";
#    }
    
