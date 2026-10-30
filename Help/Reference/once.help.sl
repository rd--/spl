# once

- _once(f/0)_
- _once(f/0, where, key)_

Evaluate the block _f_,
on the first occasion store the result in a system wide cache keyed by _f_,
and on subsequent evaluations answer that value.

The cache is a `WeakMap` so once _f_ is reclaimed the cached answer will be reclaimed.

The ternary form is an idiom re-ordering the arguments to `cached`.

* * *

See also: Cache, System, WeakMap, cached

Guides: Block Functions, Control Functions
