# allFulfilled

- _allFulfilled(aCollection)_

Answers a `Promise` which is fulfilled with an array of fulfillment values for the promises in _aCollection_,
or rejects with the reason of the first promise that rejects.
It resolves all elements of _aCollection_ to promises as it runs this algorithm.

* * *

See also: Promise

References:
_Tc39_
[1](https://tc39.es/ecma262/multipage/control-abstraction-objects.html#sec-promise.all)
