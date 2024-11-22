# >>> (greaterThanSignGreaterThanSignGreaterThanSign)

- _α >>> β_ ⟹ _bitShiftRightUnsigned(α, β)_

The operator form or `bitShiftRightUnsigned`.

Answers a number whose binary representation is α shifted by β bits to the right.
Excess bits shifted off to the right are discarded,
and zero bits are shifted in from the left.
The answer is always positive.

Compare with `>>`:

```
>>> -5 >> 2
-2

>>> -5 >>> 2
1073741822

>>> -5.encodeInt32(true).asBitSet.asString
'11011111111111111111111111111111'

>>> 1073741822.encodeInt32(true).asBitSet.asString
'01111111111111111111111111111100'
```

`>>>` is also a syntax token used when writing `Documentation Tests`.

The name of this operator is `greaterThanSignGreaterThanSignGreaterThanSign`.

Where supported `>>>` is displayed as ⋙.

* * *

See also: >>, DocumentTest

Guides: Documentation Tests

Unicode: U+22D9 ⋙ Very Much Greater-Than

Categories: Comments, Syntax
