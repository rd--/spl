# instanceOf

- _instanceOf(t)_

Create an uninitialized instance of the type _t_ and call `initialize` on it.
Answer the new instance.

```
>>> let t = system.typeLookup('RgbColour');
>>> let x = t.instanceOf;
>>> (t.isType, x.isRgbColour, x.rgb, x.alpha)
(true, true, [0 0 0], 1)
```

* * *

See also: Type, initialize, new, typeLookup

Guides: Object Functions, Reflection Functions
