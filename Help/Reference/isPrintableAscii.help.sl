# isPrintableAscii

- _isPrintableAscii(aString)_

Answer `true` if _aString_ contains only printable Ascii characters, and `false` otherwise.

Check if a single character is a valid Ascii character:

```
>>> 'a'.isPrintableAscii
true

>>> '¤'.isPrintableAscii
false
```

Check if a string contains only printable Ascii characters:

```
>>> 'abcd'.isPrintableAscii
true

>>> '¤bcd'.isPrintableAscii
false
```

Threads over lists:

```
>>> ['a' 'b' 'c' '¤' 'd' '€'].isPrintableAscii
[true true true false true false]
```

Map over a character range:

```
>>> [0 .. 127]
>>> .fromCharacterCode('Ascii')
>>> .characters
>>> .isPrintableAscii
>>> .asRunArray
>>> .asAssociationList
[32 -> false, 95 -> true, 1 -> false]
```

At the empty string:

```
>>> ''.isPrintableAscii
true
```

* * *

See also: characterRange, isDigit, isLetter, removeDiacritics, String, toCharacterCode

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/PrintableASCIIQ.html)
