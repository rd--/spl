# Interval Syntax -- syntax

There are syntaxes to form both _Interval_ values:

- _(start .. end)_ ⇒ _Interval_
- _(start, then .. end)_ ⇒ _Interval_

and _Array_ values:

- _[start .. end]_ ⇒ _Array_
- _[start, then .. end]_ ⇒ _Array_

The rewrite rules are:

- _(p .. q)_ ⟹ _upOrDownTo(p, q)_
- _(p, q .. r)_ ⟹ _thenTo(p, q, r)_
- _[p .. q]_ ⟹ _(p .. q).Array_
- _[p, q .. r]_ ⟹ _(p, q .. r).Array_

In the case where both _p_ and _q_ are integer literals the interval can be written _p...q_.
In the literal form, as with literal Fractions, white space is significant, and _p ... q_ is not allowed.

Where supported the notations _.._ and _..._ are displayed as _‥_.

_Note_:
In Smalltalk _p to: q_ is an empty interval if _p <= q_.
The re-write rule here calls _upOrDownTo_ which allows descending intervals to be specified.
Care must be taken not to use _(p .. q)_ where _p.to(q)_ is required.
In Fortress intervals are written _p:q_, however here that notation indicates a Fraction.
The literal case is not written _p..q_ since it would make white space significant in the array case,
i.e. _[p..q]_ would be an array of one interval, and not equal to _[p .. q]_.

* * *

See also: Array, Interval, thenTo, upOrDownTo

Unicode: U+2025 ‥ Two Dot Leader
