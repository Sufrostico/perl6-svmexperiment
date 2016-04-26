#!/usr/bin/env perl6
use v6.c;


if @*ARGS.elems < 1 {
    die "Necesita, al menos, un nombre del archivo como argumento";
}


for @*ARGS ->  $file {

    say $file;

    say "mv $file $file.libsvm";
    shell("mv $file $file.libsvm");

# Elimina el primer elemento y lo guarda a formato arff
    say "java -cp ~/wekaexamples/dist/weka.jar weka.filters.unsupervised.attribute.Remove -R 1 -i $file.libsvm -o $file.arff -c first";
    shell("java -cp ~/wekaexamples/dist/weka.jar weka.filters.unsupervised.attribute.Remove -R 1 -i $file.libsvm -o $file.arff -c first");

# Convierte de ARFF a LIBSVM
    say "java -cp ~/wekaexamples/dist/weka.jar weka.core.converters.LibSVMSaver -i $file.arff -o {$file}_new.libsvm";
    shell("java -cp ~/wekaexamples/dist/weka.jar weka.core.converters.LibSVMSaver -i $file.arff -o {$file}_new.libsvm");

}

