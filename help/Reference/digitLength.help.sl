# digitLength

- _digitLength(anInteger)_

Answer the number of bytes required to represent _anInteger_.

```
>>> [1 8 16 24 32 40 48 56 64].collect { :each | (2n ^ each).digitLength }
[1 .. 9]
```

A 128-bit (16-byte) integer:

```
>>> let n = 2n ^ 128 - 1;
>>> (n, n.digitLength)
(340282366920938463463374607431768211455n, 16)
```

* * *

See also: digitAt
