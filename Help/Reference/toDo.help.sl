# toDo

- _toDo(i, j, f:/1)_

Iterate over the range from the start index _i_ to the stop index _j_ counting by one.

```
>>> let l = [];
>>> 1.toDo(9) { :each | l.add(each) };
>>> l
[1 2 3 4 5 6 7 8 9]
```

If _j_ is less than _i_ the range is empty and there are no values to iterate over:

```
>>> let l = [];
>>> 9.toDo(1) { :each | l.add(each) };
>>> l
[]
```

Spiral constructed on the nodes of the triangular net
in which each new term is the least nonnegative integer distinct from its neighbors,
OEIS [A274921](https://oeis.org/A274921),
minus two,
also
OEIS [A274920](https://oeis.org/A274920),
minus one:

~~~spl svg=A oeis=A274921
let a = [1 2 3];
let b = 3;
let c = 2;
let d = 2;
let e = 1;
let f = 1;
3.toDo(200) { :n |
	a.add(
		(n = b).if {
			let r = b;
			b := c + d - f + 1;
			f := e;
			e := d;
			d := c;
			c := r;
			a[n - 1]
		} {
			6 - a[n] - a[n - 1]
		}
	)
};
(a - 2).discretePlot
~~~

![](sw/spl/Help/Image/toDo-A.svg)

* * *

See also: do, downToDo, Range, to, toByDo

Guides: Iteration Functions

References:
_Smalltalk_
5.6.2.40

Categories: Enumeration, Range
