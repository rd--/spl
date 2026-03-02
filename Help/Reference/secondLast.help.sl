# secondLast

- _second([x₁ x₂ …])_

Answer the second last element of the sequence _x_:

```
>>> [1 2 3 4 5 6 7].secondLast
7
```

A sequence by David James Sycamore,
OEIS [A343887](https://oeis.org/A343887):

~~~spl svg=A
let a = [1];
let s = [];
let m = 250;
1.toDo(m) { :i |
	let p = a.last;
	let q = a.allButLast;
	let r = nil;
	q.includes(p).not.if {
		a.add(q.count { :x | x > p })
	} {
		a.add(p + s[1]);
		s := s.allButFirst
	};
	r := a.secondLast;
	s.insertAt(
		r,
		s.lengthWhile { :x |
			x < r
		} + 1
	)
};
a.scatterPlot
~~~

![](sw/spl/Help/Image/secondLast-A.svg)

* * *

See also: at, first, last, second, size

Guides: List Functions
