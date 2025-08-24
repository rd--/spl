# characterCounts

- _characterCounts(s, n=1)_

Answer an association list whose keys are the distinct characters in the string _s_,
and whose values give the number of times those characters appear.

Count the distinct characters in a string:

```
>>> 'banana'.characterCounts
['a' -> 3, 'n' -> 2, 'b' -> 1]
```

Count the distinct _n_-gram character sequences in a string:

```
>>> 'ababcab'.characterCounts(2)
['ab' -> 3, 'ca' -> 1, 'bc' -> 1, 'ba' -> 1]
```

Character counts include all characters, including numbers, punctuation and whitespace:

```
>>> '- x !'.characterCounts
[' ' -> 2, '!' -> 1, 'x' -> 1, '-' -> 1]

>>> 'TK-421;TK-412'.characterCounts(2)
[
	'-4' -> 2, 'K-' -> 2, 'TK' -> 2,
	'12' -> 1, '41' -> 1, ';T' -> 1,
	'1;' -> 1, '21' -> 1, '42' -> 1
]
```

* * *

See also: counts, letterCounts

Guides: String Functions

References:
_Mathematica_
[1](http://reference.wolfram.com/language/ref/CharacterCounts.html)
