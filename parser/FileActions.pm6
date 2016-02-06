use v6.c;

unit class FileActions is export;

method TOP($/){
    make $/<element>.map(*.made);
}

method element($/){
    make $/<attributes>.made;
}

method attributes($/){
    my @atributos = $/<attribute>.map(*.made);

    my %resultado;

    for @atributos -> @atributo {

        %resultado{@atributo[0]} = @atributo[1];
    }

    make %resultado;
}

method attribute($/) {
    make @( $/<identifier>.made, $/<value>.made);
}

method identifier($/) {
    make ~$/;

}

method value($/) {
    make ~$/;
}
