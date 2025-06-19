# characters

- _characters(s)_

Answer a `List` of `String`s each holding one character of the string _s_.

```
>>> 'text'.characters
['t' 'e' 'x' 't']
```

The `elementType` of the answer is `String`:

```
>>> 'text'.characters.elementType
'String'
```

Inverse are `join` and `stringJoin`:

```
>>> 'mississippi'.characters.stringCatenate
'mississippi'

>>> 'mississippi'.characters.stringJoin
'mississippi'
```

`characterList` answers a list of `Character` values:

```
>>> 'text'.characterList.elementType
'Character'
```

* * *

See also: characterList, String

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Characters.html)
