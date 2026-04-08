# lexicographicPermutations

- _lexicographicPermutations([x₁ x₂ …])_

Answer a `List` of the distinct permutations of the sequence _x_, in lexicographic order.

```
>>> [1 2 3 4].lexicographicPermutations
[
	1 2 3 4; 1 2 4 3; 1 3 2 4;
	1 3 4 2; 1 4 2 3; 1 4 3 2;
	2 1 3 4; 2 1 4 3; 2 3 1 4;
	2 3 4 1; 2 4 1 3; 2 4 3 1;
	3 1 2 4; 3 1 4 2; 3 2 1 4;
	3 2 4 1; 3 4 1 2; 3 4 2 1;
	4 1 2 3; 4 1 3 2; 4 2 1 3;
	4 2 3 1; 4 3 1 2; 4 3 2 1
]
```

Given a multiset, answers only the distinct permutations:

```
>>> [1 2 3 3].lexicographicPermutations
[
	1 2 3 3; 1 3 2 3; 1 3 3 2;
	2 1 3 3; 2 3 1 3; 2 3 3 1;
	3 1 2 3; 3 1 3 2; 3 2 1 3;
	3 2 3 1; 3 3 1 2; 3 3 2 1
]
```

The number of distinct permutations of a multiset is given by `multinomial`:

```
>>> [1 1 2].multinomial
12
```

List of permutations in lexicographic order,
OEIS [A030298](https://oeis.org/A030298):

~~~spl svg=A oeis=A030298
1:4.collect { :n |
	[1 .. n]
	.lexicographicPermutations
}.catenate.catenate.stepPlot
~~~

![](Help/Image/lexicographicPermutations-A.svg)

The lexicograph permutations,
each replaced with the number of its fixed points,
OEIS [A170942](https://oeis.org/A170942):

~~~spl svg=B oeis=A170942
1:5.collect { :n |
	[1 .. n]
	.lexicographicPermutations
	.collect { :p |
		p.permutationCycles(false)
		.count { :x |
			x.size = 1
		}
	}
}.catenate.discretePlot
~~~

![](Help/Image/lexicographicPermutations-B.svg)

* * *

See also: lexicographicPermutationsDo, minimumChangePermutations, multinomial, nextPermutationLexicographic, permutations, plainChanges

Guides: Permutation Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Permutations.html)

Categories: Enumerating, Permutations
