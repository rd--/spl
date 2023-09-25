# once -- evaluating

- _once(aBlock:/0)_

Evaluate _aBlock_, on the first occasion store the result in a system wide cache keyed by _aBlock_ and on subsequent evaluations answer that value.

The cache is a _WeakMap_ so once _aBlock_ is reclaimed the cached answer will be reclaimed.

- _once(aBlock, where, key)_ ⟹ cached(where, key, aBlock)

An idiom re-ordering the arguments to _cached_.

* * *

See also: Cache, cached, System, WeakMap
