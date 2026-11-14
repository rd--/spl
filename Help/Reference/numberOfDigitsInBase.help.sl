# numberOfDigitsInBase

- _numberOfDigitsInBase(n, r)_

Answer how many digits are necessary to print the number _n_ in radix _r_.
This does not count any place for minus sign or radix prefix.

Base ten:

```
>>> [1L 10L 100L 1000L 10000L].collect { :each |
>>> 	each.numberOfDigitsInBase(10L)
>>> }
[1 2 3 4 5]
```

Negative numbers, E-notation:

```
>>> [-1 -1E1 -1E2 -1E3 -1E4].L.collect { :each |
>>> 	each.numberOfDigitsInBase(10L)
>>> }
[1 2 3 4 5]
```

Base two:

```
>>> [
>>> 	1L 2L 4L 8L 16L
>>> 	32L 64L 128L 256L
>>> ].collect { :each |
>>> 	each.numberOfDigitsInBase(2L)
>>> }
[1 2 3 4 5 6 7 8 9]
```

Negative numbers:

```
>>> [
>>> 	-1L -2L -4L -8L -16L
>>> 	-32L -64L -128L -256L
>>> ].collect { :each |
>>> 	each.numberOfDigitsInBase(2L)
>>> }
[1 2 3 4 5 6 7 8 9]
```

At `Integer`:

```
>>> 52L.factorial
>>> .numberOfDigitsInBase(10L)
68

>> 52L.factorial
80658175170943878571660
63685640376697528950544
0883277824000000000000L
```

* * *

See also: integerLength, printString

Guides: Integer Functions
