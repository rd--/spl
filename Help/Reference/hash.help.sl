# hash

- _hash(s, k=2166136261)_

Answer an integer hash code for the string _s_,
given the seed _k_,
using the _Murmur_ hash algorithm.

```
>>> 'abcdef'.hash
1027415244
```

Similar strings answer disimilar hashes:

```
>>> 'abcdee'.hash
2196172908
```

Hashes of the first six letters of the alphabet:

```
>>> 'abcdef'.contents.collect(hash:/1)
[
	3007810216
	 448595256
	1180910169
	1461823195
	2696877920
	 634392818
]
```

Hash an integer by converting to a string:

```
>>> let n = 1987;
>>> let w = n.asWords;
>>> let s = n.asString;
>>> (w.contractTo(30), w.hash, s, s.hash)
(
	'one thousand, ... eighty-seven',
	1861050329,
	'1987',
	2500117931
)
```

* * *

See also: crc16, digest, fnv1aHash, String

Guides: String Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/HashFunction.html)
[2](https://reference.wolfram.com/language/ref/Hash.html),
_W_
[1](https://en.wikipedia.org/wiki/Hash_function)
[1](https://en.wikipedia.org/wiki/MurmurHash)
