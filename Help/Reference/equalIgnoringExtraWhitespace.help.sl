# equalIgnoringExtraWhitespace

- _equalIgnoringExtraWhitespace(s₁, s₂)_

Answer `true` if the strings _s₁_ and _s₂_ are equal,
ignoring any additional whitespace that occurs in _s₂_,
and allowing the particular white-space in _s₁_ to match any kind of white-space in _s₂_.

Ignore space character:

```
>>> 'f(x,y)'.equalIgnoringExtraWhitespace(
>>> 	'f(x, y)'
>>> )
true
```

Ignore tab and newline characters:

```
>>> '[x,y]'.equalIgnoringExtraWhitespace(
>>> 	'[\tx,\n\ty\n]'
>>> )
true
```

Allow tab for space:

```
>>> 'a b'.equalIgnoringExtraWhitespace(
>>> 	'a\tb'
>>> )
true
```

_Rationale_:
This is the function that compares the actual and expected answer for documentation tests.
It allows the expected answer to be nicely formatted across multiple lines
even where the actual answer is not.

```
>> 'f(x, y)'
f(
	x,
	y
)
```

* * *

See also: String, =, isSeparator

Guides: Documentation Tests, String Functions
