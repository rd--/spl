# Operator Syntax

Operators are written _α + β_.

```
>>> 3 + 4
7
```

Operators associate to the left, _α + β * γ_ = _(α + β) * γ_.

```
>>> 3 + 4 * 5
35
```

Operators are grouped using parentheses:


```
>>> 3 + (4 * 5)
23
```

Operators have lower precedence than ordinary application, _α + β.γ_ = _α + (β.γ)_

```
>>> 3 + 4.squared
19
```

Operators may be written as names in non-operator contexts, i.e. _α.β(+)_.

```
>>> 1:9.reduce(*)
362880
```

Operators are rewritten as the arity qualified names of their symbols.
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

Operators with multiple characters are named by joining together the character names,
i.e. _++_ is _plusPlus_ not _append_, and _<=_ is _lessThanEquals_.

```
>>> ++ == plusPlus:/2
true
```

Math and logic operators:

- +: plus, *: times, -: minus, /: dividedBy, %: modulo
- =: equals, <: lessThan, >: greaterThan
- &: and, |: or, ~: tilde

Other operators:

- !: bang, @: commercialAt, #: hash, $: dollar, ^: hat
- \: backslash, ?: query

* * *

Categories: Syntax
