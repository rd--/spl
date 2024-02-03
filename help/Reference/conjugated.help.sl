# conjugated

- _conjugated(aComplexNumber)_

The complex conjugate of a complex number a+bi is defined to be a-bi.

	1j1.conjugated = 1j-1
	0.7j0.conjugated = 0.7j0

Conjugate threads elementwise over lists and matrices:

	[1.2 2.5j1.5 0j-1.8].conjugated = [1.2 2.5j-1.5 0j1.8]

Value at zero:

	0.conjugated = 0

Value at real number is identity:

	let n = system.nextRandomFloat; n.conjugated = n

Conjugate is an odd function:

	let n = system.nextRandomFloat; 1.j(n).negated.conjugated = 1.j(n).conjugated.negated

Conjugate is involutive:

	let n = system.nextRandomFloat; 1.j(n).conjugated.conjugated = 1.j(n)

* * *

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ComplexConjugate.html)
[2](https://reference.wolfram.com/language/ref/Conjugate.html)

Categories: Math
