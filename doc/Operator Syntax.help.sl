# Operator Syntax

Operators are written _p + q_.
There are no precedence rules.

Operator names are rewritten as the names of the symbols, _+_ as _plus_ and _*_ as _times_, &etc.
These names are in the same space as all other procedure names, defining _&_ defines _and_, and defining _at_ defines _@_.

Operators with multiple characters are named by joining together the character names,
i.e. _++_ is _plusPlus_ not _append_, and _<=_ is _lessThanEquals_.

Math and logic operators:

- +: plus, *: times, -: minus, /: dividedBy
- =: equals, <: lessThan, >: greaterThan
- &: and, |: or

Other operators:

- ~: tilde, !: bang, @: at, #: hash, $: dollar, %: percent, ^: hat
- \: backslash, ?: query

Operator names are ordinarily used in non-operator contexts, i.e. _c.withCollect(plus)_.
