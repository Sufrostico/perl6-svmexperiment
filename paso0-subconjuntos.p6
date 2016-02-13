#!/usr/bin/env perl6

use v6.c;
use lib 'parser';
use process-config;

sub main(){

    my %config = parsear_archivo();

    my $cantidad_subconjuntos = %config<general><subconjuntos>;
    my $archivo = %config<general><dataset>;
    my $tamaño = %config<general><tamaño-subconjunto>;


    my $basename = IO::Path.new($archivo).basename;

    # $tamaño 3040

    for 1..$cantidad_subconjuntos -> $subconjunto {
        say "Generando subconjunto $subconjunto";
        shell("svm-subset -s 1 $archivo $tamaño $basename.train.$subconjunto $basename.test.$subconjunto");
        #say("svm-subset -s 1 $archivo $tamaño $archivo.train.$subconjunto $archivo.test.$subconjunto");
    }
}

main();

