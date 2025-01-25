# instanceOf

- _instanceOf(aType)_

Create an uninitialized instance of _aType_.

```
>>> let type = system.typeLookup('RgbColour');
>>> let value = type.instanceOf;
>>> (type.isType, value.isRgbColour, value.rgb)
(true, true, nil)
```

* * *

See also: new, Type, typeLookup

Categories: Instance Creation, Reflection
