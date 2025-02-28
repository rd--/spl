# fromCharacterCode

- _fromCharacterCode(aList, encoding)_

Answer a `String` gives a consisting of the sequence of characters with codes in _aList_,
using the specified character _encoding_.

Space character:

```
>>> [32].fromCharacterCode('Ascii')
' '
```

A `String` consisting of the sequence of characters with codes 97, 98, and 99:

```
>>> [97 98 99]
>>> .fromCharacterCode('Ascii')
'abc'
```

A `List` of `Strings`:

```
>>> [97 98 99; 100 101 102]
>>> .fromCharacterCode('Ascii')
['abc' 'def']
```

Non-Ascii characters:

```
>>> [225 226 227]
>>> .fromCharacterCode('Utf16')
'áâã'
```

The inverse is `toCharacterCode`:

```
>>> 'áâã'.toCharacterCode('Utf16')
[225 226 227]
```

* * *

See also: asCharacter, Character, toCharacterCode

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/FromCharacterCode.html)
