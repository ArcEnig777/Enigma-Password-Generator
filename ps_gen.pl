use strict;
use warnings;
use Getopt::Long;

my $len;
my $count = 1;
my $help = 0;

GetOptions(
    'len=i' => \$len,
    'count=i'  => \$count,
    'help'     => \$help,
);

if ($help) {
    print <<"HELP";
Password Generator
Usage: $0 [options]

Options:
    --len N       Password length (default: 8)
    --count N     Number of passwords to generate (default: 1)
    --help        Show this help message
HELP
    exit;
}

sub gen_pass {
    my $l = shift || 8;  # default 8
    
    my @chars = (
        'a'..'z',           # lowercase letters
        'A'..'Z',           # uppercase letters  
        '0'..'9',           # digits
        '!', '@', '#', '$', '%', '^', '&', '*', '-', '_', '+', '=', '|', ':', ';', '?'  # special characters
    );
    
    my $pass = '';
    for (1..$l) {
        $pass .= $chars[rand @chars];
    }
    
    return $pass;
}

# Generate and display a passwords
for my $i (1..$count){
    my $pass = gen_pass($len);
    print "Generated password $i: $pass\n";
}
