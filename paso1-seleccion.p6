#!/usr/bin/env perl6
use v6.c;

use lib 'parser';
use process-config;


my %configuracion = parsear_archivo();

my $bitacora = "seleccion.status";

my $archivo = "{%configuracion<general><dataset>}.train";
    
my @orden = @(%configuracion<orden>);

my %tratamiento;
my $paso = 1;
spurt $bitacora, "";

for @orden -> $id_actual {

    say $id_actual;

    $paso = %configuracion{$id_actual}{"paso"};

    if $paso <= 1 {

        %tratamiento = %configuracion{$id_actual}; 

        spurt $bitacora, "$id_actual\n", :append;
        say "%tratamiento{'paso1-comando'} %tratamiento{'paso1-parametros'} $archivo.%tratamiento{'subconjunto'}";
        shell("%tratamiento{'paso1-comando'} %tratamiento{'paso1-parametros'} $archivo.%tratamiento{'subconjunto'}");
        say "\n";
    } 
}

