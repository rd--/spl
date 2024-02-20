# bitAnd

- _bitAnd(aCollection)_
- _bitAnd(aNumber, anotherNumber)_

Answers the bitwise and of the integers _aNumber_ and _anotherNumber_.

```
>>> 61.bitAnd(15)
13
```

At LargeInteger:

```
>>> (3n ^ 100).bitAnd(5n ^ 100)
503913279078601980753385379100266097026814443729n
```

Use negative numbers:

```
>>> -2.bitAnd(-3)
-4
```

Extract the second-lowest-order bits in numbers:

```
>>> 1:10.bitAnd(2)
[0 2 2 0 0 2 2 0 0 2]
```

Mask to test whether bits 3 or 4 are 1:

```
>>> 1:16.bitAnd((2 ^ 2) + (2 ^ 3)).sign
[0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 0]
```

The unary form reduces over a collection:

```
>>> [3333 5555 7777 9999].bitAnd
1025
```

Plot a nested pattern:

```
1:100.bitAnd(0:99).plot
```

Test for powers of 2:

```
>>> 1:20.collect { :i | (i.bitAnd(i - 1) = 0).boole }
[1 1 0 1 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0 0]

>>> (1:20.bitAnd(0:19) =.map [0]).boole
[1 1 0 1 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0 0]
```

Plot bitAnd with double:

```
1:63.bitAnd(2 * 1:64).plot
```

Plot bitAnd with double and triple:

```
1:64.collect { :i | [i, i * 2, i * 3].bitAnd }.plot
```

Truth table for and:

```
>>> bitAnd:/2.outer([1 0], [1 0])
[1 0; 0 0]
```

* * *

See also: and, bitAnd, bitNot, bitXor

References:
_Mathematica_
[1](https://mathworld.wolfram.com/OR.html)
[2](https://reference.wolfram.com/language/ref/BitOr.html)
