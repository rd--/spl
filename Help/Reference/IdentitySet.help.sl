# IdentitySet

- _IdentitySet()_

`IdentitySet` is a `Type` representing a collection of objects without duplicates.
The comparison operator is `==`, not `=`,
i.e. `IdentitySet` is an identity set, not an equality set.

The empty set constructor:

```
>>> IdentitySet().size
0
```

Set predicate:

```
>>> IdentitySet()
>>> .isIdentitySet
true

>>> IdentitySet()
>>> .isSet
true
```

Sets are unordered collections,
and have the expected mathematical behavior in relation to scalars:

```
>>> [1 2 3].asIdentitySet * 5
[5 10 15].asIdentitySet
```

Plot sequence where each term is the least integer such that adjacent products are distinct,
OEIS [A088177](https://oeis.org/A088177):

~~~spl svg=A
let t = [1 1];
3.toDo(200) { :n |
	t.add(1);
	{
		let s = IdentitySet();
		1.toDo(n - 1) { :i |
			s.include(t[i] * t[i + 1])
		};
		s.size < (n - 1)
	}.whileTrue {
		t[n] := t[n] + 1
	}
};
t.scatterPlot
~~~

![](sw/spl/Help/Image/IdentitySet-A.svg)

Calculate sequence where each term is the least integer such that adjacent products are distinct,
OEIS [A088177](https://oeis.org/A088177) _(a)_,
and plot adjacent products,
OEIS [A088178](https://oeis.org/A088178) _(b)_:

~~~spl svg=B
let a = [1 1];
let b = [1];
let p = IdentitySet(b);
let x = 1;
250.timesRepeat {
	let i = 1;
	let y = x;
	{
		p.includes(y)
	}.whileTrue {
		i := i + 1;
		y := y + x
	};
	p.add(y);
	x := i;
	a.add(x);
	b.add(y)
};
b.scatterPlot
~~~

![](sw/spl/Help/Image/IdentitySet-B.svg)

* * *

See also: asIdentitySet, add, IdentityMultiset, include, isImmediate, isIdentitySet, List

Guides: Set Functions

References:
_Smalltalk_
5.7.7

Categories: Collection, Type
