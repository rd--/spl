# asUrlSearchParams

- _asUrlSearchParams(aString | aRecord)_

Answer a `UrlSearchParams` object, which is somewhat like a dictionary, however it allows duplicate keys.

At `String`:


```
>>> 'x=3.141&y=23'.asUrlSearchParams.includes('x')
true
```

At `Record`, values must be of type `String`:

```
>>> (x: '3.141', y: '23').asUrlSearchParams::y
'23'
```

* * *

See also: Url, UrlSearchParams

Categories: Network, Address
