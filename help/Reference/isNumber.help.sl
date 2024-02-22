# isNumber

- _isNumber(anObject)_

Answers true if the receiver is a number, else false.

```
>>> 23.isNumber
true & { 23.isInteger }

>>> 3.141.isNumber
true & { 3.141.isSmallFloat }

>>> 2/3.isNumber
true & { 2/3.isFraction }

>>> inf.isNumber
true & { inf.isFinite.not }

>>> '23'.isNumber
false
```

* * *

See also: isFinite, isFraction, isInteger, isSmallFloat, Number

Categories: Predicate
