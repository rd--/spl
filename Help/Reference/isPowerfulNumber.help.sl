# isPowerfulNumber

- _isPowerfulNumber(anInteger)_

A powerful number is the product of a square and a cube.
Powerful numbers are also known as squareful.

There are an infinite number of powerful numbers, OEIS A001694:

```
>>> 1:100.select(isPowerfulNumber:/1)
[1 4 8 9 16 25 27 32 36 49 64 72 81 100]
```

The numbers of powerful numbers `<=` _(10 ^ 1:4)_, OEIS A118896:

```
>>> 1:4.collect { :each |
>>> 	(1 .. 10 ^ each).select(
>>> 		isPowerfulNumber:/1
>>> 	).size
>>> }
[4 14 54 185]
```

There are infinitely many pairs of consecutive powerful numbers, OEIS A060355:

```
>>> 1:1000.select { :each |
>>> 	each.isPowerfulNumber & {
>>> 		(each + 1).isPowerfulNumber
>>> 	}
>>> }
[8 288 675]
```

* * *

See also: isSquareFree

Guides: Integer Sequences

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PowerfulNumber.html),
_OEIS_
[1](http://oeis.org/A001694)
[2](http://oeis.org/A118896)
[3](http://oeis.org/A060355),
_W_
[1](https://en.wikipedia.org/wiki/Powerful_number)

Categories: Testing, Math
