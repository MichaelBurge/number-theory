#!/usr/bin/perl
use Math::BigInt;
use bignum;

sub right_left_binary {
    my ($g, $n) = @_;
    # Step 1
    my $y = 1;
    return $y if $n->is_zero();
    my ($N, $z);
    if ($n < 0) {
	$N = -$n;
	$z = -$g;
    } else {
	$N = $n;
	$z = $g;
    }
    # Step 2
  step2:
    $y = $y->bmul($z) if $N->is_odd();
    # Step 3
    $N = $N->bdiv(2)->bfloor();
    return $y if $N->is_zero();
    $z = $z->bmul($z);
    goto step2;
}

my $a = Math::BigInt->new(5);
my $n = Math::BigInt->new(5);

print right_left_binary($a, $n);
