# UrlSearchParams

The query string of a Url (Uniform resource locator).

This object is somewhat like a dictionary, however it allows duplicate keys.

```
>>> 'x=3.141&y=23'.UrlSearchParams.includes('x') = true
true

>>> 'x=3.141&y=23'.UrlSearchParams::y = '23'
true
```

* * *

See also: Url
