# then

- _then(p, f/1)_

Schedules the block _f_ to be called when the promise _p_ resolves, with the value it has resolved to.
If the `Promise` rejects an `error` is raised.
The answer is an equivalent `Promise` object to _p_.

* * *

See also: Promise, finally, onRejection, thenElse

Guides: Asynchronous Functions, Scheduling Functions

References
_Tc39_
[1](https://tc39.es/ecma262/multipage/control-abstraction-objects.html#sec-promise.prototype.then)
