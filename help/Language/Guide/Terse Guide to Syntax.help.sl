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
