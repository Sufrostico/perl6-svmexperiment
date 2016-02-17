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
# vacía la bitácora
spurt $bitacora, "";

# Ejecuta las predicciones
for @orden -> $id_actual {

    say "$id_actual";

   %tratamiento = %configuracion{$id_actual}; 

    spurt $bitacora, "$id_actual\n", :append;
    #shell("svm-predict $archivo.%tratamiento{'subconjunto'} $id_actual.model $id_actual.predict");
    say("svm-predict $archivo.%tratamiento{'subconjunto'} $id_actual.model $id_actual.predict");
    say "\n";
}

