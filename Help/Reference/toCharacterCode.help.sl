# toCharacterCode

- _toCharacterCode(aString, encoding)_

Answer a `List` of the integer codes corresponding to the characters in _aString_,
according to the specified _encoding_.

Find Ascii or Unicode Utf-8 and Utf-16 character codes:

```
>>> 'abcABC'
>>> .toCharacterCode('Ascii')
[97 98 99 65 66 67]

>>> 'abcABCαβγ'
>>> .toCharacterCode('Utf8')
[
	97 98 99 65 66 67
	206 177 206 178 206 179
]

>>> 'abcABCαβγ'
>>> .toCharacterCode('Utf16')
[
	97 98 99 65 66 67
	945 946 947
]
```

Reassemble a string from character codes:

```
>>> [97 98 99 65 66 67]
>>> .fromCharacterCode('Ascii')
'abcABC'

>>> [
>>> 	97 98 99 65 66 67
>>> 	206 177 206 178 206 179
>>> ]
>>> .fromCharacterCode('Utf8')
'abcABCαβγ'

>>> [97 115 98 65 66 67 945 946 947]
>>> .fromCharacterCode('Utf16')
'asbABCαβγ'
```

Find the code points of several strings,
threads over lists:

```
>>> ['abc' 'def' 'ghi']
>>> .toCharacterCode('Ascii')
[
	 97  98  99;
	100 101 102;
	103 104 105
]
```

Some ISO Latin-1 letters:

```
>>> 'ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎ'
>>> .toCharacterCode('Utf16')
[
	192 193 194 195 196
	197 198 199 200 201
	202 203 204 205 206
]
```

`toCharacterCode` always answers a list:

```
>>> 'a'.toCharacterCode('Ascii')
[97]
```

Plot a string:

~~~spl svg=A
'toCharacterCode'
.toCharacterCode('Ascii')
.discretePlot
~~~

![](sw/spl/Help/Image/toCharacterCode-A.svg)

* * *

See also: characterRange, characters, fromCharacterCode

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ToCharacterCode.html)
