# Cache

Cache is used to implement initialise-on-demand global variables.

The requried method is _cache_, which should answer a _Dictionary_.

Implements the methods _cached_, for where the initializer is synchronous, and _whenCached_ for where is is not.

The _System_ type, which is instantiated once as _system_, implements _Cache_.

The _primesList_ method caches previous requests, and continues any required calculations from the cached answers.

```
>>> 23.primesList
system.primesList.first(23)
```

* * *

See also: cached, System, whenCached

Categories: Trait
