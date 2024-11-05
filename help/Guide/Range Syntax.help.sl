# Range Syntax

Rewrite rules:

- _(α .. β)_ ⇒ _Range(α, β, (β - α).sign)_
- _[α .. β]_ ⇒ _(α .. β).asList_
- _(α, β .. γ)_ ⇒ _Range(α, γ, β - α)_
- _[α, β .. γ]_ ⇒ _(α, β .. γ).asList_
- _α:β_ => _(α .. β)_

Answer ascending _Range_ values:

```
>>> 1:9
Range(1, 9, (9 - 1).sign)

>>> (1 .. 9)
Range(1, 9, (9 - 1).sign)

>>> (1, 3 .. 9)
Range(1, 9, 3 - 1)

>>> 1:2:9
Range(1, 9, 2)
```

Answer descending _Range_ values:

```
>>> 9:1
Range(9, 1, (1 - 9).sign)

>>> (9 .. 1)
Range(9, 1, (1 - 9).sign)

>>> (9, 7 .. 1)
Range(9, 1, 7 - 9)

>>> 9:-2:1
Range(9, 1, -2)
```

Answer _List_ values:

```
>>> [1 .. 9]
[1 2 3 4 5 6 7 8 9]

>>> [1, 3 .. 9]
[1 3 5 7 9]
```

In the case where α is an integer literal, and β is an integer literal or an identifier, the interval can be written α:β.
In the literal form, as with literal Fractions, white space is significant, and `α : β` is not allowed.

```
>>> 1:9
Range(1, 9, 1)

>>> let k = 9;
>>> 1:k
Range(1, 9, 1)
```

Where supported the notations _.._ and _:_ are displayed as _‥_.

_Note_:
In Smalltalk `α to: β` is an empty Range if α <= β.
The re-write rule here calls `upOrDownTo` which allows descending intervals to be specified.
Care must be taken not to use `(α .. β)` where `α.to(β)` is required.
The notation `α:β` is from Matlab and Fortress.
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

Unicode: U+2025 ‥ Two Dot Leader

Categories: Syntax
