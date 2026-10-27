# queryParameters

- _queryParameters(u)_

Answer a `UrlQueryParameters` value holding the `query` component of the `Url` _u_.

```
>>> let u = Url'x://?p=i&q=j';
>>> let p = u.queryParameters;
>>> (p.size, p.associations)
(2, ['p' -> 'i', 'q' -> 'j'])
```

* * *

See also: Url, UrlQueryParameters, query

Guides: Network Functions

Categories: Network, Address
