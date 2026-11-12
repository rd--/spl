# Numerical Precision

A `Float` is an IEEE 754 64-bit floating point number.

Integers from _−2 ^ 53_ to _2 ^ 53_ can be exactly represented.

```
>>> (-2L ^ 53, 2L ^ 53)
(-9007199254740992L, 9007199254740992L)

>>> (Float(-2L ^ 53), Float(2L ^ 53))
(-9007199254740992.0, 9007199254740992.0)
```

`Integer` has an implementation dependent maximum size:

```
>> 47L ^ 47L
3877924263464448622666648186154330754898
344901344205917642325627886496385062863L

>>> { (99L ^ (99L ^ 99)) }.hasError
true
```

`floatEpsilon` answers the smallest number that may be added to one to make a number greater than one.

```
>>> let x = system.floatEpsilon;
>>> (1 + x) > x
true

>>> let x = 2L ^ -53;
>>> let y = Float(x);
>>> (x, (1 + y) = 1)
(1/9007199254740992, true)
```

Print a `Float` to a specified precision:

```
>>> 1.pi.decimalStringToPrecision(4)
'3.142'
```

Print a `Float` to a specified scale:

```
>>> 1.pi.decimalStringToScale(3)
'3.142'
```

Round a `Float` to a specified precision:

```
>>> 1.pi.round(0.001).printString
'3.142'
```

* * *

See also: Float, Integer, decimalStringToScale, floatEpsilon, round

Guides: Numeric Types
