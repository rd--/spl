# stringSplitRegularExpression

- _stringSplitRegularExpression(s, r)_

Split the string _s_ on the regular expression _r_.
_r_ may be an uncompiled string value.

Regular expressions:

```
>>> [
>>> 	'A tree, an apple, four pears.'
>>> 	'And more: two sacks'
>>> ].unwords
>>> .stringSplitRegularExpression('\\W+')
[
	'A' 'tree' 'an' 'apple' 'four' 'pears'
	'And' 'more' 'two' 'sacks'
]
```

Split into substrings separated by either a hypen or colon delimiter:

```
>>> 'a-b:c-d:e-f-g'
>>> .stringSplitRegularExpression(':|-')
['a' 'b' 'c' 'd' 'e' 'f' 'g']

>>> 'abbccba'
>>> .stringSplitRegularExpression('a|b')
['' '' '' 'cc' '' '']
```

This is more usually written as _split(r, s)_,
where _r_ is a `RegularExpression` value:

```
>>> RegularExpression':|-'
>>> .split('a-b:c-d:e-f-g')
['a' 'b' 'c' 'd' 'e' 'f' 'g']
```

* * *

See also: RegularExpression, String, splitOn

Guides: Regular Expression Functions, String Functions

Categories: Converting
