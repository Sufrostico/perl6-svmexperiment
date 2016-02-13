#!/usr/bin/env perl6
use v6.c;

use lib 'parser';
use process-config;

my %configuracion = parsear_archivo();

my $bitacora = "predicción.status";
my $archivo = "{%configuracion<general><dataset>}.train";

# Plan de ejecución para predicciones
my @orden = <gwo-55-2 gwo-55-3 malla-2 malla-5 gwo-55-4 gwo-55-1 gwo-165-5
        gwo-165-4 gwo-165-3 gwo-110-4 gwo-110-1 gwo-55-5 gwo-110-2 gwo-110-3
        gwo-165-2 gwo-165-1 malla-1 malla-3 gwo-110-5 malla-4>;

# vacía la bitácora
spurt $bitacora, "";

# Ejecuta las predicciones
for @orden -> $id_actual {

    say "$id_actual";

   %tratamiento = %configuracion{$id_actual}; 

    spurt $bitacora, "$id_actual\n", :append;
    shell("svm-predict $archivo.%tratamiento{'subconjunto'} $id_actual.model $id_actual.predict");
    say "\n";
}

# Default 1
say "Default 1";
spurt "exp-predicciones.current", "Default 1\n", :append;
shell("svm-predict 2CTASSCasasola.test.1 default-1.model default-1.predict");
say "\n";

# Default 2
say "Default 2";
spurt "exp-predicciones.current", "Default 2\n", :append;
shell("svm-predict 2CTASSCasasola.test.2 default-2.model default-2.predict");
say "\n";

# Default 3
say "Default 3";
spurt "exp-predicciones.current", "Default 3\n", :append;
shell("svm-predict 2CTASSCasasola.test.3 default-3.model default-3.predict");
say "\n";

# Default 4
say "Default 4";
spurt "exp-predicciones.current", "Default 4\n", :append;
shell("svm-predict 2CTASSCasasola.test.4 default-4.model default-4.predict");
say "\n";

# Default 5
say "Default 5";
spurt "exp-predicciones.current", "Default 5\n", :append;
shell("svm-predict 2CTASSCasasola.test.5 default-5.model default-5.predict");
say "\n";


