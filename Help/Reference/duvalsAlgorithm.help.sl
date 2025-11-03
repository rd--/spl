# duvalsAlgorithm

- _duvalsAlgorithm(s)_

Implement Duval’s algorithm for listing the Lyndon words of the sequence _s_.

Factor a Thue-Morse sequence:

```
>>> [
>>> 	0 1 1 0 1 0 0 1 1 0
>>> 	0 1 0 1 1 0 1 0 0 1
>>> 	0 1 1 0 0 1 1 0 1 0
>>> 	0 1 1 0 0 1 0 1 1 0
>>> 	0 1 1 0 1 0 0 1 0 1
>>> 	1 0 1 0 0 1 1 0 0 1
>>> 	0 1 1 0 1 0 0 1 0 1
>>> 	1 0 0 1 1 0 1 0 0 1
>>> 	0 1 1 0 1 0 0 1 1 0
>>> 	0 1 0 1 1 0 0 1 1 0
>>> 	1 0 0 1 1 0 0 1 0 1
>>> 	1 0 1 0 0 1 0 1 1 0
>>> 	0 1 1 0 1 0 0 1
>>> ].duvalsAlgorithm
[
	0 1 1
	;
	0 1
	;
	0 0 1 1
	;
	0 0 1 0 1 1 0 1
	;
	0 0 1 0 1 1 0 0 1 1 0
	1 0 0 1 1
	;
	0 0 1 0 1 1 0 0 1 1 0
	1 0 0 1 0 1 1 0 1 0 0
	1 1 0 0 1 0 1 1 0 1
	;
	0 0 1 0 1 1 0 0 1 1 0
	1 0 0 1 0 1 1 0 1 0 0
	1 1 0 0 1 0 1 1 0 0 1
	1 0 1 0 0 1 1 0 0 1 0
	1 1 0 1
	;
	0 0 1 0 1 1 0 0 1 1 0
	1
	;
	0 0 1
]
```

At `String`:

```
>>> 'abracadabra'.duvalsAlgorithm
['abracad' 'abr' 'a']
```

* * *

See also: lexicographicallyLeastRotation

References:
_W_
[1](https://en.wikipedia.org/wiki/Lyndon_word)
[2](https://en.wikipedia.org/wiki/Monoid_factorisation)

Further Reading: Duval 1983
