# replaceMultipleStrings

- _replaceMultipleStrings(s, r)_

Answer a `String` that rewrites the string _s_,
replacing all occurences of each key of the `Record` _r_ with the associated value,
in one pass.

Allows special characters in query and replacement strings:

```
>>> let r = ('?': ',', '.': ':', '|': ';');
>>> '?.|?.|'.replaceMultipleStrings(r)
',:;,:;'
```

Replacements are made in a single pass:

```
>>> 'I have a cat, a dog, and a cow.'
>>> .replaceMultipleStrings(
>>> 	(cat: 'dog', dog: 'cow', cow: 'cat')
>>> )
'I have a dog, a cow, and a cat.'
```

A neighbor-independent substitution system:

```
>>> let r = ('B': 'BA', 'A': 'AB');
>>> { :s |
>>> 	s.replaceMultipleStrings(r)
>>> }.nestList('B', 4)
[
	'B'
	'BA'
	'BAAB'
	'BAABABBA'
	'BAABABBAABBABAAB'
]
```

* * *

See also: stringReplace

Guides: String Functions
