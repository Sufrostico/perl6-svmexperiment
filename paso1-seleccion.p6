#!/usr/bin/env perl6
use v6.c;

use lib 'parser';
use process-config;


my %configuracion = parsear_archivo();

my $bitacora = "seleccion.status";
my $archivo = "{%configuracion<general><dataset>}.train";
    
# Plan de ejecución
#my @orden = <gwo-55-2 gwo-55-3 malla-2 malla-5 gwo-55-4 gwo-55-1 gwo-165-5
#        gwo-165-4 gwo-165-3 gwo-110-4 gwo-110-1 gwo-55-5 gwo-110-2 gwo-110-3
#        gwo-165-2 gwo-165-1 malla-1 malla-3 gwo-110-5 malla-4>;
my @orden = @(%configuracion<orden>);

my %tratamiento;
spurt $bitacora, "";

for @orden -> $id_actual {

   %tratamiento = %configuracion{$id_actual}; 

   spurt $bitacora, "$id_actual\n", :append;
   #shell("%tratamiento{comando} %tratamiento{parametros} $archivo.%tratamiento{subconjunto}");
   say "%tratamiento{'comando'} %tratamiento{'parametros'} $archivo.%tratamiento{'subconjunto'}";
}

