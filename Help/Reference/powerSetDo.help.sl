# powerSetDo

- _powerSetDo(c, f:/1)_

Apply the block _f_ to each element of the power set of the collection _c_.
The power set includes the empty subset.

Visit all subsets of _1,2,3_ written as a `Range`:

```
>>> let l = [];
>>> 1:3.powerSetDo { :each |
>>> 	l.add(each)
>>> };
>>> l
[; 1; 2; 1 2; 3; 1 3; 2 3; 1 2 3]
```

At `IdentitySet`:

```
>>> let l = [];
>>> [1 2 3].asIdentitySet.powerSetDo { :each |
>>> 	l.add(each)
>>> };
>>> l
[
	;
	1;
	2;
	1 2;
	3;
	1 3;
	2 3;
	1 2 3
].collect(asIdentitySet:/1)
```

* * *

See also: powerSet, subsets, tuples

Guides: Iteration Functions
