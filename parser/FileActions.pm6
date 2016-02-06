use v6.c;

unit class FileActions is export;

method TOP($/){

    $/.make: $<element>.map(*.made);
};

method element($/){

    $/.make: $<attributes>.made;
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
