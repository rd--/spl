# numberOfDigitsInBase

- _numberOfDigitsInBase(aNumer, radix)_

Answer how many digits are necessary to print _aNumber_ in base _radix_.
This does not count any place for minus sign or radix prefix.

Base ten:

```
>>> [1 10 100 1000 10000].collect { :each |
>>> 	each.numberOfDigitsInBase(10)
>>> }
[1 2 3 4 5]
```

Negative numbers:

```
>>> [-1 -10 -100 -1000 -10000].collect { :each |
>>> 	each.numberOfDigitsInBase(10)
>>> }
[1 2 3 4 5]
```

Base two:

```
>>> [1 2 4 8 16 32 64 128 256].collect { :each |
>>> 	each.numberOfDigitsInBase(2)
>>> }
[1 2 3 4 5 6 7 8 9]
```

Negative numbers:

```
>>> [-1 -2 -4 -8 -16 -32 -64 -128 -256].collect { :each |
>>> 	each.numberOfDigitsInBase(2)
>>> }
[1 2 3 4 5 6 7 8 9]
```

* * *

See also: integerLength, printString
