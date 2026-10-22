# Integer Arithmetic

Signed 32-bit integer multiplication:

```
>>> 16bFFFFFFF * 15
4026531825

>>> i32Times(16bFFFFFFF, 15)
-268435471
```

Signed 32-bit integer addition:

```
>>> 2147483647 + 2
2147483649

>>> i32Plus(2147483647, 2)
-2147483647
```

Bitwise left-rotate of 32-bit integer:

```
>>> 1.i32BitRotateLeft(30)
1073741824

>>> 2 ^ 30
1073741824

>>> (2 ^ 30)
>>> .i32BitRotateRight(30)
1

>>> (2 ^ 24 + 1)
>>> .i32BitRotateRight(30)
67108868

>>> 67108868
>>> .i32BitRotateLeft(30)
2 ^ 24 + 1
```

* * *

See also: SmallFloat

Guides: Mathematical Functions
