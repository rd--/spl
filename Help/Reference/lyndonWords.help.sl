# lyndonWords

- _lyndonWords(alphabet, n)_

Answer a `List` of the Lyndon words up to size _n_ on _alphabet_.
A Lyndon word is a nonempty sequence that is strictly smaller in lexicographic order than all of its rotations.

```
>>> [0 1].lyndonWords(5)
[
	0;
	0 0 0 0 1;
	0 0 0 1;
	0 0 0 1 1;
	0 0 1;
	0 0 1 0 1;
	0 0 1 1;
	0 0 1 1 1;
	0 1;
	0 1 0 1 1;
	0 1 1;
	0 1 1 1;
	0 1 1 1 1;
	1
]
```

The numbers of binary Lyndon words of each length:

```
>>> 1:12.collect { :n |
>>> 	[0 1].lyndonWords(n).select { :w |
>>> 		w.size = n
>>> 	}.size
>>> }
[2 1 2 3 6 9 18 30 56 99 186 335]
```

The lexicographic sequence of Lyndon words of lengths divisible by _n_ gives the lexicographically smallest de Bruijn sequence:

```
>>> ['a' 'b' 'c'].lyndonWords(2).catenate
['a' 'a' 'b' 'a' 'c' 'b' 'b' 'c' 'c']

>>> ['a' 'b' 'c'].deBruijnSequence(2)
['a' 'a' 'b' 'a' 'c' 'b' 'b' 'c' 'c']
```

* * *

See also: deBruijnSequence

References:
_Mathematica_
[1](https://mathworld.wolfram.com/LyndonWord.html),
_OEIS_
[1](https://oeis.org/A001037),
_W_
[1](https://en.wikipedia.org/wiki/Lyndon_word)

Further Reading: Booth 1980
