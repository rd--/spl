# Numerical Precision

A `SmallFloat` is an IEEE 754 64-bit floating point number.

Integers from _−2 ^ 53_ to _2 ^ 53_ can be exactly represented.

```
>>> (-2 ^ 53, 2 ^ 53)
(-9007199254740992, 9007199254740992)

>>> (-2L ^ 53, 2L ^ 53)
(-9007199254740992L, 9007199254740992L)
```

`LargeInteger` has an implementation dependent maximum size:

```
>>> 47L ^ 47L
3877924263464448622666648186154330754898344901344205917642325627886496385062863L

>>> { (99L ^ (99 ^ 99)) }.ifError { true }
true
```

`smallFloatEpsilon` answers the smallest number that may be added to one to make a number greater than one.

```
>>> let x = system.smallFloatEpsilon;
>>> (1 + x) > x
true

>>> let x = 2 ^ -53;
>>> (1 + x) = 1
true
```

Print a `SmallFloat` to a specified precision:

```
>>> (1 / 3).printStringShowingDecimalPlaces(3)
'0.333'
```

Round a `SmallFloat` to a specified precision:

```
>>> (1 / 3).roundTo(1E-3).printString
'0.333'
```

* * *

See also: printStringShowingDecimalPlaces, roundTo, SmallFloat, smallFloatEpsilon, LargeInteger

Guides: Numeric Types
