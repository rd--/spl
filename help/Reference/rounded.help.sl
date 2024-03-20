# rounded

- _rounded(aNumber)_

Answer the integer nearest _aNumber_.

```
>>> 0.9.rounded
1

>>> 1.rounded
1

>>> 1.1.rounded
1

>>> -1.9.rounded
-2

>>> -2.rounded
-2

>>> -2.1.rounded
-2

>>> 1.5.rounded
2

>>> -1.5.rounded
-1
```

Threads elementwise over lists:

```
>>> [e pi].rounded
[3 3]
```

The definition is ambiguous for half-integers,
the implementation follows Smalltalk and truncates:

```
>>> [1.5 2.5 3.5 4.5].rounded
[2 3 4 5]

>>> [-1.5 -2.5 -3.5 -4.5].rounded
[-1 -2 -3 -4]
* * *

See also: ceiling, floor, roundTo

References:
_Smalltalk_
5.6.2.31

Categories: Truncating, Rounding
