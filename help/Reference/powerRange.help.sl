
Generate a list of powers of 10 from 1 to 1 million:

```
>>> 1.powerRange(10 ^ 6, 10)
[1 10 100 1000 10000 100000 1000000]
```

Generate a list of powers of 2 less than a hundred:

```
>>> 1.powerRange(100, 2)
[1 2 4 8 16 32 64]
```

Specify a power other than 10:

```
>>> 10.powerRange(5000, 5)
[10 50 250 1250]
```

A range with negative numbers:

```
>>> -1.powerRange(-5000, 10)
[-1 -10 -100 -1000]
```

PowerRange produces lists whose elements have a constant ratio:

```
>>> let l = 1.powerRange(125, 5);
>>> (l, l.ratios)
([1 5 25 125], [5 5 5])
```

Range produces lists whose elements have a constant difference:

```
>>> let r = Range(0, 25, 5);
>>> (r.asList, r.differences)
([0 5 10 15 20 25], [5 5 5 5 5])
```

PowerRange produces an explicit list of values with a constant ratio:

```
>>> 5.powerRange(10000, 7)
[5 35 245 1715]
```

* * *

See also: ^, exp, Range, ratios

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/PowerRange.html)

