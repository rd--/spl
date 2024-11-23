# UrlQueryParameters

A `Trait` and associated `Type` holding the parsed query parameters of a `Url`.

This object is somewhat like a dictionary, however it allows duplicate keys.

Implements `size`, `associations`, `keys`, `values` and `asString`.

```
>>> let u = 'x://?p=i&q=j'.asUrl;
>>> let q = u.queryParameters;
>>> (q.size, q.associations, q.asString)
(2, ['p' -> 'i', 'q' -> 'j'], 'p=i&q=j')
```

Note that the type has the non-standard name `URLSeachParams`, which is defined by the system.

* * *

See also: associations, asString, asUrlQueryParameters, keys, queryParameters, size, Url, values

Categories: Network, Address
