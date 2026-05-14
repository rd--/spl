# asColour

- _asColour(g)_
- _asColour([r g b α=1])_

Answer an `RgbColour` value specified as either the greyscale level _g_,
where `zero` is black and `one` is white,
or as _(r,g,b)_ or _(r,g,b,α)_ parameters.

Opaque black:

```
>>> let c = 0.asColour;
>>> (c, c.isBlack)
(RgbColour[0 0 0], true)

>>> 0.greyLevel = 0.asColour
true
```

Opaque grey:

```
>>> let c = 0.5.asColour;
>>> (c, c.isGrey)
(RgbColour[0.5 0.5 0.5], true)

>>> 0.5.greyLevel = 0.5.asColour
true
```

Opaque white:

```
>>> let c = 1.asColour;
>>> (c, c.isWhite)
(RgbColour[1 1 1], true)

>>> 1.greyLevel = 1.asColour
true
```

Opaque yellow:

```
>>> let c = [1 1 0].asColour;
>>> (c, c.isYellow)
(RgbColour[1 1 0], true)
```

With `alpha` channel:

```
>>> [0.1 0.2 0.3 0.4].asColour
RgbColour([0.1 0.2 0.3], 0.4)
```

At list of `Fraction` values:

```
>>> [1/3 1/5 1/7].asColour
RgbColour([1/3 1/5 1/7], 1)
```

At `RgbColour` answer `identity`:

```
>>> 1.red.asColour
RgbColour([1 0 0], 1)
```

At `Nil` answer black with α=0,
a transparent colour:

```
>>> nil.asColour
RgbColour([0, 0, 0], 0)
```

A blue colour patch:

~~~spl svg=A
[0.2 0.5 0.7].asColour
~~~

![](Help/Image/asColour-A.svg)

A light grey colour patch:

~~~spl svg=B
0.75.asColour
~~~

![](Help/Image/asColour-B.svg)

_Note_:
At `SmallFloat`, `asColour` is an alias for `greyLevel`.

* * *

See also: Colour, greyLevel, parseHexColour, RgbColour

Guides: Colour Functions

Categories: Converting
