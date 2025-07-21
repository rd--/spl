# parseSexagesimal

- _parseSexagesimal(aString)_

Parse Otto Neugebauer’s notational system for sexagesimal numbers.
A semicolon separate the integral and fractional portions of the number,
and a comma separates the positions within each portion.
Each component is written in decimal.

```
>>> '1,2,3;0'.parseSexagesimal
3723

>>> [1 2 3] * (60 ^ [2 1 0])
[3600 120 3]

>>> '10;25,59,23,31,12'.parseSexagesimal
10.433164

>>> [10 25 59.392].fromDms
10.433164
```

Approximations of Pythagoras’ constant:

```
>>> '1;24,51,10'.parseSexagesimal
2.sqrt

>>> '1;24,51,10,7,46,6,4,44'
>>> .parseSexagesimal
2.sqrt
```

Approximations of π and 2π as used by Ptolemy and Jamshīd al-Kāshī:

```
>>> '3;8,30'.parseSexagesimal
1.pi

>>> '6;16,59,28,1,34,51,46,14,50'
>>> .parseSexagesimal
2.pi
```

In the sexagesimal system,
any fraction in which the denominator is a regular number may be expressed exactly:

```
>>> [
>>> 	'0;30'
>>> 	'0;20'
>>> 	'0;15'
>>> 	'0;12'
>>> 	'0;10'
>>> 	'0;7,30'
>>> 	'0;6,40'
>>> 	'0;6'
>>> 	'0;5'
>>> 	'0;4'
>>> 	'0;3,45'
>>> 	'0;3,20'
>>> 	'0;3'
>>> 	'0;2,30'
>>> 	'0;2,24'
>>> 	'0;2,13,20'
>>> 	'0;2'
>>> 	'0;1,52,30'
>>> 	'0;1,40'
>>> 	'0;1,30'
>>> 	'0;1,20'
>>> 	'0;1,15'
>>> 	'0;1,12'
>>> 	'0;1,6,40'
>>> 	'0;1'
>>> ].collect(parseSexagesimal:/1)
1 / 2:60.select(isRegularNumber:/1)
```

* * *

See also: fromDms, dmsList, parseDecimalInteger, parseNumber

Guides: Parsing Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Sexagesimal.html),
_W_
[1](https://en.wikipedia.org/wiki/Sexagesimal)
