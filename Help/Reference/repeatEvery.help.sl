# repeatEvery

- _repeatEvery(f:/2, n, c)_

Schedule the block _f_ at intervals given by delay _n_ on the clock _c_.
_f_ receives the current time and the delay interval before the block will execute next.

Print a message every few seconds indefinitely:

~~~spl scheduler
{ :t :d |
	[
		'Clock says', t,
		'About to delay for', d
	].postLine
}.repeatEvery {
	1:5.atRandom
}
~~~

Clear clock to end:

~~~spl scheduler
system.clock.removeAll
~~~

* * *

See also: recurseEvery, schedule

Guides: Scheduling Functions

Categories: Scheduling
