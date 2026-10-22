# equalIgnoringExtraWhitespace

- _equalIgnoringExtraWhitespace(s₁, s₂)_

Answer `true` if the strings _s₁_ and _s₂_ are equal,
ignoring any additional whitespace that occurs in _s₂_.

```
>>> 'f(x,y)'.equalIgnoringExtraWhitespace(
>>> 	'f(x, y)'
>>> )
true
```

_Rationale_:
This is the function that compares the actual and expected answer for documentation tests.
It allows the expected answer to be nicely formatted across multiple lines
even where the actual answer is not.

```
>> 'f(x,y)'
f(
  x,
  y
)
```

* * *

See also: String, =, isSeparator

Guides: Documentation Tests, String Functions
