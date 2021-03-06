package GTEx_v2;

use strict;
use warnings;
use Carp;

sub load_data {
    my ($annotations_href, $gtex_normals) = @_;

    print STDERR "-parsing GTEx_v2 $gtex_normals\n";
    
    open (my $fh, $gtex_normals) or confess "Error, cannot open file $gtex_normals";

    while (<$fh>) {
        chomp;
        my ($fusion, $num_normals, $pct_normals) = split(/\t/);
            
        $annotations_href->{$fusion}->{"GTEx_v2:$num_normals=$pct_normals%"} = 1;
    }
    close $fh;
    
    return;
}


1; #EOM


    
