# asColour

- _asColour(aNumber | aSequence)_

Answer a `Colour` given specified either as _aNumber_ or as parameters in _aSequence_.

Opaque grey:

```
>>> let c = 0.5.asColour;
>>> (c, c.isGrey)
(Colour(0.5, 0.5, 0.5, 1), true)
```

Opaque yellow:

```
>>> let c = [1 1 0].asColour;
>>> (c, c.isYellow)
(Colour(1, 1, 0, 1), true)
```

A blue colour patch:

~~~spl svg=A
[0.2 0.5 0.7].asColour
~~~

![](sw/spl/Help/Image/asColour-A.svg)

A light grey colour patch:

~~~spl svg=A
0.75.asColour
~~~

![](sw/spl/Help/Image/asColour-B.svg)

* * *

See also: Colour

Categories: Converting
