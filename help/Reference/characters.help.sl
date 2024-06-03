# characters

- _characters(aString)_

Answer a `List` of the `Character` elements of _aString_.
Each character is given as a length one `String`.

```
>>> 'characters'.characters.collect(codePoint:/1)
[99 104 97 114 97 99 116 101 114 115]
```

Break a string into a list of characters:

```
>>> 'A string'.characters
['A', ' ', 's', 't', 'r', 'i', 'n', 'g']
```

`stringJoin` will reassemble the string:

```
>>> ['A', ' ', 's', 't', 'r', 'i', 'n', 'g'].stringJoin
'A string'
```

Break a string into overlapping trigrams:

```
>>> 'trigrams'.characters.partition(3, 1).collect(stringJoin:/1)
['tri' 'rig' 'igr' 'gra' 'ram' 'ams']
```

Sort the characters in a string:

```
>>> 'characters'.characters.sort
['a' 'a' 'c' 'c' 'e' 'h' 'r' 'r' 's' 't']
```

Unicode strings:

```
>>> 'αβγ'.characters
['α' 'β' 'γ']
```

* * *

See also: Character, codePoints, String

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Characters.html)

Categories: Converting
