# CrystalLatticeStructure

A `CrystalLatticeStructure` is a `Type`.

The structure consists of the fields `name`, `description`, `vertexCount`, `vertexLabels`, `vertexCoordinates` and `edges`.

`vertices` are the integers from one up to the `vertexCount`
`atoms` and `bonds`.

`atoms` answers a `List` of _(symbol, (x, y, z))_ pairs.

`bonds` is a synonym for `edges` and is a list of _(i, j)_ pairs,
where _i_ and _j_ are indices into the `List` of atoms.

* * *

See also: asCrystalLatticeStructure, CrystalLatticeStructureBrowser, leitnerCatalogue

Categories: Chemistry
