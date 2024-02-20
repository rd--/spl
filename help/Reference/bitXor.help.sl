# bitXor

- _bitXor(n1, n2)_

Answer bitwise exclusive or.

```
>>> 2r1111.bitXor(2r1001)
2r0110

>>> 61.bitXor(15)
50

>>> [61 15 50].collect { :each | each.integerDigits(2) }
[1 1 1 1 0 1; 1 1 1 1; 1 1 0 0 1 0]
```

* * *

See also: bitAnd, bitOr

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/BitXor.html)
