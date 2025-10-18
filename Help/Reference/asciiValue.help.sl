# asciiValue

- _asciiValue(s)_

Answer the Ascii code point of the character _s_,
or of the string _s_ which must have a single character,
else an error.

```
>>> ' '.asciiValue
32

>>> '0'.asciiValue
48

>>> 'x'.asciiValue
120

>>> {
>>> 	'é'.asciiValue
>>> }.hasError
true
```

* * *

See also: codePoint, Character, String

Guides: String Functions

Categories: Accessing
