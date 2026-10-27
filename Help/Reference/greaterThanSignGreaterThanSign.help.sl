# >> (greaterThanSign…)

- _n >> k_

The operator form or `bitShiftRight`.

```
>>> (9 >> 2, -9 >> 2)
(2, -3)

>>> 48 >> 4
3

>>> 2b110000 >> 4
2b000011

>>> 48.bitShiftRight(4)
3

>>> 2b11100 >> 1
2b01110

>>> 2b11010 >> 1
2b01101
```

Shift right by `one` is equivalent to `//` by two:

```
>>> (8 >> 1, 8 // 2)
(4, 4)

>>> (7 >> 1, 6 >> 1)
(3, 3)

>>> (2b111 >> 1, 2b110 >> 1)
(2b11, 2b11)

>>> (7 // 2, 6 // 2)
(3, 3)
```

Shift right by two is equivalent to `//` by four,
and so on:

```
>>> (32 >> 2, 32 // (2 ^ 2))
(8, 8)

>>> (32 >> 3, 32 // (2 ^ 3))
(4, 4)

>>> (32 >> 4, 32 // (2 ^ 4))
(2, 2)

>>> (32 >> 5, 32 // (2 ^ 5))
(1, 1)

>>> (32 >> 6, 32 // (2 ^ 6))
(0, 0)
```

Signed and unsigned shifts:

```
>>> 5 >> 2
1

>>> -5 >> 2
-2
```

At `LargeInteger`:

```
>> 52.! >> 2
20164543792735969642915
15921410094174382237636
0220819456000000000000L
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

See also: DocumentationTest, >>>, bitShift, bitShiftLeft, bitShiftRight

Guides: Bitwise Functions, Documentation Tests

Unicode: U+226B ≫ Much Greater-Than

Categories: Bits, Binary
