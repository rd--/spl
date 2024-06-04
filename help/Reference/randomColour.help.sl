# randomColor

- _randomColor(r, shape)_

Answer an array of the indicated _shape_ containing random `Colour` values.

The `hue` of a 3×3 matrix of random colours:

```
>>> let r = 2166136261.seedRandom;
>>> let c = system.randomColour([4 4]);
>>> let h = c.deepCollect(hue:/1);
>>> (h * 360).rounded
[
	227 277 196 121;
	277 309 123 228;
	334 185 239 222;
	171  59 207  46
]
```

* * *

See also: Colour, randomComplex, randomInteger, randomReal

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RandomColor.html)
