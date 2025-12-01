# Missing

- _Missing(s, x)_

`Missing` is a `Type` that represents data that is missing.
The string _s_ specifies a reason for the data being missing,
the value _x_ associates a value with the reason for the missing data.

`atOrMissing` answers `Missing` if the index is out of range:

```
>>> 1:5.atOrMissing(9)
Missing('NotAvailable', 9)

>>> 1:5.atOrMissingAll([-1 5 9])
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

`Nil` implements `isMissing` and `reasonMissing`:

```
>>> nil.isMissing
true

>>> nil.reasonMissing
'Unknown'
```

* * *

See also: atOrMissing, atOrMissingAll, deleteMissing, isMissing

Guides: Error Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Missing.html)
