# Fraction Literals

A _Fraction_ is a number consisting of two integers, a numerator and a denominator.

Fractions may be written as literals using the syntax _numerator:denominator_.

```
3:4.asFloat = 0.75
2:3 = Fraction(2, 3)
7:6 > 1.1 = true
```

Fractions written using this syntax are _reduced_ by construction.

```
2:4 = 1:2
2:4 ~= Fraction(2, 4)
```
