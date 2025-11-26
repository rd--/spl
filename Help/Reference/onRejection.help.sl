# onRejection

- _onRejection(p, f:/1)_

Schedule the block _f_ be called if the promise _p_ is rejected,
with the reason as argument.
Answer an equivalent `Promise` object to _p_.

`onRejection` is an idiom over `thenElse`,
equivalent to _p.thenElse(nil.constant, f:/1)_.

* * *

See also: finally, Promise, then, thenElse

Guides: Asynchronous Functions

References
_Tc39_
[1](https://tc39.es/ecma262/multipage/control-abstraction-objects.html#sec-promise.prototype.catch)
