use v6.c;

unit class FileActions is export;

method TOP($/){
    $/.make: $<element>.map(*.made);
};

method element($/){
    
    my %resultado;
    my %atributos;
    my @orden-ejecución;

    # Extrae el nombre del elemento
    my $llave = $/<identifier>».made;
    $llave = $llave.pop;

    if $/<order-list> === Nil {

        # Saca los atributos
        %atributos = $<attributes>.made; 

        # Los asigna
        %resultado{$llave} = %atributos;

    } else {

        $/<identifier>;
        say "Si es un order list";

        # Saca el orden de ejecución
        @orden-ejecución =  $<order-list>.made;

        # Asigna el orden de ejecución  
        %resultado{$llave} = @orden-ejecución;

    }


    make %resultado;
};

method order-list($/) {

    $/.make: $<identifier>.map(*.made);
}

method attributes($/){

    $/.make: $<attribute>.map(*.made);
};

method attribute($/) {

    $/.make: $<identifier>.made => $<value>.made;
};

method identifier($/) {
    make ~$/;
};

method value($/) {

    make ~$/;
};
