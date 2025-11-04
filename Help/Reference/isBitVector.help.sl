# isBitVector

- _isBitVector([x₁ x₂ …])_

Answer `true` if all _x_ are either `zero` or `one`.

At `List`:

```
>>> [0 1 0 0 1 0].isBitVector
true

>>> [0 1 2 2 1 0].isBitVector
false

>>> [].isBitVector
true
```

At `ByteArray`:

```
>>> ByteArray([0 1 0 0 1 0]).isBitVector
true
```

At `String`:

```
>>> '010010'.isBitVector
true

>>> '012210'.isBitVector
false

>>> ''.isBitVector
true
```

* * *

See also: boole, isBitString, isOne, isVector, isZero

Guides: List Functions

Categories: Testing
