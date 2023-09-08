# Fraction -- arithmetic

- _Fraction(numerator, denominator)_

Fraction provides methods for dealing with fractions like 1/3 as a ratio of two integers.

Instance variables are:

- numerator<Integer>: the number appearing before the fraction bar (above)
- denominator<Integer>: the number appearing after the fraction bar (below)

A Fraction is generally created by writing it using the literal syntax _1:3_.

	1:3 = Fraction(1, 3)
	3:4.SmallFloat = 0.75
	7:6 > 1.1 = true

Fractions written using this syntax are _reduced_ by construction.

	2:4 = 1:2
	2:4 ~= Fraction(2, 4)

Literal fractions are _normalized_ and have the following invariants:

- the denominator shall allways be positive
- the numerator and denominator shall never have common multiples

Properly reduced fractions have the additional invariant:

- the denominator shall allways be greater than 1

For instance:

	Fraction(3, -2).reduced = Fraction(-3, 2)
	Fraction(2, 1).reduced = 2
	8:6 = Fraction(4, 3)

A Fraction that does not conform to above invariants could be the cause of undefined behavior and unexpected results.

The message _normalized:/1_ obtains a normal Fraction.
The message _reduced:/1_ obtains a normal Fraction or an Integer.

Note that Fraction and Integer represent together the set of Rational numbers:

- Integer is a subset of rational (those which are whole numbers)
- Fraction is used for representing the complementary subset of rational (those which are not whole numbers)

	2:3 + 2:3 = 4:3
	2:3 + 1:2 = 7:6
	2:3 + 4:3 = 2
	2:3.raisedToInteger(5) = 32:243

A Fraction whose elements are of type SmallFloat will have odd behaviour for large components,
a Fraction whose elements are of type LargeInteger will have behave ordinarily.

	| x = Fraction(2 ^ 55, 2); | x ~= (x - 1) = false
	| x = Fraction(2n ^ 55n, 2); | x ~= (x - 1)

_Note:_
The _Fraction_ package re-defines _asNumber_ to call either _parseFraction_ or _parseNumber_ as appropriate.

* * *

See also: denominator, [Fraction Literals], numerator, reduced
