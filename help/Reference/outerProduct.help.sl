# outerProduct

- _outerProduct(aBlock:/2)_
- _outerProduct(aBlock:/2, aSequence, anotherSequence)_

Answer the generalized outer product of two sequences, passing all combinations of the elements in each to _aBlock_.

Concatenate strings:

```
>>> ['a' 'b'] ++.outerProduct ['x' 'y' 'z']
['ax' 'ay' 'az'; 'bx' 'by' 'bz']

>>> ['a' 'b' 'c'] ++.outerProduct ['x' 'y']
['ax' 'ay'; 'bx' 'by'; 'cx' 'cy']

>>> ['1' '2' '3' '4'] ++.outerProduct ['a' 'b' 'c']
['1a' '1b' '1c'; '2a' '2b' '2c'; '3a' '3b' '3c'; '4a' '4b' '4c']
```

Compare elements with each other using equal:

```
>>> let x = [1 2 3 2];
>>> (x =.outerProduct x).boole
[1 0 0 0; 0 1 0 1; 0 0 1 0; 0 1 0 1]
```

A multiplication table:

```
>>> let x = [1 .. 5];
>>> x *.outerProduct x
[1 2 3 4 5; 2 4 6 8 10; 3 6 9 12 15; 4 8 12 16 20; 5 10 15 20 25]
```

* * *

References:
_Apl_
[1](https://aplwiki.com/wiki/Outer_Product),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/slash#dyadic),
_Mathematica_
[1](https://mathworld.wolfram.com/CartesianProduct.html)
[2](https://reference.wolfram.com/language/ref/Outer.html)
