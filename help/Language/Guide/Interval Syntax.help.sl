# Interval Syntax -- syntax

There are syntaxes to form both _Interval_ values:

- _(start .. end)_ ⇒ _Interval_
- _(start, then .. end)_ ⇒ _Interval_

and _Array_ values:

- _[start .. end]_ ⇒ _Array_
- _[start, then .. end]_ ⇒ _Array_

The rewrite rules are:

- _(alpha .. beta)_ ⟹ _upOrDownTo(alpha, beta)_
- _(alpha, beta .. gamma)_ ⟹ _thenTo(alpha, beta, gamma)_
- _[alpha .. beta]_ ⟹ _(alpha .. beta).asArray_
- _[alpha, beta .. gamma]_ ⟹ _(alpha, beta .. gamma).asArray_

In the case where alpha is an integer literal, and beta is an integer literal or an identifier, the interval can be written alpha:beta.
In the literal form, as with literal Fractions, white space is significant, and `alpha : beta` is not allowed.

Where supported the notations _.._ and _:_ are displayed as _‥_.

_Note_:
In Smalltalk `alpha to: beta` is an empty interval if alpha <= beta.
The re-write rule here calls `upOrDownTo` which allows descending intervals to be specified.
Care must be taken not to use `(alpha .. beta)` where `alpha.to(beta)` is required.
In notation `alpha:beta` is from Fortress.
The literal case is not written _p..q_ since it would make white space significant in the array case,
i.e. _[p..q]_ would be an array of one interval, and not equal to _[p .. q]_.

* * *

See also: Array, Interval, thenTo, upOrDownTo

Unicode: U+2025 ‥ Two Dot Leader
