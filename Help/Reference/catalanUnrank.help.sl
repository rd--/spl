# catalanUnrank

- _catalanUnrank(n)_

Implement an un-ranking algorithm for the lexicographic ordering of the Catalan families.
The unranking table is cached as constructed.

First few terms,
OEIS [A014486](https://oeis.org/A014486):

```
>>> 0:53.collect(catalanUnrank:/1)
[
	 0   2   10  12  42
	 44  50  52  56 170
	172 178 180 184 202
	204 210 212 216 226
	228 232 240 682 684
	690 692 696 714 716
	722 724 728 738 740
	744 752 810 812 818
	820 824 842 844 850
	852 856 866 868 872
	880 906 908 914
]
```

Plot first few terms:

~~~spl svg=A
0:250.collect(catalanUnrank:/1)
.scatterPlot
~~~

![](sw/spl/Help/Image/catalanUnrank-A.svg)


cat x = x.catalanNumber
b2d x = x.fromDigits(2)
d2b x = x.integerDigits(2)

tree[n_] := Join[Table[1, {i, 1, n}], Table[0, {i, 1, n}]];
nexttree[t_] := Flatten[Reverse[t]/. {a___, 0, 0, 1, b___}:> Reverse[{Sort[{a, 0}]//Reverse, 1, 0, b}]];
wood[ n_ /; n<8 ] := NestList[ nexttree, tree[ n ], cat[ n ]-1 ];
bracket[ tree_ ] := (Flatten[ {tree, 0} ]/. 0->{0})//.{1, z___, 1, a_List, b_List, y___}:>{1, z, {1, a, b}, y};
widthfirst[ dectree_ ] := b2d[ Drop[ Flatten[ {Table[ Cases[ Level[ #, {k}, z ], _Integer ], {k, Depth[ # ]-1} ] }/.z->List ], -1 ] ] & @(bracket@d2b[ dectree ]);
Ordering[Reverse[widthfirst /@ b2d /@ wood[6]]]

let tree = { :n | List(n, 1) ++ List(n, 0) };


* * *

See also: catalanRank, isDyckWord

Guides: Combinatorial Functions

References:
_OEIS_
[1](https://oeis.org/A014486)
