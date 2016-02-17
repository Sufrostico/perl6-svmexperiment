#!/usr/bin/env perl6
use v6.c;

use lib 'parser';
use process-config;

my %configuracion = parsear_archivo();

my $bitacora = "modelos.status";
my $archivo = "{%configuracion<general><dataset>}.train";
    
my @orden = @(%configuracion<orden>);

say %configuracion;

my %tratamiento;
my $paso = 2;
my $parametros = "";

spurt $bitacora, "";

for @orden -> $id_actual {

    say $id_actual;
    $paso = %configuracion{$id_actual}{"paso"};

    if %configuracion{$id_actual}<c> and %configuracion{$id_actual}<c> {
        $parametros = " -c {2**%tratamiento{'c'} } -g {2**%tratamiento{'g'}} "

    } else {
        $parametros = "";
    }

    if ( ($paso === Any) or ($paso <= 2 ) ) {

        %tratamiento = %configuracion{$id_actual}; 

        spurt $bitacora, "$id_actual\n", :append;

        #shell("svm-train -s0 -t2 $parametros $archivo.%tratamiento{'subconjunto'}");
        say "svm-train -s0 -t2 $parametros $archivo.%tratamiento{'subconjunto'}";
        say "\n";
    } 
}
