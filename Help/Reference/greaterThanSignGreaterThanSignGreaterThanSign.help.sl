# >>> (greaterThanSign...)

- _α >>> β_

The operator form of `bitShiftRightUnsigned`.

Answers a number whose binary representation is _α_ shifted by _β_ bits to the right.
Excess bits shifted off to the right are discarded,
and zero bits are shifted in from the left.
The answer is always positive.

Compare with `>>`:

```
>>> -5 >> 2
-2

>>> -5 >>> 2
1073741822

>>> -5
>>> .encodeInt32(true)
>>> .asBitSet
>>> .asString
'11011111111111111111111111111111'

>>> 1073741822
>>> .encodeInt32(true)
>>> .asBitSet
>>> .asString
'01111111111111111111111111111100'

>>> 9 >>> 2
2

>>> -9 >>> 2
1073741821
```

`>>>` is also a syntax token used when writing `Documentation Tests`.
It is only such a token when it appears at the start of a line,
within a fenced code block,
in a _.help.sl_ file.

The name of this operator is _greaterThanSign..._.

Where supported `>>>` is displayed as ⋙.

* * *

See also: >>, DocumentationTest

Guides: Bitwise Functions, Documentation Tests

Unicode: U+22D9 ⋙ Very Much Greater-Than

Categories: Comments, Syntax
