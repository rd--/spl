# pellLucasNumbers

- _pellLucasNumbers(anInteger)_

Answer the first _anInteger_ Pell-Lucas numbers.

The first eleven Pell-Lucas numbers (OEIS A002203):

```
>>> 11.pellLucasNumbers
[2 2 6 14 34 82 198 478 1154 2786 6726]
```

Pell-Lucas numbers are always even:

```
>>> 33.pellLucasNumbers.allSatisfy(isEven:/1)
true
```

* * *

See also: linearRecurrence, lucasNumbers, pellNumbers

Guides: Mathematical Sequences

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Pell-LucasNumber.html),
_OEIS_
[1](https://oeis.org/A002203)

Categories: Math, Sequence
