# Missing

- _Missing(reason, value)_

`Missing` is a `Type` that represents data that is missing.
_reason_ specifies a reason for the data being missing,
_value_ associates a value with the missing data.

`atMissing` answers `Missing` if the index is out of range:

```
>>> 1:5.atMissing(9)
Missing('NotAvailable', 9)

>>> 1:5.atAllMissing([-1 5 9])
[
	Missing('NotAvailable', -1),
	5,
	Missing('NotAvailable', 9)
]
```

`isMissing` is the type predicate:

```
>>> 5.isMissing
false

>>> Missing('Unknown', nil).isMissing
true
```

* * *

See also: atMissing, atAllMissing, deleteMissing, isMissing

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Missing.html)
