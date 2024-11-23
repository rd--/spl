# image

- _image(aPermutation, anInteger)_

Answer the image of _anInteger_ under _aPermutation_.

The images of elements from each cycle of a permutation, and a fixed point:

```
>>> let p = [1 3 2; 4 5].cycles;
>>> [3 5 7].collect { :each | p.image(each) }
[2 4 7]
```

* * *

See also: cycles, Permutation, permute

Categories: Permutations
