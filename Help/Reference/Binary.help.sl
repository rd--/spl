# Binary

`Binary` is a numeric trait holding behaviours related to the binary (bit-level) representation of numbers.

Methods include:

- `bitAnd`
- `bitAt`
- `bitCount`
- `bitNot`
- `bitOr`
- `bitPut`
- `bitShiftLeft`
- `bitShiftRight`
- `bitXor`
- `isBinary`

`Binary` is a `Trait`:

```
>>> system
>>> .traitDictionary['@Binary']
>>> .isTrait
true
```

Types implementing `Binary`:

```
>>> system
>>> .traitTypes('@Binary')
>>> .sort!
[
	'LargeInteger'
	'SmallFloat'
]
```

* * *

See also: bitAnd, bitNot, bitOr, bitShiftLeft, bitShiftRight, bitXor

Guides: Bitwise Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Binary_number)
