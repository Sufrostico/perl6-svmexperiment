#!/usr/bin/env perl6
use v6.c;

use lib 'parser';
use process-config;


my %configuracion = parsear_archivo();

my $bitacora = "seleccion.status";
my $archivo = "{%configuracion<general><dataset>}.train";
    
my @orden = @(%configuracion<orden>);

my %tratamiento;
spurt $bitacora, "";

for @orden -> $id_actual {

   %tratamiento = %configuracion{$id_actual}; 

   spurt $bitacora, "$id_actual\n", :append;
   #shell("%tratamiento{comando} %tratamiento{parametros} $archivo.%tratamiento{subconjunto}");
   say "%tratamiento{'comando'} %tratamiento{'parametros'} $archivo.%tratamiento{'subconjunto'}";
}

