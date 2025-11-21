# heinzNumber

- _heinzNumber(p)_

Answer the Heinz number of the integer partition _p_,
the `product` of `prime` of _p_.

```
>>> 1:28.collect { :n |
>>> 	n.primeFactors
>>> 	.primePi
>>> 	.heinzNumber
>>> }
[1 .. 28]
```

Heinz numbers of integer partitions whose length divides their sum,
OEIS [A316413](https://oeis.org/A316413):

```
>>> 2:99.select { :n |
>>> 	let p = n.primeFactors.primePi;
>>> 	p.sum.divisible(p.size)
>>> }
[
	 2  3  4  5  7  8  9 10 11 13
	16 17 19 21 22 23 25 27 28 29
	30 31 32 34 37 39 41 43 46 47
	49 53 55 57 59 61 62 64 67 68
	71 73 78 79 81 82 83 84 85 87
	88 89 90 91 94 97 98 99
]
```

* * *

See also: integerPartitionRank, integerPartitionUnrank, prime, product

Guides: Integer Functions

References:
_OEIS_
[1](https://oeis.org/A316413)
