# downTo -- interval constructor

- _downTo(start, stop)_

Construct an Interval by counting down from _start_ to _stop_ by one.
Unlike to it is an error is stop is greater than start.

	  5.downTo(1).asArray = [5 4 3 2 1]
	  { 1.downTo(5) }.ifError { true }

* * *

See also: downTo, Interval, thenTo, toBy, upOrDownTo, upTo
