# splitByRegularExpression

- _splitByRegularExpression(s, r)_

Regular expressions:

```
>>> [
>>> 	'A tree, an apple, four pears.'
>>> 	'And more: two sacks'
>>> ]
>>> .unwords
>>> .splitByRegularExpression('\\W+')
[
	'A' 'tree' 'an' 'apple' 'four' 'pears'
	'And' 'more' 'two' 'sacks'
]
```

Split into substrings separated by either delimiter:

```
>>> 'a-b:c-d:e-f-g'
>>> .splitByRegularExpression(':|-')
['a' 'b' 'c' 'd' 'e' 'f' 'g']

>>> 'abbccba'
>>> .splitByRegularExpression('a|b')
['' '' '' 'cc' '' '']
```

* * *

See also: RegularExpression, splitBy

Guides: Regular Expression Functions

Categories: Converting
