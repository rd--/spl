# Range Syntax

`Range` syntax rewrite rules:

- _(α .. β)_ ⇒ _Range(α, β, 1)_
- _(α, β .. γ)_ ⇒ _Range(α, γ, β - α)_
- _(α .. β; γ)_ ⇒ _Range(α, β, γ)_

```
>> '(i .. j)'.splSimplify
nonemptyRange(i, j, 1)

>> '(i, j .. k)'.splSimplify
nonemptyThenTo(i, j, k)

>> '(i .. j; k)'.splSimplify
nonemptyRange(i, j, k)
```

Answer ascending `Range` values:

```
>>> (1 .. 9)
Range(1, 9, 1)

>>> (1, 3 .. 9)
Range(1, 9, 3 - 1)
```

Answer descending `Range` values:

```
>>> (9, 8 .. 1)
Range(9, 1, (1 - 9).sign)

>>> (9, 7 .. 1)
Range(9, 1, 7 - 9)
```

Answer a `Range` of one place:

```
>>> (1 .. 1)
Range(1, 1, 1)

>>> (1, 2 .. 1)
Range(1, 1, 1)

>>> (1, 0 .. 1)
Range(1, 1, -1)
```

Where supported the notation `..` i displayed as ….

_Note_:
In Smalltalk _α to: β_ is an empty `Range` if α <= β,
as is _α:β_ in Matlab and Octave and Julia.
The Sᴘʟ re-write rules call `Range` for the `Span Syntax` form _α:β_,
and `nonemptyRange` for the `Range Syntax` _(α .. β)_ and related forms.
To write descending intervals the step must be specified.
This definition avoids subtle differences if _(α .. β)_ is used where _α:β_ or _α.to(β)_ is required.
The notation `α:β` is from Matlab/Octave and S/R and Fortress and Julia.
The literal case is not written _p..q_ since it would make white space significant in the list case,
i.e. _[p..q]_ would be a list of one range, and not equal to _[p .. q]_.

* * *

See also: List, Range, thenTo, upOrDownTo

Guides: List Range Syntax, Span Syntax

References:
_Fortress_
[1](https://doi.org/10.1007/978-0-387-09766-4_190),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/colon.html),
_R_
[1](https://cran.r-project.org/doc/manuals/r-release/R-intro.html#Generating-regular-sequences)

Unicode: U+2026 … Horizontal Ellipsis, U+2025 ‥ Two Dot Leader

Categories: Syntax
