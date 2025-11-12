# codePoints

- _codePoints(s)_

Answer a `List` of the `Integer` code points of the string _s_.

At `String`:

```
>>> 'codePoints'.codePoints
[99 111 100 101 80 111 105 110 116 115]
```

At `AsciiString`:

```
>>> AsciiString('codePoints').codePoints
[99 111 100 101 80 111 105 110 116 115]
```

Find Ascii or Unicode character codes:

```
>>> 'AaBbCcΑαΒβΓγ'.codePoints
[
	65 97 66 98 67 99
	913 945 914 946 915 947
]
```

The code points are not in any encoding,
c.f. `utf8ByteArray`:

```
>>> 'AaBbCcΑαΒβΓγ'.utf8ByteArray
[
	65 97
	66 98
	67 99
	206 145 206 177
	206 146 206 178
	206 147 206 179
].asByteArray
```

The answer will be equal to `utf16List`,
if the code points are in range:

```
>>> 'AaBbCcΑαΒβΓγ'.utf16List
[
	65 97 66 98 67 99
	913 945 914 946 915 947
]
```

* * *

See also: Character, characterList, codePoint, String, utf8ByteArray, utf16List

Guides: String Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ToCharacterCode.html)
