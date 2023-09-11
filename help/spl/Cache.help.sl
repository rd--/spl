# Cache -- trait

Cache is used to implement initialise on demand global variables.

Implements the method _cached_.

The _System_ type, which is instatiated once as _system_, implements _Cache_.

The _primesArray_ method caches previous requests, and calculates continues any required calculations from the cached answers.

	23.primesArray = system.primesArray.first(23)

* * *

See also: cached
