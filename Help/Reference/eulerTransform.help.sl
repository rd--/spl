# eulerTransform

- _eulerTransform(f:/1)_

Implement the third type of Euler transform,
defining a relationship between certain types of integer sequences.

The Euler transform of the identity function counts the number of planar partitions,
OEIS [A000219](https://oeis.org/A000219):

```
>>> 0:23.collect(
>>> 	identity:/1.eulerTransform
>>> )
[
	    1      1      3      6     13
	   24     48     86    160    282
	  500    859   1479   2485   4167
	 6879  11297  18334  29601  47330
	75278 118794 186475 290783
]
```

The Euler transform of the square function,
OEIS [A023871](https://oeis.org/A023871):

```
>>> 0:9.collect(
>>> 	square:/1.eulerTransform
>>> )
[1 1 5 14 40 101 266 649 1593 3765]
```

Euler transform of the power of two function,
OEIS [A034899](https://oeis.org/A034899):

```
>>> 0:9.collect(
>>> 	{ :x | 2 ^ x }.eulerTransform
>>> )
[1 2 7 20 59 162 449 1200 3194 8348]
```

Euler transform of the Fibonacci function,
OEIS [A166861](https://oeis.org/A166861):

```
>>> 0:23.collect(
>>> 	fibonacci:/1.eulerTransform
>>> )
[
	     1      1      2       4     8
	    15     30     56     108   203
	   384    716   1342    2487  4614
	  8510  15675  28749   52652 96102
	175110 318240 577328 1045068
]
```

* * *

See also: binomialTransform, boustrophedonTransform, divisors, memoize, sum

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/EulerTransform.html),
_OEIS_
[1](https://oeis.org/A000219)
[2](https://oeis.org/A023871)
[3](https://oeis.org/A034899)
[4](https://oeis.org/A166861)
