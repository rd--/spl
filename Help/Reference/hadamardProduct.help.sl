# hadamardProduct

- _hadamardProduct(aMatrix, anotherMatrix)_

The Hadamard product,
also known as the element-wise product, entrywise product or Schur product,
is a binary operation mutiplies two matrices of the same dimensions elementwise.

For regular matrices of equal `shape`,
`hadamardProduct` is equivalent to `*`:

```
>>> [2 3 1; 0 8 -2].hadamardProduct(
>>> 	[3 1 4; 7 9 5]
>>> )
[6 3 4; 0 72 -10]

>>> [2 3 1; 0 8 -2] * [3 1 4; 7 9 5]
[6 3 4; 0 72 -10]
```

However `*` does not require matrices to be regular or commesurate,
where `hadamardProduct` does:

```
>>> let a = [1; 2 3];
>>> let b = [4 5; 6];
>>> let c = a * b;
>>> let d = {
>>> 	a.hadamardProduct(b)
>>> }.ifError { true } ;
>>> (c, d)
([4 5; 12 18], true)

>>> let a = [1 2; 3 4];
>>> let b = [1 2 3; 4 5 6];
>>> let c = a * b;
>>> let d = {
>>> 	a.hadamardProduct(b)
>>> }.ifError { true } ;
>>> (c, d)
([1 4 3; 12 20 18], true)
```

* * *

See also: *, dot

References:
_W_
[1](https://en.wikipedia.org/wiki/Hadamard_product_(matrices))
