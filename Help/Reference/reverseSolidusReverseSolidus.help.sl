# `\\` (reverseSolidusReverseSolidus)

- _m `\\` n_

The operator name for `remainder`.

```
>>> 9 \\ 4
1

>>> -9 \\ 4
-1

>>> 0.9 \\ 0.5
0.4

>>> 8.625 \\ 0.75
0.375
```

Relation to `%`:

```
>>> (19 \\ 12, 19 % 12)
(7, 7)

>>> (19 \\ -12, 19 % -12)
(7, -5)
```

Threads over lists:

```
>>> 7.iota \\ 2
[1 0 1 0 1 0 1]
```

Remainder with positive dividend:

```
>>> [13 1 1 2 5.5 3L] \\ [5 -2 2 3 2 2L]
[3 1 1 2 1.5 1L]
```

Remainder with negative dividend:

```
>>> [-13 -1 -4 -3L] \\ [5 2 2 2L]
[-3 -1 -0 -1L]
```

Remainder with `Infinity`:

```
>>> let i = Infinity;
>>> ([i i i] \\ [2 0 i]).isNaN
[true true true]

>>> [2 0] \\ Infinity
[2 0]
```

Remainder with `NaN`:

```
>>> (NaN \\ 2).isNaN
true
```

At `Symbol`:

```
>> `m` \\ `n`
(remainder m n)
```

The name of this operator is `reverseSolidusReverseSolidus`.

Where supported `\\` is displayed as ⑊.

* * *

See also: /, //, %, mod, quotient, quotientRemainder, remainder

Guides: Binary Operators, Mathematical Functions

References:
_Smalltalk_
5.6.2.9

Unicode: U+244A ⑊ OCR Double Backslash

Categories: Arithmetic operators
