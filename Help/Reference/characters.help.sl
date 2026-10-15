# characters

- _characters(s)_

Answer a `List` of `String`s,
each holding one character of the string _s_.
Alias for `List` at `String`.

At Ascii string:

```
>>> List'text'
['t' 'e' 'x' 't']
```

At Unicode string:

```
>>> List'ËAÒKÇxÁsÉ'
['Ë' 'A' 'Ò' 'K' 'Ç' 'x' 'Á' 's' 'É']
```

The `elementType` of the answer is `String`:

```
>>> List'text'.elementType
'String'
```

The inverse is `fromCharacters`,
aliased to `String` at `List`,
which threads over lists:

```
>>> String[
>>> 	'm' 'i' 's' 's' 'i' 's' 's' 'i' 'p' 'p' 'i'
>>> ]
'mississippi'

>>> String['a' 'b' 'c'; 'd' 'e' 'f']
['abc' 'def']
```

`stringCatenate` and `stringJoin` can also undo `characters`,
but do not require each item in the string is a character,
or even a string:

```
>>> List'mississippi'
>>> .stringCatenate
'mississippi'

>>> List'mississippi'
>>> .stringJoin
'mississippi'
```

Break a string into overlapping trigrams:

```
>>> List'trigrams'
>>> .partition(3, 1)
>>> .String
['tri' 'rig' 'igr' 'gra' 'ram' 'ams']
```

`characterList` answers a list of `Character` values:

```
>>> 'text'.characterList.elementType
'Character'
```

* * *

See also: String, characterList

Guides: String Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Characters.html)
