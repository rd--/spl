# raisedToInteger

- _raisedToInteger(n, m)_

Special case of `^` where the exponent is an integer.
Works by successive squaring.

At `Integer`:

```
>>> 3.raisedToInteger(2)
9

>>> 3 ^ 2
9
```

At `SmallFloat`:

```
>>> 2.5 ^ 9
3814.7

>>> 2.5.square.square.square * 2.5
3814.7
```

At `Fraction`:

```
>>> 5/2 ^ 9
1953125/512

>>> 5/2.square.square.square * 5/2
1953125/512

>>> 1/1 ^ 9
1/1
```

An exponent of `zero` answers `one` of the correct type:

```
>>> system.nextRandomFloat ^ 0
1.0

>>> 23 ^ 0
1

>>> 7/9 ^ 0
1/1

>>> 7J9 ^ 0
1J0

>>> 3.141D ^ 0
1.000D
```

An exponent of `one` answers _n_:

```
>>> let n = system.nextRandomFloat;
>>> n ^ 1
n

>>> 2J3 ^ 1
2J3
```

Three raised to integers one through nine:

```
>>> 1:9.collect { :each |
>>> 	3.raisedToInteger(each)
>>> }
[3 9 27 81 243 729 2187 6561 19683]

>>> 1:9.collect { :each |
>>> 	3 ^ each
>>> }
[3 9 27 81 243 729 2187 6561 19683]
```

Negative exponents:

```
>>> [-1, -2 .. -9].collect { :each |
>>> 	3.raisedToInteger(each)
>>> }
1 / [3 9 27 81 243 729 2187 6561 19683]

>>> [-1, -2 .. -9].collect { :each |
>>> 	3 ^ each
>>> }
1 / [3 9 27 81 243 729 2187 6561 19683]
```

At, and or answering, `LargeInteger`:

```
>>> (2 ^ 54) ^ 2
324518553658426726783156020576256L

>>> 23.raisedToInteger(23)
20880467999847912034355032910567L
```

* * *

See also: ^, power, raisedToFraction

Guides: Mathematical Functions

References:
_Smalltalk_
5.6.2.28
