# upTo -- intervals

- _upTo(start, stop)_

Construct an Interval by counting up from _start_ to _stop_ by one.
Unlike _to_ it is an error if stop is less than start.

	1.upTo(5).Array = [1, 2, 3, 4, 5]
	{ 5.upTo(1) }.ifError { true }

* * *

See also: downTo, Interval, thenTo, to, toBy
