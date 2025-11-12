# characterList

- _characterList(s)_

Answer a `List` of the `Character` elements of the string _s_.

The `elementType` of the answer is `Character`:

```
>>> 'characters'
>>> .characterList
>>> .elementType
'Character'
```

The elements of the answer are characters:

```
>>> 'text'.characterList
['t' 'e' 'x' 't'].collect(Character:/1)
```

Code points of characters of a string:

```
>>> 'characters'
>>> .characterList
>>> .collect(codePoint:/1)
[99 104 97 114 97 99 116 101 114 115]
```

Since `codePoint` is also defined for single character strings,
the above is equivalent to:

```
>>> 'characters'
>>> .characters
>>> .collect(codePoint:/1)
[99 104 97 114 97 99 116 101 114 115]
```

A `Character` is not `=` to an equivalent `String` of one place,
however it is `~` to such,
and likewise lists of each:

```
>>> let s = 'x';
>>> let c = Character('x');
>>> (
>>> 	s = c, s ~ c,
>>> 	[s] = [c], [s] ~ [c],
>>> 	[s].elementType, [c].elementType
>>> )
(
	false, true,
	false, true,
	'String', 'Character'
)
```

Break a string into a list of characters:

```
>>> let c = 'A string'.characterList;
>>> (c.elementType, c)
('Character', ['A' ' ' 's' 't' 'r' 'i' 'n' 'g'])
```

`stringJoin` will reassemble the string:

```
>>> 'text'.characterList.stringJoin
'text'
```

Break a string into overlapping trigrams:

```
>>> let c = 'trigrams'.characterList;
>>> c.partition(3, 1).collect(stringJoin:/1)
['tri' 'rig' 'igr' 'gra' 'ram' 'ams']
```

Sort the characters in a string:

```
>>> 'characters'.characterList.sort
['a' 'a' 'c' 'c' 'e' 'h' 'r' 'r' 's' 't']
```

Unicode strings:

```
>>> 'αβγ'.characterList
[
	'α'.Character,
	'β'.Character,
	'γ'.Character
]
```

* * *

See also: Character, characters, codePoints, String

Guides: String Functions

Categories: Converting
