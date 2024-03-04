# sameAs

- _sameAs(anObject, anotherObject)_

For `Character` and `String` values answers if the values are the same.
The comparison ignores case and possibly some other attributes.

```
>>> ('x' = 'x', 'x'.sameAs('x'))
(true, true)

>>> ('x' = 'X', 'x'.sameAs('X'))
(false, true)
```

* * *

See also: =, ~, closeTo

References:
_Smalltalk_
5.7.10.14

Categories: Comparing
