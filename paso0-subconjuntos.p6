#!/usr/bin/env perl6
use v6;

sub main(){

    if @*ARGS.elems < 3 {

        say "paso0 <cantidad_subconjuntos> <archivo base> <tamaño> ";
        say "";
        die "Imposible proseguir";
    }

    my $cantidad_subconjuntos = @*ARGS[0];
    my $archivo = @*ARGS[1];
    my $tamaño = @*ARGS[2];

    # $tamaño 3040

    for 1..$cantidad_subconjuntos -> $subconjunto {
        say "Generando subconjunto $subconjunto";
        #shell("svm-subset -s 1 $archivo $tamaño $archivo.train.$subconjunto $archivo.test.$subconjunto");
        say("svm-subset -s 1 $archivo $tamaño $archivo.train.$subconjunto $archivo.test.$subconjunto");
    }
}

main();

