# Terse Guide to Syntax

## AssignmentOperator Syntax
```
let x = 3; x +:= 4; x = 7 {- plus assignment (increment) -}
let x = 3; x -:= 4; x = -1 {- minus assignment (decrement) -}
let x = 3; x *:= 4; x = 12 {- times assignment -}
let x = 3; x /:= 4; x = 0.75 {- dividedBy assignment -}
let x = 3; x ^:= 4; x = 81 {- raisedTo assignment -}
let x = nil; x ?:= { 4 }; x = 4 {- query assignment -}
let x = 3; x ?:= { 4 }; x = 3 {- query assignment -}
let x = [3]; x[1] +:= 4; x[1] = 7 {- at syntax assignment -}
let x = (y: 3); x::y +:= 4; x::y = 7 {- quoted at syntax assignment -}
let p = 3@3; p.x +:= 4; p.x = 7 {- dot expression syntax assignment -}
let c = 0; let k = 3; let n = 4; k.tuplesIndicesDo(n) { :each | c +:= 1 }; c = (k ^ n)
let c = 0; 4.tuplesIndicesDo(7) { :each | c +:= 1 }; c = 16384
```

## AtDelegateTo Syntax
```
let d = (c: 3, parent: (b: 2, parent: (a: 1))); [d:.a, d:.b, d:.c] = [1, 2, 3] {- [AtDelegateTo Syntax] -}
let d = (length: { :self | (self::x.squared + self::y.squared).sqrt }); let p = (x: 3.141, y: 23, parent: d); p:.length = 23.213484895637706
let d = (x: 9, parent: (f: { :self :aNumber | self::x.sqrt * aNumber })); d:.f(7) = 21
```

## AtPutDelegateTo
```
let d = (x: 1, parent: (y: 2, parent: (z: 3))); d:.x := -1; [d:.x, d:.y, d:.z] = [-1, 2, 3] {- [AtPutDelegateTo Syntax] -}
let d = (x: 1, parent: (y: 2, parent: (z: 3))); d:.y := -2; [d:.x, d:.y, d:.z] = [1, -2, 3]
let d = (x: 1, parent: (y: 2, parent: (z: 3))); d:.z := -3; [d:.x, d:.y, d:.z] = [1, 2, -3]
```

## AtIfAbsent Syntax
```
let i = 1:5; i[9] :? { true } {- [AtIfAbsent Syntax] -}
```

## Quoted AtIfAbsent Syntax
```
let d = (); d::x :? { 1 } = 1 {- [Quoted AtIfAbsent Syntax] -}
```

## Quoted AtIfAbsentPut Syntax
```
let d = (); d::x :?= { 1 } = 1 & { d::x = 1 } {- [Quoted AtIfAbsentPut Syntax] -}
```

## Slot Read Syntax
```
('x' -> 1):@key = 'x' {- read slot syntax -}
('x' -> 1):@answer = nil {- unknown slot names answer nil -}
let a = 'x' -> 1; a:@key = 'x' & { a:@value = 1 } {- read slots -}
4/3.numerator = 4/3:@numerator {- slot read syntax -}
```

## Slot Write Syntax
```
let a = ('x' -> 1); a:@key := 'y'; a = ('y' -> 1) {- write slot -}
let a = ('x' -> 1); a:@hidden := 1.pi; a = ('x' -> 1) & { a:@hidden = 1.pi } {- writes to unknown slot add a slot -}
let a = 'x' -> 1; a:@key := 'y'; a:@value := 2; a = ('y' -> 2) {- write slots -}
let n = 4/3; n:@denominator := 5; n = 4/5 {- slot write syntax -}
```

## Volume Syntax
```
[1 2; 3 4;; 5 6; 7 8] = [[[1, 2], [3, 4]], [[5, 6], [7, 8]]] {- [Volume Syntax] literal items -}
let a = 1; let b = 3; [a b; b a;; b a; a b] = [[[1, 3], [3, 1]], [[3, 1], [1, 3]]] {- [Volume Syntax] identifier items -}
[1 0 0; 0 1 0; 0 0 1;; 0 1 0; 1 0 1; 0 1 0;; 1 0 1; 0 1 0; 1 0 1].collect(sum:/1) = [1 1 1; 1 2 1; 2 1 2] {- volume to matrix -}
[1 0 0; 0 1 0; 0 0 1;; 0 1 0; 1 0 1; 0 1 0].transposed = [1 0 0; 0 1 0;; 0 1 0; 1 0 1;; 0 0 1; 0 1 0] {- transposed -}
[1 2; 3 4;; 5 6; 7 8] = [[1 2; 3 4] [5 6; 7 8]] {- volume as array of matrices -}
```
