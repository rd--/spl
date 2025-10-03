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
	[
		1: [0 0 0],
		2: [0 0 1],
		3: [0 1],
		4: [1 0],
		5: [1 1]
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

Encode a `String` using `huffmanEncode`:

```
>>> 'compression is based on redundancy'
>>> .huffmanEncode
HuffmanCoding(
	[
		'd': [0 0 0],
		'm': [0 0 1 0 0],
		'u': [0 0 1 0 1],
		'c': [0 0 1 1],
		'r': [0 1 0 0],
		'i': [0 1 0 1],
		' ': [0 1 1],
		'n': [1 0 0],
		's': [1 0 1],
		'a': [1 1 0 0],
		'y': [1 1 0 1 0],
		'p': [1 1 0 1 1 0],
		'b': [1 1 0 1 1 1],
		'o': [1 1 1 0],
		'e': [1 1 1 1]
	],
	[
		0 0 1 1 1 1 1 0 0 0
		1 0 0 1 1 0 1 1 0 0
		1 0 0 1 1 1 1 1 0 1
		1 0 1 0 1 0 1 1 1 1
		0 1 0 0 0 1 1 0 1 0
		1 1 0 1 0 1 1 1 1 0
		1 1 1 1 1 0 0 1 0 1
		1 1 1 1 0 0 0 0 1 1
		1 1 1 0 1 0 0 0 1 1
		0 1 0 0 1 1 1 1 0 0
		0 0 0 1 0 1 1 0 0 0
		0 0 1 1 0 0 1 0 0 0
		0 1 1 1 1 0 1 0
	]
)
```

Encode and then decode a `String`:

```
>>> 'compression is based on redundancy'
>>> .huffmanEncode.decodeString
'compression is based on redundancy'
```

* * *

See also: huffmanEncode

References:
_Mathematica_
[1](https://mathworld.wolfram.com/HuffmanCoding.html),
_W_
[1](https://en.wikipedia.org/wiki/Huffman_coding)

Further Reading: Huffman 1952
