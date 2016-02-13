#!/usr/bin/env perl6
use v6.c;

use lib 'parser';
use process-config;

my %configuracion = parsear_archivo();

my $bitacora = "predicción.status";
my $archivo = "{%configuracion<general><dataset>}.test";

# Plan de ejecución para predicciones
my @orden = <gwo-55-2 gwo-55-3 malla-2 malla-5 gwo-55-4 gwo-55-1 gwo-165-5
        gwo-165-4 gwo-165-3 gwo-110-4 gwo-110-1 gwo-55-5 gwo-110-2 gwo-110-3
        gwo-165-2 gwo-165-1 malla-1 malla-3 gwo-110-5 malla-4>;

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

