# isEmpty -- testing

- _isEmpty(aCollection)_

Answers whether _aCollection_ contains any elements.

This is the same as asking if _size(aCollection) > 0_, however _size_ may require traversing the entire collection, while _isEmpty_ need only examine if there is a first element.

- _isEmpty(aStream)_

Answer whether the _aStream_ has no elements.

Answers true if both the set of past and future sequence values are empty.
Otherwise returns false.

* * *

See also: notEmpty, size
