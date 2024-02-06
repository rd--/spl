# over

_over(aBlock:/2, anotherBlock:/1)_

Answer a Block that applies _anotherBlock_ to pre-processes the arguments of _aBlock_.

The pointwise maxima of the negation of two lists:

```
>>> max:/2.over(negated:/1) . ([3 1 2], [4 6 5])
[-3 -1 -2]

>>> let x = [3 1 2];
>>> let y = [4 6 5];
>>> x.negated.max(y.negated)
[-3 -1 -2]
```

Add the max of two lists:

```
>>> +.over(max:/1) . ([3 1 2], [4 6 5])
9

>>> let x = [3 1 2];
>>> let y = [4 6 5];
>>> x.max + y.max
9
```

* * *

See also: atop

References:
_Apl_
[1](https://aplwiki.com/wiki/Over)
