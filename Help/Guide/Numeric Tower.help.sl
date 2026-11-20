# Numeric Tower

Integers combined with fractions answer fractions:

```
>>> let x = 1L * 2/3;
>>> (x, x.isFraction)
(2/3, true)

>>> let x = 1/2 * 3L;
>>> (x, x.isFraction)
(3/2, true)
```

Integer division answers a fraction:

```
>>> let x = 3L / 2L;
>>> (x, x.isFraction)
(3/2, true)
```

Integers combined with floating point numbers answer floating point numbers:

```
>>> let x = 1L * 2.3;
>>> (x, x.isFloat)
(2.3, true)

>>> let x = 1.2 * 3L;
>>> (x, x.isFloat)
(3.6, true)
```

Fractions combined with floating point numbers answer floating point numbers:

```
>>> let x = 1/2 * 3.4;
>>> (x, x.isFloat)
(1.7, true)

>>> let x = 1.2 * 3/4;
>>> (x, x.isFloat)
(0.9, true)
```

Integer division answers a fraction:

```
>>> let x = 3L / 2L;
>>> (x, x.isFraction)
(3/2, true)
```

Floating point division answers a floating point number:

```
>>> let x = 3.0 / 2.0;
>>> (x, x.isFloat)
(1.5, true)
```

`Integer` is promoted to `Fraction`,
even when the answer is integer valued:

```
>>> let x = 1L + 2/1;
>>> (
>>> 	x,
>>> 	x.isIntegerValuedNumber,
>>> 	x.isFraction
>>> )
(3/1, true, true)
```

`Integer` is promoted to `Float`,
even when the answer is integer valued:

```
>>> let x = 1L + 2.0;
>>> (
>>> 	x,
>>> 	x.isIntegerValuedNumber,
>>> 	x.isFloat
>>> )
(3.0, true, true)
```

`Fraction` is promoted to `Float`,
even when the answer is integer valued:

```
>>> let x = 1/1 + 2.0;
>>> (
>>> 	x,
>>> 	x.isIntegerValuedNumber,
>>> 	x.isFloat
>>> )
(3.0, true, true)
```

`Integer` is promoted to `Complex`,
even when the answer is real and integer valued:

```
>>> let x = 1L + 1J0;
>>> (
>>> 	x,
>>> 	x.isRealValuedNumber,
>>> 	x.isIntegerValuedNumber,
>>> 	x.isComplex
>>> )
(2J0, true, true, true)
```

`Fraction` is promoted to `Complex`,
even when the answer is real and integer valued:

```
>>> let x = 1/1 + 1J0;
>>> (
>>> 	x,
>>> 	x.isRealValuedNumber,
>>> 	x.isIntegerValuedNumber,
>>> 	x.isComplex
>>> )
(2J0, true, true, true)
```

`Float` is promoted to `Complex`,
even when the answer is real and integer valued:

```
>>> let x = 1.0 + 1J0;
>>> (
>>> 	x,
>>> 	x.isRealValuedNumber,
>>> 	x.isIntegerValuedNumber,
>>> 	x.isComplex
>>> )
(2J0, true, true, true)
```

* * *

See also: Integer, Float, Fraction, Complex

