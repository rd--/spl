# chroma

- _chroma(c, m)_

Answer the _chroma_ of the colour _c_,
calculated according to the method _m_.
Method _R_ answers the difference between the minima and maxima of _(r,g,b)_.
Method _P_ answers a polar coordinate based chromathe differences between the minima and maxima of _(r,g,b)_.

```
>>> let c = RgbColour([0.75 1 0.75], 1);
>>> (c.chroma('R'), c.chroma('P'))
(1/4, 1/4)
```

The values are not always equal:

```
>>> let c = 'Svg'.namedColour(
>>> 	'CornflowerBlue'
>>> );
>>> (c.chroma('R'), c.chroma('P'))
(0.53725, 0.47152)
```

Threads over lists:

```
>>> [1.red 1.green 1.blue]
>>> .chroma('R')
[1 1 1]
```

* * *

See also: RgbColour, hue

Guides: Colour Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Colorfulness)

Categories: Accessing, Colour
