# instanceOf

- _instanceOf(aType)_

Create an uninitialized instance of _aType_.

```
>>> let rgbType = system.typeLookup('Rgb');
>>> let rgbValue = rgbType.instanceOf;
>>> (rgbType.isType, rgbValue.isRgb, rgbValue.rgb)
(true, true, nil)
```

* * *

See also: new, Type, typeLookup

Categories: Instance Creation, Reflection
