# raisedToInteger

- _raisedToInteger(aNumber, anInteger)_

Special case of _^_ where the exponent is an integer.

An exponent of `zero` answers one of the correct type:

```
>>> system.nextRandomFloat ^ 0
1.0

>>> 7/9 ^ 0
1/1

>>> 7J9 ^ 0
1J0

>>> 3.141D ^ 0
1.000D
```

An exponent of one answers _aNumber_:

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
>>> (-1 .. -9).collect { :each |
>>> 	3.raisedToInteger(each)
>>> }
1 / [3 9 27 81 243 729 2187 6561 19683]

>>> (-1 .. -9).collect { :each |
>>> 	3 ^ each
>>> }
1 / [3 9 27 81 243 729 2187 6561 19683]
```

At `LargeInteger`:

```
>>> (2n ^ 54) ^ 2
324518553658426726783156020576256n

>>> 23n.raisedToInteger(23n)
20880467999847912034355032910567n
```

* * *

See also: ^

References:
_Smalltalk_
5.6.2.28
