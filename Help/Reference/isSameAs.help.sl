# isSameAs

- _isSameAs(x₁, x₂)_

For `Character` and `String` values answers if the values are the same.
The comparison ignores case and possibly some other attributes.

```
>>> ('x' = 'x', 'x'.isSameAs('x'))
(true, true)

>>> ('x' = 'X', 'x'.isSameAs('X'))
(false, true)
```

* * *

See also: =, ~, isCloseTo, isVeryCloseTo

References:
_Smalltalk_
5.7.10.14

Categories: Comparing
