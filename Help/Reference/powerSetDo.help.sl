# powerSetDo

- _powerSetDo(aCollection, aBlock:/1)_

Apply _aBlock_ to each element of the power set of _aCollection_.

Visit all subsets of _123_ written as a `Range`:

```
>>> let l = [];
>>> 1:3.powerSetDo { :each | l.add(each) };
>>> l
[; 1; 2; 1 2; 3; 1 3; 2 3; 1 2 3]
```

At `IdentitySet`:

```
>>> let l = [];
>>> [1 2 3].asIdentitySet.powerSetDo { :each | l.add(each) };
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
