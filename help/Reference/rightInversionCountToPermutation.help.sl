# rightInversionCountToPermutation

- _rightInversionCountToPermutation(aSequence)_

Answer a permutation given its right inversion count, also called the Lehmer code.

The inverse is `rightInversionCount`:

```
>>> [1 0 2 1 0].rightInversionCountToPermutation
[2 1 5 4 3].asPermutation

>>> [2 1 5 4 3].rightInversionCount
[1 0 2 1 0]
```

* * *

See also: Permutation, rightInversionCount

References:
_Sage_
[1](https://doc.sagemath.org/html/en/reference/combinat/sage/combinat/permutation.html#sage.combinat.permutation.from_lehmer_code)
