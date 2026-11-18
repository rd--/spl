# Integer Arithmetic

Signed 32-bit integer multiplication:

```
>>> 16bFFFFFFF.F * 15.0
4026531825.0

>>> i32Times(16bFFFFFFF.F, 15.0)
-268435471.0
```

Signed 32-bit integer addition:

```
>>> 2147483647.0 + 2.0
2147483649

>>> i32Plus(2147483647.0, 2.0)
-2147483647
```

Bitwise left-rotate of 32-bit integer:

```
>>> 1.0.i32BitRotateLeft(30.0)
1073741824.0

>>> 2.0 ^ 30.0
1073741824.0

>>> (2.0 ^ 30.0)
>>> .i32BitRotateRight(30.0)
1.0

>>> (2.0 ^ 24.0 + 1.0)
>>> .i32BitRotateRight(30)
67108868.0

>>> 67108868.0
>>> .i32BitRotateLeft(30.0)
2.0 ^ 24.0 + 1.0
```

* * *

See also: Binary, Float, Integer, SmallInteger

Guides: Mathematical Functions
