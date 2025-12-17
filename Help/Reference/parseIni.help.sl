# parseIni

- _parseIni(s)_

Parse the string _s_ as an initialization-file specified in the _Ini_ format.
The answer is a `Record`.

Two sections _P_ and _Q_,
with three keys _a_, _b_, and _c_,
and string values:

```
>>> '[P]\na=x\nb=y\n[Q]\nc=z'
>>> .parseIni
(P: (a: 'x', b: 'y'), Q: (c: 'z'))
```

Integer and floating point values:

```
>>> '[P]\na=1\nb=2\n[Q]\nc=3.141'
>>> .parseIni
(P: (a: 1, b: 2), Q: (c: 3.141))
```

Boolean and nil values:

```
>>> '[P]\na=true\nb=false\n[Q]\nc=null'
>>> .parseIni
(P: (a: true, b: false), Q: (c: nil))
```

Missing value:

```
>>> '[P]\na=\nb=1'
>>> .parseIni
(P: (a: 0, b: 1))
```

* * *

See also: parseJson

Guides: Protocol Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/INI_file)

Categories: Protocol
