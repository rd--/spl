# doWithBreak

- _doWithBreak(c, f/2)_

A variant of `do` that provides a no-argument block,
ordinarily named  _break_,
as the second argument to _f_.
Evaluating _break()_ exits the iteration.
Answers `nil`.

The comma sequence,
OEIS [A121805](https://oeis.org/A121805):

~~~spl svg=A oeis=A121805
let a = [1];
2:80.do { :n |
	let x = a[n - 1] % 10;
	0:9.doWithBreak { :y :break/0 |
		let m = a[n - 1] + (10 * x) + y;
		let d = m.integerDigits;
		(y = d[1]).ifTrue {
			a.add!(m);
			break()
		}
	}
};
a.scatterPlot
~~~

![](Help/Image/doWithBreak-A.svg)

* * *

See also: do, repeatForeverWithBreak

Guides: Block Functions, Control Functions, Non-local Return
