# dyckWords

- _dyckWords(n, [a b]=[1 0])_

Enumerate all Dyck words of size _2n_.
A Dyck word is a balanced string of brackets _a_ and _b_.
The set of Dyck words forms a Dyck language.

Words of length four on _-1,1_:

```
>>> 2.dyckWords([-1 1])
[
	-1 -1 1 1;
	-1 1 -1 1
]

>>> 2.catalanNumber
2
```

Words of length six on _0,1_:

```
>>> 3.dyckWords([0 1])
[
	0 0 0 1 1 1;
	0 0 1 0 1 1;
	0 0 1 1 0 1;
	0 1 0 0 1 1;
	0 1 0 1 0 1
]

>>> 3.catalanNumber
5
```

Words of length eight:

```
>>> 4.dyckWords([0 1])
[
	0 0 0 0 1 1 1 1;
	0 0 0 1 0 1 1 1;
	0 0 0 1 1 0 1 1;
	0 0 0 1 1 1 0 1;
	0 0 1 0 0 1 1 1;
	0 0 1 0 1 0 1 1;
	0 0 1 0 1 1 0 1;
	0 0 1 1 0 0 1 1;
	0 0 1 1 0 1 0 1;
	0 1 0 0 0 1 1 1;
	0 1 0 0 1 0 1 1;
	0 1 0 0 1 1 0 1;
	0 1 0 1 0 0 1 1;
	0 1 0 1 0 1 0 1
]

>>> 4.catalanNumber
14
```

The number of Dyck words of length _2n_ is the _n_-th Catalan number.

```
>>> 1:7.collect { :each |
>>> 	each.dyckWords([-1 1]).size
>>> }
[1 2 5 14 42 132 429]

>>> 1:7.collect(catalanNumber:/1)
[1 2 5 14 42 132 429]
```

* * *

See also: catalanNumber, isDyckWord

Guides: Combinatorial Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/DyckLanguage.html)
[2](https://mathworld.wolfram.com/DyckPath.html),
_W_
[1](https://en.wikipedia.org/wiki/Dyck_language)

Further Reading: Deutsch 1999, Duchon 2000, Kása 2009

Categories: Enumerating
