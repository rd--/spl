# isSiUnit

- _isSiUnit(x)_

Answer `true` if x is an `SiUnit` value,
of if it is a string that is either the name of the symbol of an SI unit.

```
>>> let u = 'm'.siUnit;
>>> (u, u.isSiUnit, 'm'.isSiUnit)
(
	SiUnit('metre', 'm', 'length', 'L'),
	true,
	true
)
```

Base SI unit names:

```
>>> 'second'.isSiUnit
true

>>> 'metre'.isSiUnit
true

>>> 'kilogram'.isSiUnit
false
```

Base SI unit symbols:

```
>>> ['s' 'm' 'kg'].collect(isSiUnit/1)
[true true true]
```

Derived SI unit names:

```
>>> 'becquerel'.isSiUnit
true

>>> 'hertz'.isSiUnit
true

>>> 'newton'.isSiUnit
true

>>> 'hertz'.isSiBaseUnit
false

>>> 'hertz'.isSiDerivedUnit
true
```

Derived SI unit symbols:

```
>>> ['Bq' 'Hz' 'N'].collect(isSiUnit/1)
[true true true]
```

Non-SI units:

```
>>> 'mile'.isSiUnit
false

>>> 'yard'.isSiUnit
false
```

* * *

See also: SiUnit

Guides: SI Units
