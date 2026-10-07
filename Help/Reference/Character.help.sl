# Character

- _Character(x)_

A `Character` is both a `Trait`, and also a `Type` holding a single character string.

At `String`:

```
>>> Character'c'
>>> .codePoint
99
```

At `SmallFloat`:

```
>>> Character(99)
>>> .characterString
'c'
```

At `Character`:

```
>>> let c = Character(120);
>>> Character(c) == c
true
```

The `codePoint` method retrieves the unicode code point:

```
>>> 'x'.codePoint
120

>>> Character'x'.codePoint
120
```

The `characterString` method retrieves the single element string:

```
>>> Character'x'.characterString
'x'

>>> 'x'.characterString
'x'
```

Characters are cached on construction, and therefore equal characters are identical:

```
>>> let c1 = Character'x';
>>> let c2 = Character(120);
>>> (c1 = c2, c1 == c2)
(true, true)
```

There is no literal syntax for characters,
and the `printString` for a `Character` is not equal to the `printString` for a one place `String`:

```
>> Character'x'.printString
Character('x', 120)

>> Character'x'.storeString
Character('x', 120)
```

A `Character` is not equal to an equivalent string of one place,
but it is similar to such:

```
>>> let s = 'c';
>>> let c = Character'c';
>>> (s = c, c = s, s ~ c, c ~ s)
(false, false, true, true)
```

Printing:

```
>> Character'c'.storeString
Character('c', 99)

>> Character'c'.printString
Character('c', 99)
```

_Note:_
A `String` in Sᴘʟ is not a `List` of `Character` values.
Except where necessary the use of `Character` and `Character` `List` values are not recommended.

* * *

See also: isAlphaNumeric, isCharacter, isDigit, isLetter, isUpperCase, isLowerCase, String

Guides: String Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/FromCharacterCode.html),
_Mozilla_
[1](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/fromCodePoint),
_Python_
[1](https://docs.python.org/3/library/functions.html#chr),
_Smalltalk_
5.3.5.1,
_Tc39_
[1](https://tc39.es/ecma262/multipage/text-processing.html#sec-string.fromcodepoint)

Categories: Text, Type
