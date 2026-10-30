# HuffmanCoding

- _HuffmanCoding(symbolTable, encoding)_

A `Type` representing the Huffman encoding of a sequence of symbols _x_.
The coding consists of a `symbolTable` giving the code for each symbol,
and the encoded sequence.
Each code is a sequence of bits, stored as `zero` or `one`.

Encode a `List` of integers using `huffmanEncode`:

```
>>> [1 2 2 3 3 3 4 4 4 4 5 5 5 5 5]
>>> .huffmanEncode
HuffmanCoding(
	Map[
		1 -> [0 0 0],
		2 -> [0 0 1],
		3 -> [0 1],
		4 -> [1 0],
		5 -> [1 1]
	],
	[
		0 0 0 0 0 1 0 0 1 0
		1 0 1 0 1 1 0 1 0 1
		0 1 0 1 1 1 1 1 1 1
		1 1 1
	]
)
```

Encode and then decode:

```
>>> [5 2 5 2 4 4 3 5 3 4 1 3 5 5 4]
>>> .huffmanEncode.decode
[5 2 5 2 4 4 3 5 3 4 1 3 5 5 4]
```

Encode and then decode a `String`:

```
>>> 'Compression is based on redundancy'
>>> .huffmanEncode.decodeString
'Compression is based on redundancy'
```

* * *

See also: huffmanEncode

References:
_Mathematica_
[1](https://mathworld.wolfram.com/HuffmanCoding.html),
_W_
[1](https://en.wikipedia.org/wiki/Huffman_coding)

Further Reading: Huffman 1952
