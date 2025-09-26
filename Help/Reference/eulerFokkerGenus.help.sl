# eulerFokkerGenus

- _eulerFokkerGenus([p₁ p₂ …])_

Answer the Euler-Fokker genus of _p_.

The Euler-Fokker genus is the combination of each possible `combinationProductSet`,
or equally a combination product set is a slice of the genus.

The _1 3 5 7_ genus:

```
>>> [1 3 5 7].eulerFokkerGenus
[
	1/1 35/32 5/4 21/16
	3/2 105/64 7/4 15/8
]
```

The _3 3 3 5_ genus:

```
>>> [3 3 3 5].eulerFokkerGenus
[
	1/1 135/128 9/8 5/4 45/32
	3/2 27/16 15/8
]
```

Draw the _3 3 3 5 5_ genus:

~~~spl svg=A
[3 3 3 5 5].eulerFokkerGenus
.asRatioTuning
.tuningLatticeGraph
~~~

![](sw/spl/Help/Image/eulerFokkerGenus-A.svg)

Draw the _3 3 3 5 7 11_ genus:

~~~spl svg=B
[3 3 3 5 7 11].eulerFokkerGenus
.asRatioTuning
.tuningLatticeGraph
~~~

![](sw/spl/Help/Image/eulerFokkerGenus-B.svg)

Draw the _3 5 7 11 13_ genus:

~~~spl svg=C
[3 5 7 11 13].eulerFokkerGenus
.asRatioTuning
.tuningLatticeGraph
~~~

![](sw/spl/Help/Image/eulerFokkerGenus-C.svg)

* * *

See also: combinationProductSet, tuningLatticeGraph, nub, product, octaveReduce, subsets

Guides: Tuning Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Euler%E2%80%93Fokker_genus),
_Xenharmonic_
[1](https://en.xen.wiki/w/Euler-Fokker_genus)

Categories: Tuning
