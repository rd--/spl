# integerSequenceCompress

- _integerSequenceCompress([n₁ n₂ …])_

Rewrite the integer sequence _n_ so that it consists of consecutive integers.
The least item at _n_, _l_, is retained,
the next least item is set to _l+1_,
the next least to _l+2_ and so on.

Compress a sequence that contains only odd numbers in _1,7_,
the answer lies in _1,4_:

```
>>> [1 7 5 3 1 5 3 7]
>>> .integerSequenceCompress
[1 4 3 2 1 3 2 4]
```

The least item remains equal,
compress a sequence of odd numbers between _-7,7_,
the answer lies in _-7,0_:

```
>>> [5 -1 3 -7 1 -3 7 -5]
>>> .integerSequenceCompress
[-1 -4 -2 -7 -3 -5 0 -6]
```

If the sequence terms are in order and the least term is one,
then compressing is equivalent to normalizing with `integerSequenceNormalize`:

```
>>> [1 3 5 3 1 3]
>>> .integerSequenceCompress
[1 2 3 2 1 2]

>>> [1 3 5 3 1 3]
>>> .integerSequenceNormalize
[1 2 3 2 1 2]
```

If the sequence has no gaps the compression is identical to the original sequence:

```
>>> [3 5 4 1 2]
>>> .integerSequenceCompress
[3 5 4 1 2]
```

* * *

See also: integerSequenceNormalize

Guides: Integer Sequence Functions
