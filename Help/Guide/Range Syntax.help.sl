# Range Syntax

There are two forms of `Range` syntax.

`Range` expression rewrite rules:

- _(α .. β)_ ⇒ _Range(α, β, 1)_
- _(α, β .. γ)_ ⇒ _Range(α, γ, β - α)_

`List` range expression rewrite rules:

- _[α .. β]_ ⇒ _(α .. β).asList_
- _[α, β .. γ]_ ⇒ _(α, β .. γ).asList_

Answer ascending `Range` values:

```
>>> (1 .. 9)
Range(1, 9, 1)

>>> (1 .. 9).asList
[1 2 3 4 5 6 7 8 9]

>>> (1, 3 .. 9)
Range(1, 9, 3 - 1)

>>> (1, 3 .. 9).asList
[1 3 5 7 9]
```

Answer descending `Range` values:

```
>>> (9, 8 .. 1)
Range(9, 1, (1 - 9).sign)

>>> (9, 7 .. 1)
Range(9, 1, 7 - 9)
```

Answer ascending `List` values:

```
>>> [1 .. 9]
[1 2 3 4 5 6 7 8 9]

>>> [1, 3 .. 9]
[1 3 5 7 9]
```

Answer descending `List` values:

```
>>> [9, 8 .. 1]
[9 8 7 6 5 4 3 2 1]

>>> [9, 7 .. 1]
[9 7 5 3 1]
```

Answer a list of one place:

```
>>> [1 .. 1]
[1]

>>> [1, 2 .. 1]
[1]

>>> [1, 0 .. 1]
[1]
```

Where supported the notation `..` i displayed as ….

_Note_:
In Smalltalk _α to: β_ is an empty `Range` if α <= β,
as is _α:β_ in Matlab and Octave and Julia.
The re-write rules here call `Range` for the literal form _α:β_,
and `nonemptyRange` for the forms _(α .. β)_ and _[α .. β]_.
To write descending intervals the step must be specified.
This definition avoids subtle differences if _(α .. β)_ is used where _α:β_ or _α.to(β)_ is required.
The notation `α:β` is from Matlab/Octave and S/R and Fortress and Julia.
The literal case is not written _p..q_ since it would make white space significant in the list case,
i.e. _[p..q]_ would be a list of one interval, and not equal to _[p .. q]_.

* * *

See also: List, Range, thenTo, upOrDownTo

Guides: Span Syntax

References:
_Fortress_
[1](https://doi.org/10.1007/978-0-387-09766-4_190),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/colon.html),
_R_
[1](https://cran.r-project.org/doc/manuals/r-release/R-intro.html#Generating-regular-sequences)

Unicode: U+2026 … Horizontal Ellipsis, U+2025 ‥ Two Dot Leader

Categories: Syntax
