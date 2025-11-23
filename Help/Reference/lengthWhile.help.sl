# lengthWhile

- _lengthWhile([x₁ x₂ …], f:/1)_

Answer the number of contiguous elements starting at the beginning of the list _x_ for which the predicate _f_ is `true`.

Find the length of the run of elements below 10:

```
>>> [1 1 2 3 5 8 13 21]
>>> .lengthWhile { :x |
>>> 	x < 10
>>> }
6
```

Elements of the list can be any expression:

```
>>> [1 2I 3.4 5/6 7E8]
>>> .lengthWhile { :x |
>>> 	x.isFraction.not
>>> }
3
```

Find the length of the run of digits in π before a seven occurs:

```
>>> let [d, _] = 1.pi.realDigits(10, 15);
>>> d.lengthWhile { :x | x != 7 }
13
```

* * *

See also: anySatisfy, size, takeWhile

Guides: List Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/LengthWhile.html)
