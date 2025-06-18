# image

- _image(p, n)_

Answer the image of the integer _n_ under the permutation _p_.

The images of elements from each cycle of a permutation, and a fixed point:

```
>>> let p = [1 3 2; 4 5].cycles;
>>> [3 5 7].collect { :each |
>>> 	p.image(each)
>>> }
[2 4 7]
```

* * *

See also: cycles, Permutation, permute

Guides: Permutation Functions

Categories: Permutations
