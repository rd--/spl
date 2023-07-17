'Graphics/Vector2'
Vector2(0, 0).typeOf = 'Vector2'
Vector2(-1, 1).isVector2 = true
Vector2(3, 4).isVector2 & { true } = true
(-1@1).isVector2.not = false
-1@1 = Vector2(-1, 1)
(-1@1).x = -1
(-1@1).y = 1
(-1@1).x(-3) = -3
(-1@1).y(3) = 3
-1@1 * 9 = (-9@9)
-1@1 + 2 = (1@3)
2 * (-1@1) * 2 = (-4@4)
(-1@1).asString = '-1@1'
var p = -1@1; p.x := -3; p.y := 3; p = (-3@3) = true
var p = -1@3, a = [p]; a.first.x := -3; p = (-3@3) = true
var x = 3.141, y = 23, p = x@y; p.x = x & { p.y = y }
[1@0, 1@1, 0@1, -1@1, -1@0, 0 @ -1].collect(t:/1) = (pi * [0, 1 / 4, 1 / 2, 3 / 4, 1, -1 / 2])
0@0 = Point(0,0)
200 @ 100 = Point(200, 100) (* obtain a new point *)
(200 @ 100).x = 200 (* x coordinate *)
(200 @ 100).y = 100 (* y coordinate *)
0 - (200 @ 100) = (-200 @ -100) (* negates x and y (note @- is an binary selector) *)
(0 - (200 @ 100)).abs = (200 @ 100) (* absolute value of x and y *)
200 @ 100 + 1 = (201 @ 101) (* add scale to both x and y *)
200 @ 100 - 1 = (199 @ 99) (* subtract scale from both x and y *)
200 @ 100 * 2 = (400 @ 200) (* multiply x and y by scale *)
200 @ 100 / 2 = (100 @ 50) (* divide x and y by scale *)
(200 @ 100) // 2 = (100 @ 50) (* divide x and y by scale *)
200 @ 100 % 3 = (2 @ 1) (* modulo of x and y by scale *)
200 @ 100 + (50 @ 25) = (250 @ 125) (* add points *)
200 @ 100 - (50 @ 25) = (150 @ 75) (* subtract points *)
200 @ 100 * (3 @ 4) = (600 @ 400) (* multiply points *)
1800 @ 100 / (3 @ 4) = (600 @ 25) (* divide points *)
(200 @ 100).Array = [200, 100] (* array of x and y *)

'Graphics/Rectangle'
Rectangle(0@0, 1@1).printString = 'Rectangle(0@0, 1@1)'
Rectangle(0@0, 2@2).intersect(Rectangle(1@1, 4@4)) = Rectangle(1@1, 2@2)
Rectangle(1@1, 3@3).area = 4
Rectangle(1@1, 3@3).center = Vector2(2, 2)
Rectangle(1@1, 3@3).containsPoint(2@2) = true

'Graphics/Matrix22'
Matrix22(1, 4, -1, 9).determinant = 13
Matrix22(-1, 3/2, 1,-1).inverse = Matrix22(2, 3, 2, 2)
Matrix22().rotation(pi / 2).applyTo(Vector2(0, 1)).closeTo(1@0)

'Graphics/Matrix33'
Matrix33(1, 1, 1, 1, 0, 0, 0, 1, 0).inverse = Matrix33(0, 1, 0, 0, 0, 1, 1, -1, -1)

'Graphics/Vector3'
[1, 2, 3].Vector3 = Vector3(1, 2, 3)
Vector3(0, 0, 0).isZero (* are x, y and z all zero *)

'Point'
0.asPoint.isPoint (* number to point, point predicate *)
Point(0, 0).isZero (* are x and y both zero *)
