# LsSeries

- _LsSeries(start, step, length)_

Arithmetic series from _start_, incrementing by _step_, for _length_ places.

```
>>> LsSeries(1, 1, 9).upToEnd
[1 .. 9]
```

With infinite length:

```
let p = LsSeries(1, 3, inf);
let q = LsSeries(3, 5, inf);
p.next(4) ++ q.next(4)
[1 4 7 10 3 8 13 18]
```

Non-cubical squares:

~~~
>>> let powers = { :m |
>>> 	LsSeries(0, 1, inf) ^ m
>>> };
>>> let squares = powers(2);
>>> let cubes = powers(3);
>>> let uncubicalSquares = squares.reject { :each |
>>> 	{
>>> 		each <= cubes.peek
>>> 	}.whileFalse {
>>> 		cubes.next
>>> 	};
>>> 	each = cubes.peek
>>> };
>>> uncubicalSquares
>>> .drop(20)
>>> .take(9)
>>> .upToEnd
[529 576 625 676 784 841 900 961 1024]
~~~

* * *

See also: LsGeom, LsUnfold

Guides: Patterns and Streams

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Pseries.html)

Categories: Stream
