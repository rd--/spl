# max

- _max([x₁ x₂ …])_
- _max(x₁, x₂)_

The unary form answers the maximum value in the collection.
The collection must be non-empty and contain compatible Magnitudes.

At `Range`:

```
>>> 1:10.max
10
```

At `List`:

```
>>> [4 1 7 2].max
7
```

It is an error if the collection is empty:

```
>>> { [].max }.ifError { true }
true
```

Evaluate symbolically:

```
>> [𝒙 𝒚 𝒛].max
(max (max x y) z)
```

The binary form answers whichever argument has the greater magnitude:

```
>>> 9.max(2)
9
```

The binary form allows vector operands:

```
>>> [1 3 5].max([5 3 1])
[5 3 5]
```

Largest element of an integer vector:

```
>>> [23 42 37 18 52].max
52
```

Largest `Complex` element of vector:

```
>>> [-2J2 4J1 -1J-3].max
4J1
```

Largest element in each matrix column:

```
>>> [8 1 6; 3 5 7; 4 9 2].max
[8 9 7]

>>> [8 1 6].max([3 5 7]).max([4 9 2])
[8 9 7]
```

Largest element in each matrix row:

```
>>> [1.7 1.2 1.5; 1.3 1.6 1.99].collect(max:/1)
[1.7 1.99]
```

See also `deepMax`:

```
>>> [8 1 6; 3 5 7; 4 9 2].deepMax
9
```

The cumulative maxima is the `scan` of `max`:

```
>>> [4 2 8 3 9 12 11 18 10]
>>> .scan(max:/2)
[4 4 8 8 9 12 12 18 18]
```

* * *

See also: ceiling, deepMax, maximalBy, maxOn, min

Guides: Sort Functions, Statistics Functions

References:
_Apl_
[1](https://aplwiki.com/wiki/Maximum),
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:max)
[2](https://hackage.haskell.org/package/base/docs/Prelude.html#v:maximum),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/gtdot#dyadic),
_Mathematica_
[1](https://mathworld.wolfram.com/Maximum.html)
[2](https://reference.wolfram.com/language/ref/Max.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/max.html),
_Python_
[1](https://docs.python.org/3/library/functions.html#max),
_Smalltalk_
5.6.1.6

Unicode: U+2308 ⌈ Left Ceiling

Categories: Statistics, Testing
