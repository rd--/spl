# doubleFactorial -- math

- _doubleFactorial(anInteger)_

The product of the positive integers of equal parity up to _anInteger_.

For even numbers (<http://oeis.org/A000165>):

	(0, 2 .. 14).collect(doubleFactorial:/1) = [1, 2, 8, 48, 384, 3840, 46080, 645120]
	14.doubleFactorial = (2, 4 .. 14).product

For odd numbers (<http://oeis.org/A001147>):

	(1, 3 .. 13).collect(doubleFactorial:/1) = [1, 3, 15, 105, 945, 10395, 135135]
	13.doubleFactorial = (1, 3 .. 13).product

* * *

See also: factorial
