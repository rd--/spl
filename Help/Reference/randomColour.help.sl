# randomColour

- _randomColour(r, shape)_

Answer an array of the indicated _shape_ containing random `RgbColour` values.

The `hue` of a 3×3 matrix of random colours:

```
>>> let r = 2166136261.seedRandom;
>>> let c = system.randomColour([4 4]);
>>> (c.hue * 360).round
[
	227 277 196 121;
	277 309 123 228;
	334 185 239 222;
	171  59 207  46
]
```

Plot a 3×5 matrix of random colours:

~~~spl svg=A
Sfc32(329743)
.randomColour([3 5])
.rgb
.arrayPlot
~~~

![](sw/spl/Help/Image/randomColour-A.svg)

* * *

See also: Colour, randomComplex, randomInteger, randomReal

Guides: Random Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RandomColor.html)
