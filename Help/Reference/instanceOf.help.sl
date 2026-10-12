# instanceOf

- _instanceOf(t)_

Create an uninitialized instance of the type _t_.

```
>>> let type = system.typeLookup('RgbColour');
>>> let value = type.instanceOf;
>>> (type.isType, value.isRgbColour, value.rgb)
(true, true, nil)
```

* * *

See also: new, Type, typeLookup

Categories: Instance Creation, Reflection
