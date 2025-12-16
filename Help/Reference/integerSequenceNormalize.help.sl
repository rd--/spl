# integerSequenceNormalize

- _integerSequenceNormalize([n₁ n₂ …])_

Rewrite the integer sequence _n_ so that it consists of consecutive integers.
The first item at _n_, _n₁_, is set to _1_,
the next distinct item is set to _2_,
the next to _3_,
and so on.

Normalize a sequence that contains only odd numbers in _1,7_,
the answer lies in _1,4_:

```
>>> [1 7 5 3 1 5 3 7]
>>> .integerSequenceNormalize
[1 2 3 4 1 3 4 2]
```

The first item is set to one,
normalize a sequence of odd numbers between _-7,7_,
the answer lies in _1,8_:

```
>>> [5 -1 1 3 -3 -7 1 -3 7 -5]
>>> .integerSequenceNormalize
[1 2 3 4 5 6 3 5 7 8]
```

If there are no repetitions of items the answer is the progression _1:m_ where _m_ is the length of the sequence:

```
>>> [5 -1 3 -7 1 -3 7 -5]
>>> .integerSequenceNormalize
[1 2 3 4 5 6 7 8]
```

If the sequence terms are in order and the least term is one,
then normalizing is equivalent to compressing with `integerSequenceCompress`:

```
>>> [1 3 5 3 1 3]
>>> .integerSequenceNormalize
[1 2 3 2 1 2]

>>> [1 3 5 3 1 3]
>>> .integerSequenceCompress
[1 2 3 2 1 2]
```

* * *

See also: integerSequenceCompress

Guides: Integer Sequence Functions
