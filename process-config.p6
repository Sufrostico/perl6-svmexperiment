use v6.c;

use lib 'parser';

use FileActions;
use FileGrammar;

# Test para probar cómo funcionan las gramáticas

my $texto = slurp "config";
my $a = FileActions.new(); 
my $parser = FileGrammar.subparse($texto, :actions($a));

 $parser.made;
