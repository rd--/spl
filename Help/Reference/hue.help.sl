# hue

- _hue(c)_

Answer the _hue_ of the colour _c_.
`hue` is the first element of `hsv`.

```
>>> RgbColour([0.75 1 0.75], 1).hue
1/3
```

Threads over lists:

```
>>> [1.red 1.green 1.blue].hue
[0 1 2] / 3
```

Select entries from the Svg colour catalogue that are within fifteen degrees of _yellow_:

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

Select entries from the Svg colour catalogue that are within twenty degrees of _blue_:

```
>>> system.svgColourDictionary
>>> .select { :c |
>>> 	(c.hue - 2/3).abs < 1/18
>>> }.keys
[
	'blue'
	'darkblue'
	'darkslateblue'
	'ghostwhite'
	'lavender'
	'mediumblue'
	'mediumpurple'
	'mediumslateblue'
	'midnightblue'
	'navy'
	'royalblue'
	'slateblue'
]
```

Plot Svg colours near blue:

~~~spl svg=A
let i = (225 -- 255).unitDegree;
system.svgColourDictionary
.select { :c |
	(c.hue - 2/3).abs < 1/18
}.values.reshape([2 6]).arrayPlot
~~~

![](sw/spl/Help/Image/hue-B.svg)

* * *

See also: Colour, HsvColour, hsv, hsvToRgb

Categories: Accessing, Colour
