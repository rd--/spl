# Clock

- _Clock()_

A type to organise scheduling.
A priority queue maintains a list of scheduled blocks.
When new elements are added to the schedule, the wakeup time of the clock is adjusted as required.

There is a _clock_ method at _Cache_.

Start printing a message once per second using the system clock:

	let k = 1;
	system.clock.schedule(0) { :t |
		[t, k].postLine; k := k + 1; 1
	}

Schedule for the system clock to be cleared in nine seconds time:

	system.clock.schedule(9) { :t |
		system.clock.removeAll;
		nil
	}

Print random numbers at random intervals until the interval is less than a tenth of a second:

	system.clock.schedule(0) { :t |
		let x = 1.randomFloat;
		[t, x].postLine;
		(x > 0.1).if {
			x
		} {
			'end'.postLine;
			nil
		}
	}

A scheduling process that passes an object between iterations:

	system.clock.scheduleInjecting(0, 1) { :t :i |
		let x = 1.randomFloat;
		[t, i, x].postLine;
		(x > 0.1).if {
			[x, i + 1]
		} {
			nil
		}
	}

_repeatEvery_ separates the _on wakeup_ and _next delay_ aspects into separate blocks:

	system.clock.repeatEvery { :t :d |
		[t, d].postLine
	} {
		let x = 1.randomFloat;
		(x > 0.1).if {
			x
		} {
			nil
		}
	}

_recurseEvery_ is a related interface to _scheduleInjecting_, a _nil_ at either block stops the sequence.

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
		let x = 1.randomFloat;
		(x > 0.1).if {
			x
		} {
			nil
		}
	}

* * *

Categories: Scheduling
