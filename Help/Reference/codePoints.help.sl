# codePoints

- _codePoints(aString)_

Answer a `List` of the `Integer` code points of _aString_.

```
>>> 'codePoints'.codePoints
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
if the code points in range:

```
>>> 'AaBbCcΑαΒβΓγ'.utf16List
[
	65 97 66 98 67 99
	913 945 914 946 915 947
]
```

* * *

See also: Character, characterList, String, utf8ByteArray, utf16List
