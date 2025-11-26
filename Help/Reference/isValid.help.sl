# isValid

- _isValid(x)_

Answer `true` if the object _x_ is valid,
else `false`.

At `Rgba`:

```
>>> RgbColour([0 0 0], 1)
>>> .isValid
true

>>> RgbColour([0 0 0], 2)
>>> .isValid
false

>>> RgbColour([3 2 1], 1)
>>> .isValid
false
```

* * *

See also: initializeSlots

Guides: Reflection Functions
