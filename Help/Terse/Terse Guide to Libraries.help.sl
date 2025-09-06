# Terse Guide to Libraries

## Tuple
let t = (1, 2); t[1] := 3; t = (3, 2) /* mutate first */
let t = (1, 2); t[2] := 3; t = (1, 3) /* mutate second */
let t = (1, 2, 3); t[1] := 4; t = (4, 2, 3) /* mutate first */
let t = (1, 2, 3); t[2] := 4; t = (1, 4, 3) /* mutate second */
let t = (1, 2, 3); t[3] := 4; t = (1, 2, 4) /* mutate third */
(1, 2, 3).rotateLeft = (2, 3, 1) /* rotated left */
(1, 2, 3).rotateRight = (3, 1, 2) /* rotated right */
(1, 2, 3).species = Tuple:/1 /* species */
Tuple(0).isEmpty = true /* the empty tuple */
[1 .. 5].asTuple.reverse = (5,4,3,2,1) /* reverse */
let t = (1, 2, 3); t[3] := '3'; t = (1, 2, '3') /* atPut protocol */
let t = (1, 2, 3); let c = t.copy; t[3] := '3'; c[3] = 3 /* copy & mutate */
(1, 4, 9).collect(sqrt:/1) = (1, 2, 3) /* collect */
(1, 4, 9).reduce(+) = 14 /* reduce */

## Cons -- collection type
```
Cons(1, nil).length = 1
Cons(1, nil).isList = true
Cons(1, 2).isList = false
Cons([1 .. 9]).length = 9
[1 .. 9].Cons.reverse.car = 9
[1, [2, 3], [4]].Cons.isList = true
[1, [2, 3], [4]].Cons.length = 3
[[[[1, 2, 3]]]].Cons.length = 1
[[[[1, 2, 3]]]].Cons.depth = 4
[9, 16, 25].Cons.collect(sqrt:/1) = [3, 4, 5].Cons
```

## Implicit Dictionary
```
::x := 4; ::x * ::x = 16
::a := 'x' -> 1; [::a.key, ::a.value] = ['x', 1]
```
## Matrix22 -- geometry type
```
system.includesPackage('Matrix22') /* two by two matrix package */
Matrix22(1, 0, 0, 1).typeOf = 'Matrix22' /* two square matrix type */
Matrix22(1, 0, 0, 1).isMatrix22 /* matrix predicate */
Matrix22(1, 4, -1, 9).determinant = 13 /* determinant */
Matrix22(-1, 3/2, 1,-1).inverse = Matrix22(2, 3, 2, 2) /* inverse, answers new matrix */
let m = Matrix22(-1, 3/2, 1,-1); m.invert; m = Matrix22(2, 3, 2, 2) /* inverse, in place */
Matrix22().rotation(1.pi / 2).applyTo(PlanarCoordinates(0, 1)).isCloseTo(PlanarCoordinates(1, 0))
Matrix22(1, 2, 3, 4).transpose = Matrix22(1, 3, 2, 4) /* transpose, answers new matrix */
let m = Matrix22(1, 2, 3, 4); m.transpose; m = Matrix22(1, 3, 2, 4) /* transpose, in place */
```

## Matrix33 -- geometry type
```
system.includesPackage('Matrix33')
Matrix33(1, 1, 1, 1, 0, 0, 0, 1, 0).inverse = Matrix33(0, 1, 0, 0, 0, 1, 1, -1, -1)
```

## SmallHours
```
system.workspace::smallHours.helpFind('Collection')
```

## Cli
```
system.splFileName('Help/Terse/Terse Guide.help.sl').asFileUrl.terseGuideSummary
system.splFileName('Help/Terse/Terse Guide to Sound.help.sl').asFileUrl.terseGuideSummary
```
