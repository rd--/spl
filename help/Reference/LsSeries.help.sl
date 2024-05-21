# LsSeries

- _LsSeries(start, step, length)_

Arithmetic series from _start_, incrementing by _step_, for _length_ places.

```
>>> LsSeries(1, 1, 9).upToEnd
[1 .. 9]
```

Non-cubical squares:

~~~
>>> let powers = { :m | LsSeries(0, 1, inf) ^ m };
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
>>> uncubicalSquares.drop(20).take(10).upToEnd
[529 576 625 676 784 841 900 961 1024 1089]
~~~

* * *

See also: LsGeom, LsUnfold
