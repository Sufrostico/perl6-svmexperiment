use v6.c;

unit class FileActions is export;

method TOP($/){
    $/.make: $<element>.map(*.made);
};

method element($/){
    # say "  -> {$/<identifier>».made}";
    # $/.make: $<attributes>.made;
    
    my %resultado;
    my %atributos = $<attributes>.made; 
    my $llave = $/<identifier>».made;
    say $llave;

    %resultado{$llave} = %atributos;

    make %resultado;
};

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
