# rybToRgb

- _rybToRgb([r y b])_

Convert from a red-yellow-blue colour specified by the triple _(r,y,b)_ to a red-green-blue colour triple.
Uses an algorithm by Gossett and Chen.

```
>>> [0 0 0; 1 1 1; 1 0 0; 0 1 0; 0 0 1]
>>> .collect(rybToRgb:/1)
[
	1 1 1;
	0.2 0.094 0;
	1 0 0;
	1 1 0;
	0.163 0.373 0.6
]
```

Green:

```
>>> [0 1 1].rybToRgb
[0 0.66 0.2]
```

Cyan is blue and green:

```
>>> [0 0.5 1].rybToRgb
[0.0815 0.5165 0.4]
```

The conversion is in relation to a colour table:

```
>>> system.rybColourTable.isRecord
true

>>> system.rybColourTable.keys
[
	'white'
	'red'
	'yellow'
	'blue'
	'violet'
	'green'
	'orange'
	'black'
]
```

Draw colour table:

~~~spl svg=A
system.rybColourTable
.values
.enclose
.arrayPlot
~~~

![](sw/spl/Help/Image/rybToRgb-A.svg)

* * *

See also: hsvToRgb, RgbColour, RybColour

Guides: Colour Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/RYB_color_model)

Further Reading: Gossett 2004
