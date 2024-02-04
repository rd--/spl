# Scalars, Lists, Operators

_Preliminaries_:
Lists are written between square brackets.
Addition is written infix using the _plus_ sign.
The equality predicate is written infix using the _equals_ sign.
Expressions are offset typographically and each evaluates to _true_.

Scalar addition answers a scalar:

	3 + 4 = 7

Scalar and vector addition is pointwise over the vector:

	3 + [4 6 8] = [7 9 11]

The vector may appear on either side:

	[3 5 7] + 4 = [7 9 11]

A matrix is a vector of vectors:

	[[3 5 7] [7 9 11]] + 4 = [[7 9 11] [11 13 15]]

Vector addition is pointwise if the vectors are of equal size:

	[3 5 7] + [8 6 4] = [11 11 11]

If the vectors are of different sizes there are a number of behaviours selected by [Operator Adverbs].

In the standard library the un-adorned operator requires that the vectors be of equal size, as if the the _e_ adverb were selected.

The _SuperCollider_ library redefines the un-adorned form to cycle the shorter vector, as if the _w_ adverb were selected.

This should be changed to always recycle, as in R & S & SuperCollider.
