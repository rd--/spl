# Promise -- process type

A _Promise_ object represents the eventual completion (or failure) of an asynchronous operation and its resulting value.

A Promise is either _pending_ or _resolved_ or _rejected_.

When _resolved_ the Promise holds a _value_ which is the answer.
When _rejected_ the Promise holds a _reason_ explaing why it did not resolve.
A Promise that is no longer pending is _settled_.

- _Promise(aBlock:/2)_

Answer a Promise tied to the execution of _aBlock_,
which recieves two blocks, _resolve:/1_ and _reject:/1_, as arguments.
When _aBlock_ runs either _resolve_ or _reject_ the answer Promise is resolved or rejected.

- _Promise(anArray)_

Answer a Promise that resolves when all of the promises in _anArray_ resolve,
and rejects when any of the promises rejects.

* * *

See also: then, thenElse
