# sequenceCount

- _sequenceCount(l, x)_

Answer the number of times _x_ appears as a sublist of the list _l_.

Count the number of appearances of a sublist:

```
>>> [1 2 1 2 1 2].sequenceCount([1 2])
3
```

Count the number of appearances of a pattern sequence:

Count sequences of integers in a list:

```
>>> let r = Sfc32(789124);
>>> [1 .. 10].randomChoice(r, [10 ^ 3])
>>> .sequenceCount([3 .. 5])
4
```

* * *

See also: count, sequencePosition

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/SequenceCount.html)
