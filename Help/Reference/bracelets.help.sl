# bracelets

- _bracelets(n, k)_

Answer all bracelets of length _n_ from the alphabet _0,1…k_.

Enumerate _6,2_ bracelets:

```
>>> bracelets(6, 2)
[
	0 0 0 0 0 0;
	0 0 0 0 0 1;
	0 0 0 0 1 1;
	0 0 0 1 0 1;
	0 0 0 1 1 1;
	0 0 1 0 0 1;
	0 0 1 0 1 1;
	0 0 1 1 1 1;
	0 1 0 1 0 1;
	0 1 0 1 1 1;
	0 1 1 0 1 1;
	0 1 1 1 1 1;
	1 1 1 1 1 1
]

>>> braceletCount(6, 2)
13

>>> necklaceCount(6, 2)
14
```

* * *

See also: braceletCount, necklaces

Guides: Combinatorial Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Necklace.html),
_W_
[1](https://en.wikipedia.org/wiki/Necklace_(combinatorics))

Further Reading: Sawada 2001
