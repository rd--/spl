# splitPlaces

- _splitPlaces([x₁ x₂ …], [n₁ n₂ …])_

Split the sequence _x_ into parts,
each of _n_ places.

The numbers from one to ten in groups of one, three, two and four items:

```
>>> [1 .. 10].splitPlaces([1 3 2 4])
[
	1;
	2 3 4;
	5 6;
	7 8 9 10
]
```

If _x_ has more places than the sum of _n_,
the remaining items of _x_ are discarded,
and the answer cannot be joined together to form _x_:

```
>>> [1 .. 13].splitPlaces([1 3 2 4])
[1; 2 3 4; 5 6; 7 8 9 10]
```

If there are too few places it is an error:

```
>>> {
>>> 	[1 .. 9].splitPlaces([1 3 2 4])
>>> }.hasError
true
```

Sums of increasing subsequences of the odd numbers are the successive cubes,
OEIS [A000578](https://oeis.org/A000578):

```
>>> 1:131:2.splitPlaces(1:11)
>>> .collect(sum:/1)
[1 8 27 64 125 216 343 512 729 1000 1331]

>>> 1:11.cube
[1 8 27 64 125 216 343 512 729 1000 1331]
```

Sums of increasing subsequences of the even numbers,
from zero,
OEIS [A007531](https://oeis.org/A007531):

```
>>> 0:108:2.splitPlaces(1:10)
>>> .collect(sum:/1)
[0 6 24 60 120 210 336 504 720 990]

>>> let n = 1:10;
>>> n.cube - n
[0 6 24 60 120 210 336 504 720 990]

>>> let n = 0:9;
>>> (3 * n * (n + 1)).prefixSum
[0 6 24 60 120 210 336 504 720 990]

>>> let n = 0:11;
>>> n.! / (n - 3).!
[0 0 0 6 24 60 120 210 336 504 720 990]
```

Sums of increasing subsequences of the even numbers,
from two,
OEIS [A034262](https://oeis.org/A034262):

```
>>> [2, 4 .. 110].splitPlaces([1 .. 10])
>>> .collect(sum:/1)
[2 10 30 68 130 222 350 520 738 1010]

>>> let n = 1:10;
>>> n.cube + n
[2 10 30 68 130 222 350 520 738 1010]
```

* * *

See also: partition, split, splitBy

Guides: List Functions

References:
_Haskell_
[1](https://hackage.haskell.org/package/split/docs/Data-List-Split.html#v:splitPlaces)
