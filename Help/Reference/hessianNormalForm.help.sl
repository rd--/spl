# hessianNormalForm

- _hessianNormalForm(aPlane)_

Answer the Hesse normal form of _aPlane_,
the unit normal vector _n_ and the distance of the plane from the origin _p_.
The Hesse form is primarily used for calculating distances.

Calculate signed point-plane distances using Hesse normal form:

```
>>> let p = InfinitePlane(1, 2, 2, -2);
>>> let [n, d] = p.hessianNormalForm;
>>> n.dot([2 5 4]) + d
6

>>> let p = InfinitePlane(2, 3, -1, -6);
>>> let [n, d] = p.hessianNormalForm;
>>> n.dot([0 0 0]) + d
(-6 / 14.sqrt)

>>> let p = InfinitePlane(1, 1, 0, -2);
>>> let [n, d] = p.hessianNormalForm;
>>> n.dot([-1 1 2]) + d
2.sqrt.negated

>>> let p = InfinitePlane(3, 4, -1, -1);
>>> let [n, d] = p.hessianNormalForm;
>>> n.dot([1 2 3]) + d
(7 / 26.sqrt)

>>> let p = InfinitePlane(5, 3, 1, -8);
>>> let [n, d] = p.hessianNormalForm;
>>> n.dot([1 7 4]) + d
(22 / 35.sqrt)
```

* * *

See also: InfinitePlane, signedPointPlaneDistance

References:
_Mathematica_
[1](https://mathworld.wolfram.com/HessianNormalForm.html),
[2](https://mathworld.wolfram.com/NormalVector.html)

Categories: Geometry
