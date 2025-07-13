# euclidsFormula

- _euclidsFormula(m, n)_

Answer a Pythagorean triple given an arbitrary pair of integers with _m>n>0_.
If _m_ and _n_ are coprime the answer is a primitive Pythagorean triple.

The archetypal Pythagorean triple:

```
>>> euclidsFormula(2, 1)
[3 4 5]
```

A non-primitive triple:

```
>>> euclidsFormula(3, 1)
[8 6 10]

>>> euclidsFormula(3, 1) / 2
[4 3 5]
```

If _m_ and _n_ are consecutive Pell numbers, _a_ and _b_ will differ by one:

```
>>> 2:10.collect { :i |
>>> 	let m = i.pellNumber;
>>> 	let n = (i - 1).pellNumber;
>>> 	euclidsFormula(m, n)
>>> }
[
	3 4 5;
	21 20 29;
	119 120 169;
	697 696 985;
	4059 4060 5741;
	23661 23660 33461;
	137903 137904 195025;
	803761 803760 1136689;
	4684659 4684660 6625109
]
```

* * *

See also: isPrimitivePythagoreanTriple, isPythagoreanTriple

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PythagoreanTriple.html),
_W_
[1](https://en.wikipedia.org/wiki/Pythagorean_triple)
