# schedule -- process

- _schedule(aClock, deltaTime, aBlock:/1)_
- _schedule(deltaTime, aBlock:/1)_ ⇒ _aClock = system.clock_
- _schedule(aBlock:/1)_ ⇒ _deltaTime = 0_

Schedule _aBlock_ for _deltaTime_ (in seconds) at _aClock_.
When _aBlock_ is evaluated, with the current logical time as parameter, the answer is either an interval at which to re-schedule, or _nil_ to halt.

* * *

See also: repeatEvery, scheduleInjecting, Clock
