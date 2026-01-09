# hue

- _hue(c)_

Answer the _hue_ of the colour _c_.

```
>>> RgbColour([0.75 1 0.75], 1).hue
1/3
```

`hue` is the first element of both `hsv` and `hsl`.

```
>>> let c = 'Svg'.namedColour(
>>> 	'CornflowerBlue'
>>> );
>>> (c.hue, c.hsl[1], c.hsv[1])
(0.6071, 0.6071, 0.6071)
```

Threads over lists:

```
>>> [1.red 1.green 1.blue].hue
[0 1 2] / 3
```

Select entries from the Svg colour catalogue that are within 15° of yellow (60°):

```
>>> let i = (45 -- 75).unitDegree;
>>> system.svgColourDictionary
>>> .select { :c |
>>> 	c.hue.between(i)
>>> }.keys
[
	'beige'
	'cornsilk'
	'darkkhaki'
	'gold'
	'ivory'
	'khaki'
	'lemonchiffon'
	'lightgoldenrodyellow'
	'lightyellow'
	'olive'
	'palegoldenrod'
	'yellow'
]
```

Plot Svg colours near yellow:

~~~spl svg=A
let i = (45 -- 75).unitDegree;
system.svgColourDictionary
.select { :c |
	c.hue.between(i)
}.values.reshape([2 6]).arrayPlot
~~~

![](sw/spl/Help/Image/hue-A.svg)

Select entries from the Svg colour catalogue that are within 30° of blue (240°):

```
>>> system.svgColourDictionary
>>> .select { :c |
>>> 	(c.hue - 2/3).abs < 1/12
>>> }.keys
[
	'blue'
	'cornflowerblue'
	'darkblue'
	'darkslateblue'
	'ghostwhite'
	'lavender'
	'lightslategray'
	'lightslategrey'
	'lightsteelblue'
	'mediumblue'
	'mediumpurple'
	'mediumslateblue'
	'midnightblue'
	'navy'
	'royalblue'
	'slateblue'
	'slategray'
	'slategrey'
]
```

Plot Svg colours near blue:

~~~spl svg=B
system.svgColourDictionary
.select { :c |
	(c.hue - 2/3).abs < 1/12
}.values.reshape([3 6]).arrayPlot
~~~

![](sw/spl/Help/Image/hue-B.svg)

Select entries from the Svg colour catalogue that are within 30° of green (120°):

```
>>> system.svgColourDictionary
>>> .select { :c |
>>> 	(c.hue - 1/3).abs < 1/12
>>> }.keys
[
	'chartreuse'
	'darkgreen'
	'darkseagreen'
	'forestgreen'
	'green'
	'honeydew'
	'lawngreen'
	'lightgreen'
	'lime'
	'limegreen'
	'mediumseagreen'
	'mintcream'
	'palegreen'
	'seagreen'
	'springgreen'
]
```

Plot Svg colours near green:

~~~spl svg=C
system.svgColourDictionary
.select { :c |
	(c.hue - 1/3).abs < 1/12
}.values.reshape([3 5]).arrayPlot
~~~

![](sw/spl/Help/Image/hue-C.svg)

Select entries from the Svg colour catalogue that are within 10° of orange (30°):

```
>>> system.svgColourDictionary
>>> .select { :c |
>>> 	(c.hue - 1/12).abs < 1/36
>>> }.keys
[
	'antiquewhite'
	'bisque'
	'blanchedalmond'
	'burlywood'
	'chocolate'
	'darkorange'
	'floralwhite'
	'linen'
	'moccasin'
	'navajowhite'
	'oldlace'
	'orange'
	'papayawhip'
	'peachpuff'
	'peru'
	'saddlebrown'
	'sandybrown'
	'seashell'
	'tan'
	'wheat'
]
```

Plot Svg colours near orange:

~~~spl svg=D
system.svgColourDictionary
.select { :c |
	(c.hue - 1/12).abs < 1/36
}.values.reshape([4 5]).arrayPlot
~~~

![](sw/spl/Help/Image/hue-D.svg)

* * *

See also: chroma, Colour, HsvColour, hsl, hsv, hsvToRgb

Guides: Colour Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Hue)

Categories: Accessing, Colour
