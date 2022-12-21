# injectInto - enumerating

- _injectInto(aCollection, thisValue, binaryBlock)_

Accumulate a running value associated with evaluating the argument, _binaryBlock_, with the current value of the argument, _thisValue_, and the receiver as block arguments.

For instance, to sum the numeric elements of a collection:

```
[1 .. 9].injectInto(0, plus:/2) = 45
```
