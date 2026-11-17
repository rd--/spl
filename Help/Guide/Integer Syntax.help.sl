# Integer Syntax

There are a two kinds of integer values:

```
>>> 23.isSmallInteger
true

>>> 23L.isInteger
true
```

Small integer literals evaluate to the type `Float`,
the predicate `isSmallInteger` is a refinement predicate over `isFloat`:

```
>>> 23.isFloat
true

>>> 23.typeName
'Float'
```

The `Integer` type is written with an _L_ suffix:

```
>>> 23L.isInteger
true

>>> 23L.typeName
'Integer'
```

Leading zeroes are allowed:

```
>>> [01 01L; 00 00L]
[1 1L; 0 0L]
```

There is a `Radix Syntax` for specifying non-decimal integers:

```
>>> [2b1010 8b12 10b10 16bA]
[10 10 10 10]
```

Leading zeroes are allowed:

```
>>> [00 01 02 03 04 05 06 07 08 09]
[0 1 2 3 4 5 6 7 8 9]
```

Leading signs, both negative and positive, are allowed:

```
>>> -1 * +1
-1
```

Underscores are allowed to separate parts of the number,
including when a radix is indicated:

```
>>> 1_234
1234

>>> 123_456
123456

>>> 16b12_34_56
1193046
```

For small integer values `SmallInteger` and `Integer` give equal answers,
except for the case of division:

```
>>> (23 + 17, 23L + 17L)
(40, 40L)

>>> (23 - 17, 23L - 17L)
(6, 6L)

>>> (23 * 17, 23L * 17L)
(391, 391L)

>>> (23 / 17, 23L / 17L)
(1.35294, 23/17)

>>> (23 % 17, 23L % 17L)
(6, 6L)

>>> (23 // 17, 23L // 17L)
(1L, 1L)

>>> (23 \\ 17, 23L \\ 17L)
(6, 6L)
```

* * *

See also: Float, Integer, SmallInteger

Guides: Number Syntax, Radix Syntax

Categories: Syntax
