use v6.c;

use FileActions;
use FileGrammar;

# Test para probar cómo funcionan las gramáticas
sub parsear_archivo() is export {

    my $texto = slurp "config";
    my $a = FileActions.new(); 
    my $parser = FileGrammar.subparse($texto, :actions($a));

    my  %res =   $parser.made;

    return %res;
}
