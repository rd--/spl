# floatString

- _floatString(x, r, k=∞)_

Print the number _x_ in radix _r_.
If _k_ is specified the answer will have at most _k_ places after the point.

Base ten:

```
>>> 23.0.floatString(10)
'23.0'

>>> 1.pi.floatString(10)
'3.141592653589793'
```

An an integer:

```
>>> 33.0.floatString(2)
'100001.0'

>>> 33.0.floatString(2, 0)
'100001'
```

`pi` in base five:

```
>>> 1.pi.floatString(5)
'3.0323221430334324112412'
```

Base eight:

```
>>> 3.3148.floatString(8, 5)
'3.24113'
```

Base sixteen:

```
>>> 397_997.0.floatString(16)
'612AD.0'
```

One half in bases from two through ten:

```
>>> 2:10.collect { :r |
>>> 	0.5.floatString(r, 12)
>>> }
[
	'0.1'
	'0.111111111111'
	'0.2'
	'0.222222222222'
	'0.3'
	'0.333333333333'
	'0.4'
	'0.444444444444'
	'0.5'
]
```

* * *

See also: Float, integerString, printString

Guides: Printing Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/BaseForm.html)
