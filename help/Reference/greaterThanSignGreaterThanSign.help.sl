# >> (greaterThanSignGreaterThanSign)

- _alpha >> beta_ ⟹ _bitShiftRight(alpha, beta)_

The operator form or `bitShiftRight`.

```
>>> 48 >> 4
3

>>> 2r110000 >> 4
2r000011

>>> 48.bitShiftRight(4)
3
```

Signed and unsigned shifts:

```
>>> 5 >> 2
1

>>> -5 >> 2
-2
```

Compare with `>>>` (unsigned right shift):

```
>>> -5 >>> 2
1073741822
```

`>>` is also a syntax token used when writing `Documentation Tests`.

Where supported `>>` is displayed as ≫.

The name of this operator is `greaterThanSignGreaterThanSign`.

* * *

See also: >>>, bitShift, bitShiftLeft, bitShiftRight, DocumentTest

Guides: Documentation Tests

Unicode: U+226B ≫ Much Greater-Than

Categories: Bits, Binary
