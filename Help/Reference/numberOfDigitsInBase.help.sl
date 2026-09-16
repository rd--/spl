# numberOfDigitsInBase

- _numberOfDigitsInBase(n, r)_

Answer how many digits are necessary to print the number _n_ in radix _r_.
This does not count any place for minus sign or radix prefix.

Base ten:

```
>>> [1 10 100 1000 10000].collect { :each |
>>> 	each.numberOfDigitsInBase(10)
>>> }
[1 2 3 4 5]
```

Negative numbers, E-notation:

```
>>> [-1 -1E1 -1E2 -1E3 -1E4].collect { :each |
>>> 	each.numberOfDigitsInBase(10)
>>> }
[1 2 3 4 5]
```

Base two:

```
>>> [
>>> 	1 2 4 8 16
>>> 	32 64 128 256
>>> ].collect { :each |
>>> 	each.numberOfDigitsInBase(2)
>>> }
[1 2 3 4 5 6 7 8 9]
```

Negative numbers:

```
>>> [
>>> 	-1 -2 -4 -8 -16
>>> 	-32 -64 -128 -256
>>> ].collect { :each |
>>> 	each.numberOfDigitsInBase(2)
>>> }
[1 2 3 4 5 6 7 8 9]
```

At `LargeInteger`:

```
>>> 52.factorial
>>> .numberOfDigitsInBase(10)
68

>> 52.factorial
80658175170943878571660
63685640376697528950544
0883277824000000000000L
```

* * *

See also: integerLength, printString
