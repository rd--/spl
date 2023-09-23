# thenElse -- scheduling

- _thenElse(aPromise, onResolved:/1, onRejected:/1)_

Schedules _onResolved_ to be called if _aPromise_ resolves, with the value resolved to,
and _onRejected_ to be called if _aPromise_ rejects, with the reason for the rejection.
The answer is an equivalent Promise object to _aPromise_.

* * *

See also: Promise, then
