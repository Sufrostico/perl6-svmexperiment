use v6.c;

unit grammar FileGrammar is export;

    token TOP { 
        <element> [<element-separator><element>]*
    }

    token element {
        '[' ' '* <identifier> [' '+ <identifier> ] ** 0..1 ' '*  ']' \n [ <attributes> | <order-list> ] 
    }

    token order-list {
        <identifier> [ \n <identifier> ]* 
    }

    token attributes {
        <attribute> [<attribute-separator> <attribute>]*
    }

    token attribute {
        <identifier> ' = ' <value>
    }

    token identifier { <[\w-]>+ }
    token value { <-["\\\t\n]>+ }

    token attribute-separator { \n }
    token element-separator { <empty-line> }
    token empty-line { \n\n }
