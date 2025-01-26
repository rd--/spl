# dihedralAngle

- _dihedralAngle([p1, p2], [v, w])_

```
>>> [0 0 0; 0 1 0].dihedralAngle([1 0 1; 1 0 0])
1/4.pi

>>> [0 0 0; 0 1 0].dihedralAngle([1 0 1; -1 0 0])
3/4.pi
```

The answer is unsigned,
swapping _p1_ & _p2_,
swapping _v_ & _w_:

```
>>> let p1 = [0 0 0];
>>> let p2 = [0 0 1];
>>> let v = [1 0 0];
>>> let w = [0 1 0];
>>> (
>>> 	[p1, p2].dihedralAngle([v, w]),
>>> 	[p2, p1].dihedralAngle([v, w]),
>>> 	[p1, p2].dihedralAngle([w, v])
>>> )
1/2.pi # 3
```

* * *

See also: HalfPlane

References:
_Mathematica_
[1](https://mathworld.wolfram.com/DihedralAngle.html)
[2](https://reference.wolfram.com/language/ref/DihedralAngle.html),
_W_
[1](https://en.wikipedia.org/wiki/Dihedral_angle)
