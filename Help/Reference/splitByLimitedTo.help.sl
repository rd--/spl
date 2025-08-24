# splitByLimitedTo

- _splitByLimitedTo(aString, separator, count)_

Variant of `splitBy` that limits the number of items in the answer to _count_.

```
>>> 'List of three words'
>>> .splitByLimitedTo(' ', 3)
['List' 'of' 'three']
```

If there are fewer items, answer all of them:

```
>>> 'List of three'
>>> .splitByLimitedTo(' ', 4)
['List' 'of' 'three']
```

* * *

See also: splitBy

Guides: String Functions
