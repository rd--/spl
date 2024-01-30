# Fraction Literals

A _Fraction_ is a number consisting of two integers, a numerator and a denominator.

Fractions may be written as literals using the syntax _numerator/denominator_,
i.e. `3/4` or `2/3`.

The rewrite rule is _n/d => Fraction(n, d).normalized_.

If the Fraction package is not installed, the SmallFloat package can implement Fraction as / and normalized as identity.

* * *

See also: Fraction
