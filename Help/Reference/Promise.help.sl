# Promise

- _Promise(f:/2)_
- _Promise([p₁ p₂ …])_

A `Promise` is a `Type` representing the eventual completion (or failure) of an asynchronous operation and its resulting value.

A `Promise` is either _pending_ or _resolved_ or _rejected_.

When _resolved_ the `Promise` holds a _value_ which is the answer.
When _rejected_ the `Promise` holds a _reason_ explaining why it did not resolve.
A `Promise` that is no longer pending is _settled_.

In the `Block` case, answer a `Promise` tied to the execution of the two-argument block _f_,
which recieves two blocks, _resolve:/1_ and _reject:/1_, as arguments.
When _f_ runs either _resolve_ or _reject_ the answer `Promise` is resolved or rejected.

In the `List` case, answer a `Promise` that resolves when all of the promises in the list _p_ resolve,
and rejects when any of the promises rejects.

Construct a `Promise` that will resolve to the string _'x'_ after one second:

```
>>> Promise { :f:/1 :g:/1 |
>>> 	{
>>> 		f('x')
>>> 	}.valueAfter(1)
>>> }.then { :x |
>>> 	{ x = 'x' }.assert
>>> }.isPromise
true
```

* * *

See also: allFulfilled, allSettled, anyFulfilled, anySettled, rejectedPromise, resolvedPromise, then, thenElse

Guides: Asynchronous Functions

References:
_Mdn_
[1](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise),
_Tc39_
[1](https://tc39.es/ecma262/multipage/control-abstraction-objects.html#sec-promise-objects)

Categories: Type, Scheduling
