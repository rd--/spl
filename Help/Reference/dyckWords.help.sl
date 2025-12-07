# dyckWords

- _dyckWords(n, [a b]=[1 0])_

Enumerate all Dyck words of size _2n_.
A Dyck word is a balanced string of brackets _a_ and _b_.
The set of Dyck words forms a Dyck language.
Common brakets are _1,0_ or _1,-1_ or _2,0_ or _(,)_.

Words of length four on _1,0_:

```
>>> 2.dyckWords([1 0])
[
	1 1 0 0;
	1 0 1 0
]

>>> 2.catalanNumber
2
```

Words of length six on _1,0_:

```
>>> 3.dyckWords([1 0])
[
	1 1 1 0 0 0;
	1 0 1 1 0 0;
	1 1 0 1 0 0;
	1 0 1 0 1 0;
	1 1 0 0 1 0
]

>>> 3.catalanNumber
5
```

Words of length eight:

```
>>> 4.dyckWords([1 0])
[
	1 1 1 1 0 0 0 0;
	1 0 1 1 1 0 0 0;
	1 1 0 1 1 0 0 0;
	1 1 1 0 1 0 0 0;
	1 0 1 1 0 1 0 0;
	1 1 0 1 0 1 0 0;
	1 0 1 0 1 1 0 0;
	1 1 0 0 1 1 0 0;
	1 1 1 0 0 1 0 0;
	1 0 1 1 0 0 1 0;
	1 1 0 1 0 0 1 0;
	1 0 1 0 1 0 1 0;
	1 1 0 0 1 0 1 0;
	1 1 1 0 0 0 1 0
]

>>> 4.catalanNumber
14
```

The number of Dyck words of length _2n_ is the _n_-th Catalan number.

```
>>> 1:7.collect { :each |
>>> 	each.dyckWords.size
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

Further Reading: Deutsch 1999, Duchon 2000, Kása 2009, Lapey 2022, Ruskey 2008

Categories: Enumerating
