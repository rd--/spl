# onRejection

- _onRejection(aPromise, aBlock:/1)_ ⟹ _thenElse(aPromise, { :unused | nil }, aBlock:/1)_

Schedule _aBlock_ be called if _aPromise_ is rejected,
with the reason as argument.
Answer an equivalent `Promise` object to _aPromise_.

`onRejection` is an idiom over `thenElse`.

* * *

See also: finally, Promise, then, thenElse

References
_Tc39_
[1](https://tc39.es/ecma262/multipage/control-abstraction-objects.html#sec-promise.prototype.catch)
