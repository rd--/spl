# Excess

- _Excess(aNumber, anotherNumber)_

Residual of clipping.
_Excess(α, β)_ answers the difference of the original signal and its clipped form,
ie. _α - Clip2(α, β)_.

```
SinOsc(1000, 0).Excess(Line(0, 1, 23)) / 3
```

* * *

See also: Clip2, Fold2, Wrap2

Categories: Ugen, Math, Operator
