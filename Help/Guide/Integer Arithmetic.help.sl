# Integer Arithmetic

Signed 32-bit integer multiplication:

```
>>> 16rFFFFFFF * 15
4026531825

>>> multiplyI32(16rFFFFFFF, 15)
-268435471
```

Signed 32-bit integer addition:

```
>>> 2147483647 + 2
2147483649

>>> addI32(2147483647, 2)
-2147483647
```

Bitwise left-rotate of 32-bit integer:

```
>>> 1.bitRotateLeftI32(30)
1073741824

>>> 2 ^ 30
1073741824

>>> (2 ^ 30)
>>> .bitRotateRightI32(30)
1

>>> (2 ^ 24 + 1)
>>> .bitRotateRightI32(30)
67108868

>>> 67108868
>>> .bitRotateLeftI32(30)
2 ^ 24 + 1
```

* * *

Guides: Mathematical Functions
