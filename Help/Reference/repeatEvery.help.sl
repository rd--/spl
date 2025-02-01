# repeatEvery

- _repeatEvery(aClock, aBlock:/2, aDelay)_

Schedule _aBlock_ at intervals given by _aDelay_ on _aClock_.
_aBlock_ receives the current time and the delay interval before the block will execute next.

Print a message every few seconds indefinitely:

~~~spl scheduler
system.clock.repeatEvery { :t :d |
	['About to delay for', t, d].postLine
} {
	1:5.atRandom
}
~~~

Clear clock to end:

~~~spl scheduler
system.clock.removeAll
~~~

* * *

See also: recurseEvery, schedule

Categories: Scheduling
