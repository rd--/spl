# truncateTo

- _truncateTo(s, n)_

At `String` an alias for `take`.
Make a copy of the first _n_ places of the string _s_.

```
>>> 'a short string'.truncateTo(7)
'a short'

>>> 'a short string'.take(7)
'a short'
```

If _n_ is less than the `size` of _s_,
euquivalent to `first`:

```
>>> 'a short string'.first(7)
'a short'
```

If there are less places than requested answer the complete string:

```
>>> 'less'.truncateTo(7)
'less'

>>> 'less'.take(7)
'less'
```

* * *

See also: contractTo

Guides: String Functions

Categories: String

