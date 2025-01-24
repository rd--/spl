# asColour

- _asColour(aNumber | aSequence)_

Answer an `Rgb` value specified as either _aNumber_ or as _(r,g,b)_ parameters in _aSequence_.

Opaque grey:

```
>>> let c = 0.5.asColour;
>>> (c, c.isGrey)
(Rgb([0.5, 0.5, 0.5], 1), true)
```

Opaque yellow:

```
>>> let c = [1 1 0].asColour;
>>> (c, c.isYellow)
(Rgb([1, 1, 0], 1), true)
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

See also: Colour, Rgb, Srgb

Guides: Colour Functions

Categories: Converting
