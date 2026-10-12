# NaN

`NaN`, standing for not a number, is a numeric constant.

`NaN` is, perhaps confusingly, a number:

```
>>> NaN.isNumber
true
```

In particular, `NaN` is a `SmallFloat`:

```
>>> NaN.isSmallFloat
true
```

`NaN` is not finite:

```
>>> NaN.isFinite
false
```

`NaN` is not `identical`, `equal` or even close to itself:

```
>>> NaN == NaN
false

>>> NaN = NaN
false

>>> NaN ~ NaN
false
```

Complex `NaN` is reduced to NaN on construction:

```
>>> let z = 2J3 / 0;
>>> (z.isComplex, z.isNaN)
(false, true)
```

Divide by `zero`:

```
>> 0 / 0
NaN
```

Arithmetic with `NaN`:

```
>> 2 * NaN + 7
NaN

>>> 1J2 * NaN
NaN

>>> NaN / 1J0
NaN
```

`sin` of `NaN`:

```
>> NaN.sin
NaN
```

Threads over lists:

>> [1 2 3] + NaN
[NaN, NaN, NaN]
```

The `real` part of NaN is NaN:

```
>> NaN.real
NaN
```

Check if a value is NaN:

```
>>> (0 / 0).ifNaN { '?' }
'?'
```

* * *

See also: Infinity, SmallFloat, ifNaN, isFinite, isNaN

Guides: Mathematical Constants

References:
_Mathematica_
[1](https://mathworld.wolfram.com/NaN.html)
[2](https://reference.wolfram.com/language/ref/Indeterminate.html),
_W_
[1](https://en.wikipedia.org/wiki/NaN)
