# Clock

- _Clock()_

A `Type` to organise scheduling.
A priority queue maintains a list of scheduled blocks.
When new elements are added to the schedule, the wakeup time of the clock is adjusted as required.

There is a `clock` method at `Cache`.

Start printing a message once per second using the system clock:

~~~spl scheduler
let k = 1;
{ :t |
	[t, k].postLine;
	k := k + 1;
	1
}.schedule
~~~

Schedule for the system clock to be cleared in nine seconds time:

~~~spl scheduler
{ :t |
	system.clock.removeAll;
	nil
}.schedule(9)
~~~

Print random numbers at random intervals until the interval is less than a tenth of a second:

~~~spl scheduler
{ :t |
	let x = system.nextRandomFloat;
	[t, x].postLine;
	(x > 0.1).if {
		x
	} {
		'end'.postLine;
		nil
	}
}.schedule
~~~

A scheduling process that passes an object between iterations:

~~~spl scheduler
{ :t :i |
	let x = system.nextRandomFloat;
	[t, i, x].postLine;
	(x > 0.1).if {
		[x, i + 1]
	} {
		nil
	}
}.scheduleInjecting(1)
~~~

`repeatEvery` separates the _on wakeup_ and _next delay_ aspects into separate blocks:

~~~spl scheduler
{ :t :d |
	[t, d].postLine
}.repeatEvery {
	let x = system.nextRandomFloat;
	(x > 0.1).if {
		x
	} {
		nil
	}
}
~~~

`recurseEvery` is a related interface to `scheduleInjecting`, a `nil` at either block stops the sequence.

~~~spl scheduler
{ :t :x |
	[t, x].postLine;
	(x < 7).if {
		x + 1
	} {
		nil
	}
}.recurseEvery(1) {
	let x = system.nextRandomFloat;
	(x > 0.1).if {
		x
	} {
		nil
	}
}
~~~

* * *

See also: clock, recurseEvery, repeatEvery, schedule, scheduleInjecting, system

Guides: Scheduling Functions

Categories: Scheduling
