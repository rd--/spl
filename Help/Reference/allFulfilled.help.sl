# allFulfilled

- _allFulfilled(c)_

Answers a `Promise` which is fulfilled with a list of fulfillment values for the promises in the collection _c_,
or rejects with the reason of the first promise that rejects.
It resolves all elements of _c_ to promises as it runs this algorithm.

* * *

See also: Promise

Guides: Asynchronous Functions

References:
_Tc39_
[1](https://tc39.es/ecma262/multipage/control-abstraction-objects.html#sec-promise.all)
