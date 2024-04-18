# dyckWords

- _dyckWords(anInteger)_

Enumerate all Dyck words of size _anInteger * 2_.
A Dyck word is a balanced string of brackets.
The set of Dyck words forms a Dyck language.

Words of length six:

```
>>> 3.dyckWords
[
	0 0 0 1 1 1;
	0 0 1 0 1 1;
	0 0 1 1 0 1;
	0 1 0 0 1 1;
	0 1 0 1 0 1
]
```

Words of length eight:

```
>>> 4.dyckWords
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
```

The number of Dyck words of length _2 * n_ is the _n_-th Catalan number.

```
>>> 1:7.collect { :each |
>>> 	each.dyckWords.size
>>> }
[1 2 5 14 42 132 429]

>>> 1:7.collect(catalanNumber:/1)
[1 2 5 14 42 132 429]
```

* * *

See also: catalanNumber

Refernces:
_Mathematica_
[1](https://mathworld.wolfram.com/DyckLanguage.html)
[2](https://mathworld.wolfram.com/DyckPath.html),
_W_
[1](https://en.wikipedia.org/wiki/Dyck_language)

Further Reading: Deutsch (1999), Duchon (2000), Kása (2009)

Categories: Enumerating
