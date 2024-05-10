# hessianNormalForm

- _hessianNormalForm(aPlane)_

Answer the Hesse normal form of _aPlane_,
the unit normal vector _n_ and the distance of the plane from the origin _p_.
The Hesse form is primarily used for calculating distances.

Calculate signed point-plane distances using Hesse normal form:

```
>>> let [n, p] = Plane(1, 2, 2, -2).hessianNormalForm;
>>> n.dot([2 5 4]) + p
6

>>> let [n, p] = Plane(2, 3, -1, -6).hessianNormalForm;
>>> n.dot([0 0 0]) + p
(-6 / 14.sqrt)

>>> let [n, p] = Plane(1, 1, 0, -2).hessianNormalForm;
>>> n.dot([-1 1 2]) + p
2.sqrt.negated

>>> let [n, p] = Plane(3, 4, -1, -1).hessianNormalForm;
>>> n.dot([1 2 3]) + p
(7 / 26.sqrt)

>>> let [n, p] = Plane(5, 3, 1, -8).hessianNormalForm;
>>> n.dot([1 7 4]) + p
(22 / 35.sqrt)
```

* * *

See also: Plane, signedPointPlaneDistance

References:
_Mathematica_
[1](https://mathworld.wolfram.com/HessianNormalForm.html),
[2](https://mathworld.wolfram.com/NormalVector.html)
