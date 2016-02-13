#!/usr/bin/env perl6
use v6.c;

use lib 'parser';
use process-config;


my %configuracion = parsear_archivo();

my $bitacora = "seleccion.status";
my $archivo = "{%configuracion<general><dataset>}.train";

#my %configuracion = 

#    'malla-1' => {
#            'comando' => 'svm-grid ',
#            'parametros' => '-v 10 ',
#            'subconjunto' => 1 
#        },
#    'malla-2' => {
#            'comando' => 'svm-grid ',
#            'parametros' => '-v 10 ',
#            'subconjunto' => 2
#        },

#    'malla-3' => {
#            'comando' => 'svm-grid ',
#            'parametros' => '-v 10 ',
#            'subconjunto' => 3
#        },
#    'malla-4' => {
#            'comando' => 'svm-grid ',
#            'parametros' => '-v 10 ',
#            'subconjunto' => 4
#        },
#    'malla-5' => {
#            'comando' => 'svm-grid ',
#            'parametros' => '-v 10 ',
#            'subconjunto' => 5
#        },
#    'gwo-55-1' => {
#            'comando' => 'perl6 gwo.p6 ',
#            'parametros' => '4 14 ',
#            'subconjunto' => 1
#        },
#    'gwo-55-2' => {
#            'comando' => 'perl6 gwo.p6 ',
#            'parametros' => '4 14 ',
#            'subconjunto' => 2
#        },
#    'gwo-55-3' => {
#            'comando' => 'perl6 gwo.p6 ',
#            'parametros' => '4 14 ',
#            'subconjunto' => 3
#        },
#    'gwo-55-4' => {
#            'comando' => 'perl6 gwo.p6 ',
#            'parametros' => '4 14 ',
#            'subconjunto' => 4
#        },
#    'gwo-55-5' => {
#            'comando' => 'perl6 gwo.p6 ',
#            'parametros' => '4 14 ',
#            'subconjunto' => 5
#        },
#    'gwo-110-1' => {
#            'comando' => 'perl6 gwo.p6 ',
#            'parametros' => '4 28 ',
#            'subconjunto' => 1
#        },
#    'gwo-110-2' => {
#            'comando' => 'perl6 gwo.p6 ',
#            'parametros' => '4 28 ',
#            'subconjunto' => 2
#        },
#    'gwo-110-3' => {
#            'comando' => 'perl6 gwo.p6 ',
#            'parametros' => '4 28 ',
#            'subconjunto' => 3
#        },
#    'gwo-110-4' => {
#            'comando' => 'perl6 gwo.p6 ',
#            'parametros' => '4 28 ',
#            'subconjunto' => 4
#        },
#    'gwo-110-5' => {
#            'comando' => 'perl6 gwo.p6 ',
#            'parametros' => '4 28 ',
#            'subconjunto' => 5
#        },
#    'gwo-165-1' => {
#            'comando' => 'perl6 gwo.p6 ',
#            'parametros' => '4 42 ',
#            'subconjunto' => 1
#        },
#    'gwo-165-2' => {
#            'comando' => 'perl6 gwo.p6 ',
#            'parametros' => '4 42 ',
#            'subconjunto' => 2
#        },
#    'gwo-165-3' => {
#            'comando' => 'perl6 gwo.p6 ',
#            'parametros' => '4 42 ',
#            'subconjunto' => 3
#        },
#    'gwo-165-4' => {
#            'comando' => 'perl6 gwo.p6 ',
#            'parametros' => '4 42 ',
#            'subconjunto' => 4
#        },
#    'gwo-165-5' => {
#            'comando' => 'perl6 gwo.p6 ',
#            'parametros' => '4 42 ',
#            'subconjunto' => 5
#        }
#;
    
# Plan de ejecución
my @orden = <gwo-55-2 gwo-55-3 malla-2 malla-5 gwo-55-4 gwo-55-1 gwo-165-5
        gwo-165-4 gwo-165-3 gwo-110-4 gwo-110-1 gwo-55-5 gwo-110-2 gwo-110-3
        gwo-165-2 gwo-165-1 malla-1 malla-3 gwo-110-5 malla-4>;

my %tratamiento;
spurt $bitacora, "";

for @orden -> $id_actual {

   %tratamiento = %configuracion{$id_actual}; 

   spurt $bitacora, "$id_actual\n", :append;
   #shell("%tratamiento{comando} %tratamiento{parametros} $archivo.%tratamiento{subconjunto}");
   say "%tratamiento{'comando'} %tratamiento{'parametros'} $archivo.%tratamiento{'subconjunto'}";
}

