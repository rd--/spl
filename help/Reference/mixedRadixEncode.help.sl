# mixedRadixEncode

- _mixedRadixEncode(anInteger, bases)_

Given a list of _bases_ encode _anInteger_.
Mixed radix counting systems are common in calendrical calculations.

```
>>> 571.mixedRadixEncode([12 9 6])
[10 5 1]

>>> 534.mixedRadixEncode([15 10 5])
[10 6 4]

>>> 1084.mixedRadixEncode([17 15 11])
[6 8 6]

>>> 12345.mixedRadixEncode([7 24 60])
[1 1 13 45]
```

Encode can be used to convert a measure given in the smallest unit to a hierarchy of units.
For example, given that 1 day = 24 hours, 1 hour = 60 minutes, and 1 minute = 60 seconds, encode 210859 seconds:

```
>>> 210859.mixedRadixEncode([24 60 60])
[2 10 34 19]
```

The inverse is _mixedRadixDecode_.

```
>>> [10 5 1].mixedRadixDecode([12 9 6])
571

>>> [10 6 4].mixedRadixDecode([15 10 5])
534

>>> [6 8 6].mixedRadixDecode([17 15 11])
1084
```

A primorial number system uses a mixed radix of primes:

```
>>> (10 ^ 6).mixedRadixEncode([19 17 13 11 7 5 3 2])
[1 16 3 9 6 1 2 0]
```

A factorial number system uses a range of integers as mixed radix. The last digit is always 0:

```
>>> 437.mixedRadixEncode([6 5 4 3 2 1])
[3 3 0 2 1 0]
```

Construct a list from the names of tactical units in a Roman army.
A legion was made of 10 cohorts, a cohort of 6 centuries, a century of 10 contuberniae, and a contubernia of 8 soldiers.
Decompose a number of Roman soldiers in these tactical units:

```
>>> let units = ['legion' 'cohort' 'century' 'contubernia' 'soldier'];
>>> let bases = [10 6 10 8];
>>> units ->.each 16894.mixedRadixEncode(bases)
['legion' -> 3, 'cohort' -> 5, 'century' -> 1, 'contubernia' -> 1, 'soldier' -> 6]
```

Conversely, the number of soldiers in a legion:

```
[1 0 0 0 0].mixedRadixDecode([10 6 10 8])
4800
```

The digit at a given position can be between 0 and the corresponding base minus one:

```
>>> (10 * 9 * 8 * 7 - 1).mixedRadixEncode([10 9 8 7])
[9 8 7 6]
```

The next number will need one more digit:

```
>>> (10 * 9 * 8 * 7).mixedRadixEncode([10 9 8 7])
[1 0 0 0 0]
```

An empty list of bases is effectively equivalent to the list [inf]:

```
>>> 1000.mixedRadixEncode([])
[1000]
```

Counter in mixed radix counting system:

```
>>> let b = [4 2 3];
>>> let i = [0 .. 4 * 2 * 3 - 1];
>>> i.collect { :each | each.mixedRadixEncode(b) }.collect { :each | each.mixedRadixDecode(b) }
i
```

Solving permutation puzzles, ie. <https://xkcd.com/287/>:

```
>>> let prices = [215 275 335 355 420 580];
>>> let total = 1505;
>>> let factors = total // prices + 1;
>>> let entries = (0 .. factors.product - 1);
>>> let encode = { :z | z.mixedRadixEncode(factors) };
>>> entries.select { :each | (each.encode * prices).sum = 1505 }.collect { :each | each.encode }
[1 0 0 2 0 1; 7 0 0 0 0 0]
```

See also: mixedRadixDecode

References:
_Apl_
[1](https://aplwiki.com/wiki/Encode),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/numberdot#dyadic),
_Mathematica_
[1](http://mathworld.wolfram.com/Base.html)
[2](https://reference.wolfram.com/language/ref/MixedRadix.html)
