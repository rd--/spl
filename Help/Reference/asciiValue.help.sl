# asciiValue

- _asciiValue(aCharacter | aString)_

Answer the Ascii code point of _aCharacter_,
or of _aString_ which must have a single character,
else an error.

```
>>> ' '.asciiValue
32

>>> '0'.asciiValue
48

>>> 'x'.asciiValue
120

>>> { 'é'.asciiValue }.ifError { true }
true
```

* * *

See also: codePoint, Character, String

Categories: Accessing
