# asCharacter

- _asCharacter(aCharacter | anInteger | aString)_

Answer a `Character` given a single character `String` or an `Integer` code point.

At `String`:

```
>>> 'c'.asCharacter
99.asCharacter
```

At `Integer`:

```
>>> 99.asCharacter
'c'.asCharacter
```

At `Character`:

```
>>> 120.asCharacter.asCharacter
'x'
```

* * *

See also: asCodePoint, asString, Character

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

Categories: Converting
