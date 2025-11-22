# pellLucasSequence

- _pellLucasSequence(n)_

Answer the first _n_ Pell-Lucas numbers.

The first eleven Pell-Lucas numbers,
OEIS [A002203](https://oeis.org/A002203):

```
>>> 11.pellLucasSequence
[2 2 6 14 34 82 198 478 1154 2786 6726]
```

There is a linear recurrence:

```
>>> linearRecurrence([2 1], [2 2], 11)
[2 2 6 14 34 82 198 478 1154 2786 6726]
```

Pell-Lucas numbers are always even:

```
>>> 33.pellLucasSequence
>>> .allSatisfy(isEven:/1)
true
```

* * *

See also: linearRecurrence, lucasSequence, pellSequence

Guides: Integer Sequence Functions, Mathematical Sequences

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Pell-LucasNumber.html),
_OEIS_
[1](https://oeis.org/A002203),
_W_
[1](https://en.wikipedia.org/wiki/Lucas_sequence)

Categories: Math, Sequence
