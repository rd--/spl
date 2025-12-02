+List {
	quickSortVisiting { :s :left :right :f:/1 |
		let l = left;
		let r = right;
		(l <= r).ifTrue {
			let mid = s[(left + right) // 2];
			{ l <= r }.whileTrue {
				{ l <= right & { s[l] < mid } }.whileTrue {
					l := l + 1
				};
				{ r > left & { s[r] > mid } }.whileTrue {
					r := r - 1
				};
				(l <= r).ifTrue {
					s.swapWith(l, r);
					(l != r).ifTrue {
						f(s)
					};
					l := l + 1;
					r := r - 1
				};
				(left < r).ifTrue {
					quickSortVisiting(s, left, r, f:/1)
				};
				(l < right).ifTrue {
					quickSortVisiting(s, l, right, f:/1)
				}
			}
		};
		s
	}
	quickSortVisiting { :s :f:/1 |
		s.quickSortVisiting(1, s.size, f:/1)
	}
	quickSortMatrix { :s |
		let m = [s.copy];
		s.quickSortVisiting { :x |
			m.add(x.copy)
		};
		m
	}
}

# quickSortMatrix

- _quickSortMatrix([x₁ x₂ …])_

Sort the sequence _x_ using the quick sort algorithm,
record each intermediate state as a row in a matrix.

Matrix holds each intermediate permutation of the initial sequence in turn:

```
>>> [3 4 2 1 7 5 8 9 0 6]
>>> .quickSortMatrix
[
	3 4 2 1 7 5 8 9 0 6;
	3 4 2 1 6 5 8 9 0 7;
	3 4 2 1 0 5 8 9 6 7;
	0 4 2 1 3 5 8 9 6 7;
	0 1 2 4 3 5 8 9 6 7;
	0 1 2 3 4 5 8 9 6 7;
	0 1 2 3 4 5 6 9 8 7;
	0 1 2 3 4 5 6 8 9 7;
	0 1 2 3 4 5 6 7 9 8;
	0 1 2 3 4 5 6 7 8 9
]
```

Plot matrix of sucessive sort states:

~~~spl svg=A
Sfc32(396871)
.randomPermutation(11)
.list
.quickSortMatrix
.transpose
.matrixPlot
~~~

![](sw/spl/Help/Image/quickSortMatrix-A.svg)

Sort longer list:

~~~spl png=B
Sfc32(369781)
.randomPermutation(64)
.list
.quickSortMatrix
.transpose
.rescale
.Greymap
~~~

![](sw/spl/Help/Image/quickSortMatrix-B.png)

* * *

See also: quickSort, sort

Guides: Sort Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Quick_sort)

