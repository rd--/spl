# fromTrilinearVertexMatrix

- _fromTrilinearVertexMatrix(t, m)_

Given a reference triangle _t_, answer the `Triangle` specified by the trilinear vertex matrix _m_.

The identity matrix:

```
>>> let t = [1 1 1].sssTriangle;
>>> let m = 3.identityMatrix;
>>> t.fromTrilinearVertexMatrix(m)
t
```

* * *

See also: fromTrilinearCoordinates, Triangle

References:
_Mathematica_
[1](https://mathworld.wolfram.com/TrilinearVertexMatrix.html)
