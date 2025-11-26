# thenElse

- _thenElse(p, f:/1, g:/1)_

Schedules the block _f_ to be called if the promise _p_ resolves, with the value resolved to,
and the block _g_ to be called if _p_ rejects, with the reason for the rejection.
The answer is an equivalent `Promise` object to _p_.

* * *

See also: finally, onRejection, Promise, then

Guides: Asynchronous Functions

References
_Tc39_
[1](https://tc39.es/ecma262/multipage/control-abstraction-objects.html#sec-promise.prototype.then)

Categories: Scheduling
