# Terse Guide to Syntax
```
let d = (c: 3, parent: (b: 2, parent: (a: 1))); ['a', 'b', 'c'].collect { :each | d.atDelegateTo(each, 'parent') } = [1, 2, 3]
let d = (c: 3, parent: (b: 2, parent: (a: 1))); ['a', 'b', 'c'].collect { :each | d.messageSend(each, 'parent', []) } = [1, 2, 3]
let d = (x: 1, parent: (y: 2, parent: (z: 3))); d.atPutDelegateTo('z', -3, 'parent'); d.atDelegateTo('z', 'parent') = -3
let d = (c: 3, parent: (b: 2, parent: (a: 1))); [d:.a, d:.b, d:.c] = [1, 2, 3] {- :. is atDelegateTo 'parent' -}
let d = (x: 1, parent: (y: 2, parent: (z: 3))); d:.x := -1; [d:.x, d:.y, d:.z] = [-1, 2, 3] {- :. & := is atPutDelegateTo 'parent' -}
let d = (x: 1, parent: (y: 2, parent: (z: 3))); d:.y := -2; [d:.x, d:.y, d:.z] = [1, -2, 3]
let d = (x: 1, parent: (y: 2, parent: (z: 3))); d:.z := -3; [d:.x, d:.y, d:.z] = [1, 2, -3]
let d = (length: { :self | (self::x.squared + self::y.squared).sqrt }); let p = (x: 3.141, y: 23, parent: d); p:.length = 23.213484895637706
let d = (x: 9, parent: (f: { :self :aNumber | self::x.sqrt * aNumber })); d:.f(7) = 21
```

## Slot Read Syntax
```
('x' -> 1):@key = 'x' {- read slot syntax -}
('x' -> 1):@answer = nil {- unknown slot names answer nil -}
let a = 'x' -> 1; a:@key = 'x' & { a:@value = 1 } {- read slots -}
4:3.numerator = 4:3:@numerator {- slot read syntax -}
```

## Slot Write Syntax
```
let a = ('x' -> 1); a:@key := 'y'; a = ('y' -> 1) {- write slot -}
let a = ('x' -> 1); a:@hidden := 1.pi; a = ('x' -> 1) & { a:@hidden = 1.pi } {- writes to unknown slot add a slot -}
let a = 'x' -> 1; a:@key := 'y'; a:@value := 2; a = ('y' -> 2) {- write slots -}
let n = 4:3; n:@denominator := 5; n = 4:5 {- slot write syntax -}
```

## AtIfAbsent Syntax
```
let i = (1 .. 5); i[9] :? { true } {- [AtIfAbsent Syntax] -}
```

## AtAll Syntax
```
let i = (9 .. 1); i[5, 3, 7] = [5, 7, 3] {- [AtAllArray Syntax] -}
let a = [9 .. 1]; a[5, 3, 7] = [5, 7, 3] {- [AtAllArray Syntax] -}
let a = [5 .. 1]; a[1 5 3] = [5 1 3] {- [AtAllVector Syntax] -}
let a = [5 .. 1]; a[2 .. 4] = [4 3 2] {- [AtAllInterval Syntax] -}
let a = [1, 1, 3, 4]; a[2, 4, 3, 1] = [1, 4, 3, 1] {- [AtAllArray Syntax] -}
let a = [1 1 3 4]; a[2 4 3 1] = [1 4 3 1] {- [AtAllVector Syntax] -}
```

## AtPath Syntax
```
let m = [1 2 3; 4 5 6; 7 8 9]; m[2; 3] = 6 & { m[3; 2] = 8 } {- [AtPath Syntax] -}
let d = (w: (x: (y: (z: 1)))); d['w'; 'x'; 'y'; 'z'] = 1 {- [AtPath Syntax] -}
let a = [['w', 'x'], ['y', 'z']]; a[1; 2] = 'x' {- [AtPath Syntax] -}
(x: (y: 1))['x'; 'y'] = 1 {- [AtPath Syntax] -}
(x: (y: (z: 1)))['x'; 'y'; 'z'] = 1 {- [AtPath Syntax] -}
(w: (x: (y: (z: 1))))['w'; 'x'; 'y'; 'z'] = 1 {- [AtPath Syntax] -}
```

## AtPathPut Syntax
```
let m = [1 2 3; 4 5 6]; m[1; 2] := -2; m[2; 3] := -6; m = [1 -2 3; 4 5 -6] {- [AtPathPut Syntax] -}
let d = (w: (x: (y: (z: 1)))); d['w'; 'x'; 'y'; 'z'] := -1; d = (w: (x: (y: (z: -1)))) {- [AtPathPut Syntax] -}
```

## Quoted AtIfAbsent Syntax
```
let d = (); d::x :? { 1 } = 1 {- [Quoted AtIfAbsent Syntax] -}
```

## Quoted AtIfAbsentPut Syntax
```
let d = (); d::x :?= { 1 } = 1 & { d::x = 1 } {- [Quoted AtIfAbsentPut Syntax] -}
```

## Volume Syntax
```
[1 2; 3 4;; 5 6; 7 8] = [[[1, 2], [3, 4]], [[5, 6], [7, 8]]] {- [Volume Syntax] literal items -}
let a = 1; let b = 3; [a b; b a;; b a; a b] = [[[1, 3], [3, 1]], [[3, 1], [1, 3]]] {- [Volume Syntax] identifier items -}
[1 0 0; 0 1 0; 0 0 1;; 0 1 0; 1 0 1; 0 1 0;; 1 0 1; 0 1 0; 1 0 1].collect(sum:/1) = [1 1 1; 1 2 1; 2 1 2] {- volume to matrix -}
[1 0 0; 0 1 0; 0 0 1;; 0 1 0; 1 0 1; 0 1 0].transposed = [1 0 0; 0 1 0;; 0 1 0; 1 0 1;; 0 0 1; 0 1 0] {- transposed -}
[1 2; 3 4;; 5 6; 7 8] = [[1 2; 3 4] [5 6; 7 8]] {- volume as array of matrices -}
```
