# findBinaryDoIfNone

- _findBinaryDoIfNone([x₁ x₂ …], f/1, g/1, h/2)_

Search for an element in the the sequence _x_ using binary search.
The argument _f_ is a one-element block returning

- 0: if the element is the one searched for
- <0: if the search should continue in the first half
- >0: if the search should continue in the second half

If found,
evaluate the action block _g_ with the found element as argument.
If no matching element is found,
evaluate the exception block _h_,
with the 'bounding' elements (or nil) as optional arguments.

```
>>> [1 .. 99].findBinaryDoIfNone { :x |
>>> 	63.compare(x)
>>> } { :x |
>>> 	x
>>> } { :p :q |
>>> 	nil
>>> }
63
```

* * *

See also: findBinary, findBinaryIfNone, findBinaryIndex
