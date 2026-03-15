# queryParameters

- _queryParameters(u)_

Answer a `UrlQueryParameters` value holding the `query` component of the `Url` _u_.

```
>>> let u = 'x://?p=i&q=j'.asUrl;
>>> let p = u.queryParameters;
>>> (p.size, p.associations)
(2, ['p' -> 'i', 'q' -> 'j'])
```

* * *

See also: query, Url, UrlQueryParameters

Guides: Network Functions

Categories: Network, Address
