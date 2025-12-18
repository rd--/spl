# encodeIni

- _encodeIni(r)_

Encode the record _r_ as an initialization-file specified in the _Ini_ format.
The answer is a `String`.

Two sections _P_ and _Q_,
with three keys _a_, _b_, and _c_,
and string values:

```
>> (P: (a: 'x', b: 'y'), Q: (c: 'z'))
>> .encodeIni
[P]
a=x
b=y
[Q]
c=z
```

Integer and floating point values:

```
>> (P: (a: 1, b: 2), Q: (c: 3.141))
>> .encodeIni
[P]
a=1
b=2
[Q]
c=3.141
```

Boolean and nil values:

```
>> (P: (a: true, b: false), Q: (c: nil))
>> .encodeIni
[P]
a=true
b=false
[Q]
c=null
```

* * *

See also: parseIni

Guides: Protocol Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/INI_file)

Categories: Protocol
