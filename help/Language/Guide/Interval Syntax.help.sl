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

_Note_:
In Smalltalk _p to: q_ is an empty interval if _p <= q_.
The re-write rule here calls _upOrDownTo_ which allows descending intervals to be specified.
Care must be taken not to use _(p .. q)_ where _p.to(q)_ is required.

* * *

See also: Array, Interval, thenTo, upOrDownTo
