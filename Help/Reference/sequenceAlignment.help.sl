# sequenceAlignment

- _sequenceAlignment(s₁, s₂)_

Find an optimal alignment of sequences of elements in the sequences _s₁_ and _s2_,
and answers a list of successive matching and differing sequences.

Sequences that differ in one place, at the third letter:

```
>>> sequenceAlignment(
>>> 	'CGGAGT',
>>> 	'CGTAGT'
>>> )
[
	'CG',
	['G' 'T'],
	'AGT'
]
```

An aligment that includes insertions and differences:

```
>>> sequenceAlignment(
>>> 	'GCATGCG',
>>> 	'GATTACA'
>>> )
[
	'G',
	['C' ''],
	'AT',
	['G' 'TA'],
	'C',
	['G' 'A']
]
```

The same alignment, with values given as integers:

```
>>> sequenceAlignment(
>>> 	[3 2 1 4 3 2 3],
>>> 	[3 1 4 4 1 2 1]
>>> )
[
	[3],
	[2;],
	[4 3],
	[2; 1 2],
	[2]
	[3; 1]
]
```

* * *

See also: needlemanWunschAlgorithm

Guides: Distance Functions, Sequence Alignment Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/SequenceAlignment.html)
