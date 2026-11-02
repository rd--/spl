# splitOnLimitedTo

- _splitOnLimitedTo(s, c, n)_

Variant of `splitOn` that limits the number of items in the answer to _n_.

```
>>> 'List of three words'
>>> .splitOnLimitedTo(' ', 3)
['List' 'of' 'three']
```

If there are fewer items, answer all of them:

```
>>> 'List of three'
>>> .splitOnLimitedTo(' ', 4)
['List' 'of' 'three']
```

* * *

See also: splitOn

Guides: String Functions
