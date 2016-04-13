#!/usr/bin/env perl6
use v6.c;

use lib 'parser';
use process-config;

my %configuracion = parsear_archivo();


my $bitacora = "predicción.status";
my $archivo = "{%configuracion<general><dataset>}.test";

# Plan de ejecución
my @orden = @(%configuracion<orden>);

my %tratamiento;
my $paso = 3;
# vacía la bitácora
spurt $bitacora, "";


# Ejecuta las predicciones
for @orden -> $id_actual {

    say "$id_actual";
    $paso = %configuracion{$id_actual}{"paso"};

    if $paso <= 3 {

       %tratamiento = %configuracion{$id_actual}; 

        spurt $bitacora, "$id_actual\n", :append;
        say $id_actual;
        say "%tratamiento{'paso3-comando'}   $archivo.%tratamiento{'subconjunto'} $id_actual.model $id_actual.predict";
        shell( "%tratamiento{'paso3-comando'}   $archivo.%tratamiento{'subconjunto'} $id_actual.model $id_actual.predict");
        say "\n";
    }
}

