# then -- scheduling

- _then(aPromise, aBlock:/1)_

Schedules _aBlock_ to be called when _aPromise_ resolves, with the value resolved to.
If the Promise rejects an error is raised.
The answer is an equivalent Promise object to _aPromise_.

* * *

See also: Promise, thenElse
