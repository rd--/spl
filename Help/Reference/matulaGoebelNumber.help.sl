# matulaGoebelNumber

- _matulaGoebelNumber(t)_

Answer the Matula-Göbel number of the tree _t_.
Threads over lists.

The inverse of `matulaGoebelTree`:

```
>>> let n = [1 .. 23];
>>> let t = n.matulaGoebelTree;
>>> let m = t.matulaGobelNumber;
>>> (n = m, m)
(true, [1 .. 23])
```

* * *

See also: matulaGoebelTree, Tree

Guides: Tree Functions
