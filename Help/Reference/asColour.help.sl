# asColour

- _asColour(g)_
- _asColour([r g b α=1])_

Answer an `RgbColour` value specified as either the greyscale level _g_,
or as _(r,g,b)_ or _(r,g,b,α)_ parameters.

Opaque grey:

```
>>> let c = 0.5.asColour;
>>> (c, c.isGrey)
(RgbColour([0.5 0.5 0.5], 1), true)
```

Opaque yellow:

```
>>> let c = [1 1 0].asColour;
>>> (c, c.isYellow)
(RgbColour([1, 1, 0], 1), true)
```

With `alpha` channel:

```
>>> [0.1 0.2 0.3 0.4].asColour
RgbColour([0.1 0.2 0.3], 0.4)
```

A blue colour patch:

~~~spl svg=A
[0.2 0.5 0.7].asColour
~~~

![](sw/spl/Help/Image/asColour-A.svg)

A light grey colour patch:

~~~spl svg=B
0.75.asColour
~~~

![](sw/spl/Help/Image/asColour-B.svg)

* * *

See also: Colour, parseHexColour, RgbColour

Guides: Colour Functions

Categories: Converting
