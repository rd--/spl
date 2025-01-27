# Range Syntax

There are thee forms of `Range` syntax.

Range literal rewrite rules:

- _α:β_ => _Range(α, β, 1)_
- _α:β:γ_ => _Range(α, γ, β)_

Range expression rewrite rules:

- _(α .. β)_ ⇒ _Range(α, β, (β - α).sign)_
- _(α, β .. γ)_ ⇒ _Range(α, γ, β - α)_

List range expression rewrite rules:

- _[α .. β]_ ⇒ _(α .. β).asList_
- _[α, β .. γ]_ ⇒ _(α, β .. γ).asList_

Answer ascending `Range` values:

```
>>> 1:9
Range(1, 9, (9 - 1).sign)

>>> 1:2:9
Range(1, 9, 2)

>>> (1 .. 9)
Range(1, 9, (9 - 1).sign)

>>> (1, 3 .. 9)
Range(1, 9, 3 - 1)
```

Answer descending `Range` values,
in the literal case the step size is `one` and the range is empty:

```
>>> 9:1
Range(9, 1, 1)

>>> 9:1.isEmpty
true

>>> 9:-1:1
Range(9, 1, -1)

>>> 9:-2:1
Range(9, 1, -2)

>>> (9 .. 1)
Range(9, 1, (1 - 9).sign)

>>> (9, 8 .. 1)
Range(9, 1, (1 - 9).sign)

>>> (9, 7 .. 1)
Range(9, 1, 7 - 9)
```

Answer `List` values:

```
>>> [1 .. 9]
[1 2 3 4 5 6 7 8 9]

>>> [1, 3 .. 9]
[1 3 5 7 9]
```

In the case where α is an integer literal, and β is an integer literal or an identifier, the interval can be written α:β.
In the literal form,
as with literal `Fraction` values,
white space is significant,
and `α : β` is not allowed.

```
>>> 1:9
Range(1, 9, 1)

>>> let k = 9;
>>> 1:k
Range(1, 9, 1)
```

Where supported the notation `..` i displayed as ….

_Note_:
In Smalltalk _α to: β_ is an empty `Range` if α <= β,
as is _α:β_ in Matlab and Octave and Julia.
The re-write rules here call `to` for the literal form _α:β_,
and `upOrDownTo` for the expression form _(α .. β)_.
This allows the latter form to be used for writing descending intervals.
Care must be taken not to use _(α .. β)_ where _α:β_ or _α.to(β)_ is required.
The notation `α:β` is from Matlab/Octave and S/R and Fortress and Julia.
The literal case is not written _p..q_ since it would make white space significant in the array case,
i.e. _[p..q]_ would be an array of one interval, and not equal to _[p .. q]_.

* * *

See also: List, Range, thenTo, upOrDownTo

References:
_Fortress_
[1](https://doi.org/10.1007/978-0-387-09766-4_190),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/colon.html),
_R_
[1](https://cran.r-project.org/doc/manuals/r-release/R-intro.html#Generating-regular-sequences)

Unicode: U+2026 … Horizontal Ellipsis, U+2025 ‥ Two Dot Leader

Categories: Syntax
