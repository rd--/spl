# huffmanEncode

- _huffmanEncode([x₁ x₂ …])_

Answer a `HuffmanEncoding` of the sequence _x_.

At `List`:

```
>>> [4 4 4 4 3 3 3 2 2 1]
>>> .huffmanEncode(==)
>>> .symbolTable
>>> .collect(size/1)
Map[
	4 -> 1,
	3 -> 2,
	1 -> 3,
	2 -> 3
]

>>> [4 4 4 4 3 3 3 2 2 1]
>>> .huffmanEncode(==)
>>> .encoding
>>> .size
19
```

At `String`,
the comparison function is set to `==`:

```
>>> 'wwwwxxxyyz'
>>> .huffmanEncode
>>> .symbolTable
>>> .collect(size/1)
Map[
	'w' -> 1,
	'x' -> 2,
	'z' -> 3,
	'y' -> 3
]

>>> 'wwwwxxxyyz'
>>> .huffmanEncode
>>> .encoding
>>> .size
(4 * 1) + (3 * 2) + ((2 + 1) * 3)
```

Length of the coding of each character of a `String` using `huffmanEncode`:

~~~spl svg=A
let a = 'compression is based on redundancy';
let b = a.huffmanEncode;
let c = b.symbolTable;
a.characters.collect { :x |
	c[x].size
}.stepPlot
~~~

![](Help/Image/huffmanEncode-A.svg)

* * *

See also: HuffmanCoding
