# Binary Operator Syntax

Binary operators are written _α + β_.

```
>>> 3 + 4
7
```

Binary operators associate to the left, _α + β * γ_ = _(α + β) * γ_.

```
>>> 3 + 4 * 5
35
```

Binary operators are grouped using parentheses:


```
>>> 3 + (4 * 5)
23
```

Binary operators have lower precedence than ordinary application, _α + β.γ_ = _α + (β.γ)_

```
>>> 3 + 4.squared
19
```

Binary operators may be written as names in non-operator contexts, i.e. _α.β(+)_.

```
>>> 1:9.reduce(*)
362880
```

Binary operators are rewritten as the arity qualified names of their symbols.
_+_ as _plus:/2_,
_*_ as _times:/2_, &etc.

```
>>> + == plus:/2
true
```

These names are in the same space as all other block names, defining _&_ defines _and_, and defining _+_ defines _plus_.

```
>>> plus(3, 4)
7
```

Binary operators with multiple characters are named by joining together the character names,
i.e. _++_ is _plusPlus_ not _append_, and _<=_ is _lessThanEquals_.

```
>>> ++ == plusPlus:/2
true
```

Math and logic binary operators:

- +: plus, *: times, -: minus, /: dividedBy, %: modulo
- =: equals, <: lessThan, >: greaterThan
- &: and, |: or, ~: tilde

Other binary operators:

- !: bang, @: commercialAt, #: hash, $: dollar, ^: hat
- \: backslash, ?: query

* * *

See also: [Unary Operator Syntax]

Categories: Syntax
