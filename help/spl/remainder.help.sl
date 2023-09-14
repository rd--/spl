# remainder -- arithmetic

- _remainder(aNumber, anotherNumber)_

Remainder defined in terms of _quotient_.

Answer a _Number_ with the same sign as _aNumber_

	9.remainder(4) = 1
	-9.remainder(4) = -1
	0.9.remainder(0.5) = 0.4
	8.625.remainder(0.75) = 0.375

For two finite values x and y, the remainder r of dividing x by y satisfies x = y * q + r, where q is the integer nearest to x / y.

        | x = 8.625, y = 0.75, r = x.remainder(y), q = x.quotient(y); | x = (y * q + r)

* * *

See also: quotient, remainderBy
