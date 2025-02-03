# hypotenuse

- _hypotenuse(aNumber, anotherNumber)_

Answer the square root of the sum of the squares.

Integer answers:

```
>>> 3.hypotenuse(4)
5

>>> 5.hypotenuse(12)
13
```

At large numbers:

```
>>> hypotenuse(1E308, 1E308)
1.41421E308
```

The hypotenuse gives the distance of a point _(x,y)_ from the origin:

~~~
let i = (-1 -- 1).subdivide(99);
{ :x :y |
	x.hypotenuse(y)
}.table(i, i).clip(0, 1).Graymap
~~~

![](sw/spl/Help/Image/hypotenuse-A.png)

* * *

See also: +, abs, norm, sqrt, sum

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Hypotenuseenuse.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/hypot.html),
_Tc39_
[1](https://tc39.es/ecma262/multipage/numbers-and-dates.html#sec-math.hypot)
