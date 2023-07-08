# thenTo -- interval constructor

- _thenTo(start, then, stop)_

Construct an Interval by counting up or down from _start_ to _then_ through until _stop_.

	  1.thenTo(3, 9).asArray = [1, 3, 5, 7, 9]
	  9.thenTo(7, 1).asArray = [9, 7, 5, 3, 1]

* * *

See also: downTo, Interval, to, toBy, upTo
