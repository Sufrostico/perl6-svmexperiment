#!/usr/bin/env perl6
use v6.c;

use lib 'parser';
use process-config;

my %configuracion = parsear_archivo();

my $bitacora = "modelos.status";
my $archivo = "{%configuracion<general><dataset>}.train";

    
my @orden = @(%configuracion<orden>);


my %tratamiento;
my $paso = 2;
my $parametros = "";

spurt $bitacora, "";

for @orden -> $id_actual {

    say $id_actual;
    $paso = %configuracion{$id_actual}{"paso"};

    %tratamiento = %configuracion{$id_actual}; 

    if %configuracion{$id_actual}<paso2-c> and %configuracion{$id_actual}<paso2-g> {
        $parametros = " -c {2**%tratamiento{'paso2-c'} } -g {2**%tratamiento{'paso2-g'}} "

    } else {
        $parametros = "";
    }

    if ( ($paso <= 2 ) ) {

        %tratamiento = %configuracion{$id_actual}; 

        spurt $bitacora, "$id_actual\n", :append;

        say "%tratamiento{'paso2-comando'} $parametros $archivo.%tratamiento{'subconjunto'} $id_actual.model";
        shell("%tratamiento{'paso2-comando'} $parametros $archivo.%tratamiento{'subconjunto'} $id_actual.model");
        say "\n";
    } 
}
