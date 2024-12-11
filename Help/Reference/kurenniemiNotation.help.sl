# kurenniemiNotation

Staff and ledger lines are drawn in logarithmic space:

~~~
let d = [2 5 9 12 16 19 23];
let l = 0:3.collect { :each |
	each * 24 + d
}.concatenation;
let s = [
	19 23 26 29 33
	40 43 47 50 53
];
let p = l.collect { :each |
	let y = each;
	let isStaffLine = s.includes(each);
	let [x1, x2] = isStaffLine.if {
		[0 30]
	} {
		[10 20]
	};
	Line([x1 y; x2 y])
};
let q = 60.divisors.collect { :each |
	let y = each.ratioToCents / 100;
	Point([15 y])
};
[p q].LineDrawing
~~~

![](sw/spl/Help/Image/kurenniemiNotation-A.svg)
