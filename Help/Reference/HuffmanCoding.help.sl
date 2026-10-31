# HuffmanCoding

- _HuffmanCoding(symbolTable, encoding)_

A `Type` representing a Huffman encoding of a sequence of symbols _x_.
The coding consists of a `symbolTable` giving the code for each symbol,
and the encoded sequence.
Each code is a sequence of bits, stored as `zero` or `one`.
The commonest symbols have the shorted codes,
however the exact symbol table, and hence encoding, is not specified by the algorithm.

Encode a `List` of integers using `huffmanEncode`,
the commonest symbols have the shorted codes:

```
>>> let a = [1 2 2 3 3 3 4 4 4 4];
>>> let b = a.huffmanEncode(==);
>>> let c = b.symbolTable;
>>> a.collect { :x | c[x].size }
[3 3 3 2 2 2 1 1 1 1]
```

Encode and then decode:

```
>>> [5 2 5 2 4 4 3 5 3 4 1 3 5 5 4]
>>> .huffmanEncode(==)
>>> .decode
[5 2 5 2 4 4 3 5 3 4 1 3 5 5 4]
```

Encode a `String` using `huffmanEncode`:

```
>>> 'compression is based on redundancy'
>>> .huffmanEncode
>>> .encoding
>>> .size
128
```

Encode and then decode a `String`:

```
>>> 'compression is based on redundancy'
>>> .huffmanEncode.decodeString
'compression is based on redundancy'
```

* * *

See also: huffmanEncode

Guides: String Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/HuffmanCoding.html),
_W_
[1](https://en.wikipedia.org/wiki/Huffman_coding)

Further Reading: Huffman 1952
