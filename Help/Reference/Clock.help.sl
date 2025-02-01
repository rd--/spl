# Clock

- _Clock()_

A `Type` to organise scheduling.
A priority queue maintains a list of scheduled blocks.
When new elements are added to the schedule, the wakeup time of the clock is adjusted as required.

There is a `clock` method at `Cache`.

Start printing a message once per second using the system clock:

~~~spl scheduler
let k = 1;
system.clock.schedule(0) { :t |
	[t, k].postLine;
	k := k + 1;
	1
}
~~~

Schedule for the system clock to be cleared in nine seconds time:

~~~spl scheduler
system.clock.schedule(9) { :t |
	system.clock.removeAll;
	nil
}
~~~

Print random numbers at random intervals until the interval is less than a tenth of a second:

~~~spl scheduler
system.clock.schedule(0) { :t |
	let x = system.nextRandomFloat;
	[t, x].postLine;
	(x > 0.1).if {
		x
	} {
		'end'.postLine;
		nil
	}
}
~~~

A scheduling process that passes an object between iterations:

~~~spl scheduler
system.clock
.scheduleInjecting(0, 1) { :t :i |
	let x = system.nextRandomFloat;
	[t, i, x].postLine;
	(x > 0.1).if {
		[x, i + 1]
	} {
		nil
	}
}
~~~

`repeatEvery` separates the _on wakeup_ and _next delay_ aspects into separate blocks:

~~~spl scheduler
system.clock.repeatEvery { :t :d |
	[t, d].postLine
} {
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
system.clock.recurseEvery(
	{ :t :x |
		[t, x].postLine;
		(x < 7).if {
			x + 1
		} {
			nil
		}
	},
	1
) {
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

Categories: Scheduling
