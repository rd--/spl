# stringLength

- _stringLength(s)_

Answer the size of the string _s_.

Find the number of characters in a string:

```
>>> 'tiger'.stringLength
5

>>> [
>>> 	'CTTCGACTACCAGCGGGT'
>>> 	'CGAACGGCCCATGGCATC'
>>> ].stringJoin.stringLength
36
```

Find lengths of all strings in a list:

```
>>> ['cat' 'dog' 'fish' 'coelenterate']
>>> .stringLength
[3 3 4 12]
```

At non-ascii characters:

```
>>> 'αβγδεζηθικλμνξοπρστυφχψω'
>>> .stringLength
24
```

Newlines count as one character:

```
>>> 'ab\ncd'.stringLength
5
```

Find the growth rate of a string substitution system:

```
>>> { :x |
>>> 	x.stringReplace(
>>> 		['A' -> 'AB', 'B' -> 'A']
>>> 	)
>>> }.nestList('A', 5).stringLength
[1 2 3 5 8 13]
```

The empty string has zero length:

```
>>> ''.stringLength
0
```

* * *

See also: characters, size

Guides: String Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/StringLength.html)
