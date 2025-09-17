# Integer Arithmetic

Signed 32-bit integer multiplication:

```
>>> multiplyI32(3, 4)
12

>>> multiplyI32(-5, 12)
-60

>>> multiplyI32(16rFFFFFFFF, 5)
-5

>>> multiplyI32(16rFFFFFFFE, 5)
-10
```

Signed 32-bit integer addition:

```
>>> addI32(100, 27)
127

>>> addI32(2147483647, 2)
-2147483648 + 1
```

Bitwise left-rotate of 32-bit integer:

```
>>> let i = 16r87654321;
>>> let j = bitRotateLeftI32(i, 4);
>>> [
	i.integerDigits(2),
	j.integerDigits(2)
]
[
	1 0 0 0 0 1 1 1
	0 1 1 0 0 1 0 1
	0 1 0 0 0 0 1 1
	0 0 1 0 0 0 0 1;
	0 1 1 1 0 1 1 0
	0 1 0 1 0 1 0 0
	0 0 1 1 0 0 1 0
	0 0 0 1 1 0 0 0
]
```

* * *

Guides: Mathematical Functions
