# huffmanEncode

- _huffmanEncode([x₁ x₂ …])_

Answer a `HuffmanEncoding` of the sequence _x_.

At `List`:

```
>>> [4 4 4 4 3 3 3 2 2 1]
>>> .huffmanEncode
>>> .symbolTable
[
	4: [0],
	1: [1 0 0],
	2: [1 0 1],
	3: [1 1]
]

>>> [4 4 4 4 3 3 3 2 2 1]
>>> .huffmanEncode
>>> .encoding
[0 0 0 0 1 1 1 1 1 1 1 0 1 1 0 1 1 0 0]
```

At `String`:

```
>>> 'wwwwxxxyyz'
>>> .huffmanEncode
>>> .symbolTable
[
	'w': [0],
	'z': [1 0 0],
	'y': [1 0 1],
	'x': [1 1]
]

>>> 'wwwwxxxyyz'
>>> .huffmanEncode
>>> .encoding
[0 0 0 0 1 1 1 1 1 1 1 0 1 1 0 1 1 0 0]

>>> 'wwwwxxxyyz'
>>> .huffmanEncode
>>> .encoding
>>> .size
(4 * 1) + (3 * 2) + ((2 + 1) * 3)
```

* * *

See also: HuffmanCoding
