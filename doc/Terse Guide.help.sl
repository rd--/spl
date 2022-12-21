'kernel/Array'
[].typeOf = 'Array'
[].species = Array:/1
Array().isArray = true
Array() = []
Array(3).size = 3
[1, 2, 3] = [1, 2, 3] = true
[1, 2, 3] = [1, 2, 4] = false
[1, 2] = [1, 2, 3, 4] = false
[1, 2, 3, 4, 5, 6] = 7 = false
[1, 2, 3] == [1, 2, 3] = false
var a = [1, 2, 3]; a == a = true
[1, 2, 3].isArray = true
4 * [1, 2, 3] = [4, 8, 12]
 [1, 3, 5, 7].reversed = [7, 5, 3, 1]
var a = [1, 3, 5, 7]; a.reverseInPlace; a = [7, 5, 3, 1]
[1, 2, 3, 5, 7, 9].sum = 27
[1, 2, 3, 5, 7, 9].reduce(plus:/2) = 27
[1, 2, 3, 5, 7, 9].injectInto(0, plus:/2) = 27
[1, 2, 3, 5, 7, 9].product = 1890
[1, 2, 3, 5, 7, 9].reduce(times:/2) = 1890
[1, 2, 3, 5, 7, 9].injectInto(1, times:/2) = 1890
[1, 2, 3, 5, 7, 9].collect(sqrt:/1).sum.rounded = 12
[9, 16, 25].collect(sqrt:/1) = [3, 4, 5]
[9, 16, 25].collect { :each | sqrt(each) } = [3, 4, 5]
[].allSatisfy(odd:/1) = true
[1, 3, 5, 7, 9].allSatisfy(odd:/1) = true
[1, 2].allSatisfy(odd:/1) = false
[].anySatisfy(odd:/1) = false
[0, 2, 4, 6, 8].anySatisfy(odd:/1) = false
[0, 1].anySatisfy(odd:/1) = true
[1, 2, 3] ++ [4, 5, 6] = [1, 2, 3, 4, 5, 6]
[[1, 2, 3], [4, 5, 6], [7, 8, 9]].concatenation = [1, 2, 3, 4, 5, 6, 7, 8, 9]
[[1, 2, 3], [4, 5], [6]].concatenation = [1, 2, 3, 4, 5, 6]
var a = [1, 2, 3]; a[2] = a.at(2)
var a = [1, 2, 3]; a.atPut(2, 'two'); a = [1, "two", 3]
var a = [1, 2, 3]; a[2] := 'two'; a = [1, "two", 3]
var a = [5, 4, 3, 2, 1]; a.detect { :each | each % 2 = 0 } = 4
var a = [5, 4, 3, 2, 1]; a.find { :each | each % 7 = 0 } = nil
var a = [5, 4, 3, 2, 1]; a.findIndex { :each | each % 3 = 0 } = 3
[[1, 2, 3, 4], [5, 6, 7, 8]].transpose = [[1, 5], [2, 6], [3, 7], [4, 8]]
1.toAsCollect(9, Array:/1) { :each | each * each } = [1, 4, 9, 16, 25, 36, 49, 64, 81]
[1 .. 9].copy == [1 .. 9] = false
[1 .. 9].shuffled ~= [1 .. 9]
[1 .. 9].shuffled ~= [1 .. 9]
[1 .. 9].shuffled.sorted = [1 .. 9]
13.fibonacciArray = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233]
3.replicate('3') = ['3', '3', '3']
[1, 2, 3, 4, 3, 2, 1].detectMax(identity:/1) = 4
[9 .. 1].indexOf(3) = 7
[9 .. 1].includes(3) = true
Array(5).fillFromWith([1 .. 5], negated:/1) = [-1 .. -5]
var a = Array(5); a.fillFromWith([1, 3, 5, 7, 9], squared:/1); a = [1, 9, 25, 49, 81]
var a = Array(4); [1, 3, 5, 7].collectInto({ :each | each * each}, a); a = [1, 9, 25, 49]
Array:/1.series(5, 1, 2) = [1, 3, 5, 7, 9]
Array:/1.geom(7, 1, 3) = [1, 3, 9, 27, 81, 243, 729]
[1, 2, 3, 4, 3, 2, 1].occurrencesOf(3) = 2
var a = [1, 2], [x, y] = a; [y, x] = [2, 1]
var i = (1 .. 9); var [x, y, z] = i; [z, y, x] = [3 .. 1]
var [x, y] = { var n = randomFloat(); [n, n] }.value; x = y
[1, 3 .. 9] = [1, 3, 5, 7, 9]
[9, 7 .. 1] = [9, 7, 5, 3, 1]
[1, 2, 3].printString = '[1, 2, 3]'
[1 .. 9].allButFirst = [2 .. 9]
[1 .. 9].allButFirst(7) = [8, 9]
{ var a = Array(1); a.at(3) }.ifError { :error | true }
var a = Array(1); a.unsafeAt(3).isNil = true
{ var a = Array(1); a.atPut(3, 'x') }.ifError { :error | true }
var a = Array(1); a.unsafeAtPut(3, 'x') = 'x' & { a.size = 3 }
Array:/1.newFrom(Interval(1, 5, 2)) = [1, 3, 5]
[1 .. 9].count(even:/1) = 4

'kernel/Boolean'
true.typeOf = 'Boolean'
{ Boolean() }.ifError { :error | true } = true
true.isBoolean
false.isBoolean
true = true
false = false
true ~= false
false ~= true
true == true
false == false
true & { 'true &'.postLine; false } = false
false & { 'false &'.postLine; false } = false
true | { 'true |'.postLine; true } = true
false | { 'false |'.postLine; true } = true
true.printString = 'true'

'kernel/Number'
{ Number() }.ifError { :error | true } = true
0 = -0 = true
1 = 1 = true
1 >= 1 = true
1 <= 1 = true
0 > 1 = false
1 > 0 = true
0 < 1 = true
1 < 0 = false
0 <= 1 = true
1 <= 0 = false
0 >= 1 = false
1 >= 0 = true
5.isByte = true
-1.isByte = false
'x'.isByte = false
3.isInteger
-1.isInteger = true
'x'.isInteger = false
3 + 4 = 7
3 * 4 = 12
3 * 4 + 9 = 21
7.quotient(2) = 3
var total = 0; 9.timesRepeat { total := total + randomFloat() }; total < 7
3.max(7) = 7
7.min(3) = 3
12345.truncateTo(600) = 12000
16 << 3 = 128
16 >> 3 = 2
2971215073.isPrime = true
2971215073.nextPrime = 2971215083 & { 2971215083.isPrime }
13.betweenAnd(11, 14) = true
9.atRandom.isInteger = true
9.randomInteger.isInteger = true
9.randomFloat.isInteger = false
pi.randomFloat.isInteger = false

'kernel/Procedure'
{ Procedure() }.ifError { :error | true } = true
var i = 1; whileTrue { i < 5 } { i := i + 1 }; i = 5
var i = 1; 1.toDo(3) { :each | i := i + each.squared } ; i = 15
var i = 1; 3.do { :each | i := i + each.squared } ; i = 15
var f = { 0 }; f.numArgs = 0
var f = { :i | i }; f.numArgs = 1
var f = { :i :j | [i, j] }; f.numArgs = 2
var f = { :i | i = nil }; { f() }.ifError { :error | true }
var f = { :i | i * 2 }; { f(3, 4) = 6 } .ifError { :error | true }
collect:/2.name = 'collect:/2'
var f = { :x | x * x }; [f(5), f.(5)] = [25, 25]
var f = { :x | x * x }; var d = (p: f); d::p.value(5) = 25
var f = { 0 }; cull(f, 23) = 0
var f = { 0 }; cullCull(f, 23, 3.141) = 0
var f = { :x | x }; cull(f, 23) = 23
var f = { :x | x }; cullCull(f, 23, 3.141) = 23
var f = { :x :y | x * y }; cullCull(f, 23, 3.141) = 72.243
var f = { :x | x * x }; f(3) = 9
var f = { :x | x * x }; [3, 5, 7].collect(f) = [9, 25, 49]
var f = { :x | x * x }; [3, 5, 7].collect(f:/1) = [9, 25, 49]

'kernel/StringDictionary'
StringDictionary().isStringDictionary
StringDictionary().includesKey('x') = false
StringDictionary().at('x') = nil
var d = StringDictionary(); d.atPut('x', 1); d.at('x') = 1
var d = StringDictionary(); d['x'] := 1; d['x'] = 1
var d = StringDictionary(); d['x'] := 1; d['y'] := 2; d.size = 2
var d = StringDictionary(); d::x := 1; d::y := 2; d.size = 2
['x' -> 1, 'y' -> 2].StringDictionary['y'] = 2
{ StringDictionary().atPut(1, 1) }.ifError { :error | true }

'kernel/String'
''.typeOf = 'String'
String() = ''
'x'.asString = 'x'
'x'.asString.size = 1
'x'.printString.size = 3
1.asString = '1'
'ascii'.ascii = [97, 115, 99, 105, 105].ByteArray
'€'.utf8 = [226, 130, 172].ByteArray
[226, 130, 172].ByteArray.utf8 = '€'
'€'.utf8.utf8 = '€'
'ascii'.ascii = 'ascii'.utf8
'ascii'.ascii.ascii = 'ascii'
{ '€'.ascii }.ifError { :error | true }
'the quick brown fox jumps'.includesSubstring('fox') = true
'the quick brown fox jumps'.includesSubstring('fix') = false
'the quick brown fox jumps'.findString('fox') = 17
'the quick brown fox jumps'.findStringStartingAt('fox', 1) = 17
'the quick brown fox jumps'.copyFromTo(17, 19) = 'fox'
['the', 'quick', 'brown', 'fox'].joinSeparatedBy(' ') = 'the quick brown fox'
['the', 'quick', 'brown', 'fox'].join = 'thequickbrownfox'
'the quick brown fox jumps'.splitBy(' ') = ['the', 'quick', 'brown', 'fox', 'jumps']
'ascii'.toUpperCase = 'ASCII'
'ASCII'.toLowerCase = 'ascii'
`x` = 'x'
`"x"` = '"x"'
`x` = 'x'.parseBacktickQuotedString
"x" = 'x'
"x" = 'x'.parseDoubleQuotedString
'string'[3] = 'r'
{ 'string'[3] := 'r' }.ifError { :error | true }

'kernel/UndefinedObject'
nil.typeOf = 'UndefinedObject'
nil.isNil
nil = nil
nil == nil
nil.ifNil { true } = true
0.ifNil { false } = nil
ifNil(nil) { true } = true
ifNil(0) { false } = nil
nil ? 1 = 1
1 ? 2 = 1
nil ~? 1 = nil
1 ~? 2 = 2
nil.printString = 'nil'

'stdlib/Association'
('x' -> 1).typeOf = 'Association'
Association('x', 1) = ('x' -> 1)
var a = 'x' -> 1; [a.key, a.value] = ['x', 1]
('x' -> 1).asArray = ['x', 1]
['x' -> 1, 'y' -> 2].collect(asArray:/1) = [['x', 1], ['y', 2]]
(23 -> 3.141).printString = 'Association(23, 3.141)'

'stdlib/ByteArray'
ByteArray().typeOf = 'ByteArray'
ByteArray().species = ByteArray:/1
ByteArray().isByteArray
ByteArray().size = 0
ByteArray(8).size = 8
ByteArray(8).at(1) = 0
ByteArray(8).atPut(1, 179) = 179
var a = ByteArray(8); a.atPut(1, 179); a.at(1) = 179
[1 .. 9].ByteArray.isByteArray = true
[1 .. 9].ByteArray.reversed = [9 .. 1].ByteArray
[1 .. 3].ByteArray.printString = 'ByteArray([1, 2, 3])'

'stdlib/Cons'
Cons(1, nil).length = 1
Cons(1, nil).isList = true
Cons(1, 2).isList = false
Cons([1 .. 9]).length = 9
[1 .. 9].Cons.reversed.car = 9
[1, [2, 3], [4]].Cons.isList = true
[1, [2, 3], [4]].Cons.length = 3
[[[[1, 2, 3]]]].Cons.length = 1
[[[[1, 2, 3]]]].Cons.depth = 4
[9, 16, 25].Cons.collect(sqrt:/1) = [3, 4, 5].Cons

'stdlib/Duration'
2.seconds.typeOf = 'Duration'
5.hours.isDuration = true
0.25.asDuration = 250.milliseconds
3.hours.seconds = 10800
1.5.seconds.milliseconds = 1500
systemTime().isDuration = true
0.5.seconds + 750.milliseconds = 1.25.seconds
2.weeks - 12.days = 48.hours
0.25 + 500.milliseconds = 750.milliseconds
500.milliseconds + 0.25 = 0.75.seconds

'stdlib/Error'
Error().isError = true
Error('message').isError = true
Error('message').name = 'Error'
Error('message').message = 'message'

'stdlib/Float64Array'
Float64Array().typeOf = 'Float64Array'
Float64Array().species = Float64Array:/1
Float64Array().isFloat64Array
Float64Array().size = 0
Float64Array(8).size = 8
Float64Array(8).at(1) = 0
Float64Array(8).atPut(1, pi) = pi
var a = Float64Array(8); a.atPut(1, pi); a.at(1) = pi
[1 .. 9].Float64Array.isFloat64Array = true
[1 .. 9].Float64Array.reversed = [9 .. 1].Float64Array
var a = [1 .. 9].Float64Array; a.reverseInPlace; a = [9 .. 1].Float64Array
var a = [9 .. 1].Float64Array; a.sortInPlace; a = [1 .. 9].Float64Array
{ Float64Array(1).atPut(3, 'x') }.ifError { :error | true }
var a = Float64Array(1); a.unsafeAtPut(1, 'x'); a.at(1).isNaN = true
var a = Float64Array(1); a.unsafeAtPut(3, 'x'); a.unsafeAt(3) = nil
[1 .. 3].Float64Array.printString = 'Float64Array([1, 2, 3])'

'stdlib/IdentityDictionary'
().species = IdentityDictionary:/0
var d = IdentityDictionary(); d.add('x' -> 1); d.add('y' -> 2); d.size = 2
var d = ['x' -> 1, 'y' -> 2].IdentityDictionary; d.keys = ['x', 'y']
var d = ['x' -> 1, 'y' -> 2].IdentityDictionary; d.values = [1, 2]
var d = ['x' -> 1, 'y' -> 2].IdentityDictionary; d.at('x') = 1
var d = (x: 1, y: 2), i = 9; d.associationsDo { :each | i := i - each.value } ; i = 6
var d = (x: 1, y: 2); d.collect { :each | each * 9 } = (x: 9, y: 18)
var d = IdentityDictionary(); d.add('x' -> 1); d.removeKey('x'); d.isEmpty = true
(x: 23, y: 3.141).isIdentityDictionary
(x: pi)::x = pi
(x : pi) :: x = pi
var d = (x: 23, y: 3.141); d::x = 23
var d = (x: 23, y: 3.141); d::x := 42; d = (x: 42, y: 3.141)
var d = (x: 23, y: 3.141); d.copy ~~ d
(x:1, y:2) ++ (z:3) = (x:1, y:2, z:3)
(x: 1, y: 2).asArray = ['x' -> 1, 'y' -> 2]
var d = (x:1, y:2, z:3), (x, z) = d; [x, z] = [1, 3]
var (x, y) = { var n = randomFloat(); (x: n, y: n) }.value; x = y
(x:1, y:2, z:3).select(even:/1) = (y: 2)
(x:1, y:2, z:3).sum = 6
var d = (x: 9); d::x.sqrt = 3
::x := 4; ::x * ::x = 16
::p := Point(-1, 1); ::p.x + ::p.y = 0
var d = (f: { :i | i * i }); d::f.value(9) = 81
{ IdentityDictionary().removeKey('unknownKey') }.ifError { :error | true }
size (x: 1, y: 2, z: 3) = 3
var d = (x: 1); d.addAll (y: 2, z: 3); d = (x: 1, y: 2, z: 3)

'stdlib/IdentitySet'
[1, 3, 5, 3, 1].IdentitySet.isIdentitySet = true
[1, 3, 5, 3, 1].IdentitySet.size = 3
[1, 3, 5, 3, 1].IdentitySet.includes(3) = true
[1, 3, 5, 3, 1].IdentitySet.includes(7) = false
[1, 3, 5, 3, 1].IdentitySet.asArray = [1, 3, 5]
var s = [1, 3, 5, 3, 1].IdentitySet; s.remove(3); s.asArray = [1, 5]
[1 .. 9].IdentitySet.atRandom.betweenAnd(1, 9)

'stdlib/Interval'
(1 .. 9).species = Array:/1
1.to(9).isInterval = true
to(1, 9).size = 9
(1 .. 9) = 1.to(9)
Interval(-2, 2, 1).collect(even:/1) = [true, false, true, false, true]
(-2 .. 2).collect(odd:/1) = [false, true, false, true, false]
1 + 1.to(9).collect(squared:/1) = [2, 5, 10, 17, 26,37, 50, 65, 82]
2 * (1 .. 9).collect(squared:/1) = [2, 8, 18, 32, 50,72, 98, 128, 162]
1.to(9).asArray = [1, 2, 3, 4, 5, 6, 7, 8, 9]
(1 .. 9).asArray.copyFromTo(3, 7) = [3, 4, 5, 6, 7]
var i = 1; 1.to(9).do { :each | i := i + each }; i = 46
Interval(-1, 1, 1).printString = 'Interval(-1, 1, 1)'
Interval(1, 9, 1) = (1 .. 9)
Interval(1, 10, 3).size = 4
Interval(1, 10, 3).asArray = [1, 4, 7, 10]
1.to(6).reversed = (6 .. 1)
1.to(6).first = 1
(1 .. 6).second = 2
to(1, 6).last = 6
(1 .. 6).sum = 21
Interval(-1, 1, 1).asArray = [-1, 0, 1]
1.to(99).asString = 'Interval(1, 99, 1)'
to(1, -1).asString = 'Interval(1, -1, -1)'
1.to(99).sum = 4950
1.to(99).asArray.sum = 4950
(1 .. 9).size = 9
(1 .. 9).sum = 45
(1 .. 9999).sum = 49995000
(1 .. 9999).asArray.sum = 49995000
to(1, 9) = Interval(1, 9, 1)
to(9, 1) = Interval(9, 1, -1)
1.thenTo(3, 9) = Interval(1, 9, 2)
[1 .. 9] = (1 .. 9).asArray
[9 .. 1] = (9 .. 1).asArray
[3 - 2 .. 7 + 2] = (3 - 2 .. 7 + 2).asArray
var l = OrderedCollection(); Interval(9, 1, -1).do { :each | l.add(each) }; l.asArray = [9 .. 1]
collect(1.to(9)) { :each | each * each } = [1, 4, 9, 16, 25, 36, 49, 64, 81]
1.to(9).collect { :each | each * each } = [1, 4, 9, 16, 25, 36, 49, 64, 81]
Interval(1, 6, 2).asArray = [1, 3, 5]
Interval(1, 6, 2).last = 5
(1 .. 9).reversed.asArray = [9, 8, 7, 6, 5, 4, 3, 2, 1]
Interval(1, 6, 2).reversed.asArray = [5, 3, 1]
1.to(9).step = 1
(1, 3 .. 9) = Interval(1, 9, 2)
(9, 7 .. 1) = Interval(9, 1, -2)
(3 .. 7).anyOne = 3
(1 .. 9).max = 9

'stdlib/LargeInteger'
(2 ** 54).asLargeInteger.squared.printString = '324518553658426726783156020576256'
'324518553658426726783156020576256'.asLargeInteger.isLargeInteger = true
2971215073.asLargeInteger.isPrime = true

'stdlib/LinkedList'
LinkedList().typeOf = 'Array'
LinkedList().isLinkedList = true
LinkedList(3).size = 0
LinkedList:/1.ofSize(3).size = 3
LinkedList([1, 2, 3]).size = 3
var l = LinkedList(); l.addFirst(1); l.addFirst(2); l.asArray = [2, 1]
var l = LinkedList(); l.addLast(1); l.addLast(2); l.asArray = [1, 2]
var l = LinkedList(); 5.do { :each | l.add(each) }; l.asArray = [1 .. 5]
LinkedList([1 .. 9]).collect { :each | 10 - each } = LinkedList([9 .. 1])
var l = LinkedList([1 .. 9]); l.removeFirst; l.first = 2
var l = LinkedList([1 .. 9]); l.removeLast; l.last = 8
var l = LinkedList([1]); l.removeFirst = 1 & { l.isEmpty }
var l = LinkedList([1]); l.removeLast = 1 & { l.isEmpty }
var l = LinkedList([1 .. 9]); l.removeAllSuchThat(odd:/1); l.asArray = [2, 4, 6, 8]
LinkedList((1 .. 99)).select(even:/1).asArray = [2, 4 .. 98]
LinkedList((1 .. 9)).selectThenCollect(even:/1, squared:/1).asArray = [4, 16, 36, 64]
LinkedList((1 .. 9)).collectThenSelect(squared:/1, { :each | each > 36 }).asArray = [49, 64, 81]
LinkedList([1 .. 9]).reversed = [9 .. 1]
{ LinkedList().removeFirst }.ifError { :error | true }
{ LinkedList().removeLast }.ifError { :error | true }

'stdlib/OrderedCollection'
OrderedCollection().species = OrderedCollection:/1
OrderedCollection().isOrderedCollection = true
OrderedCollection(3).size = 0
OrderedCollection:/1.ofSize(3) = [nil, nil, nil].OrderedCollection
OrderedCollection([1, 2, 3]).size = 3
var l = OrderedCollection(); l.addFirst(1); l.addFirst(2); l.asArray = [2, 1]
var l = OrderedCollection(); l.addLast(1); l.addLast(2); l.asArray = [1, 2]
var l = OrderedCollection(); 5.do { :each | l.add(each) }; l.asArray = [1 .. 5]
OrderedCollection([1 .. 9]).collect { :each | 10 - each } = OrderedCollection([9 .. 1])
var l = OrderedCollection([1 .. 9]); l.removeLast = 9 & { l.size = 8 }
var l = OrderedCollection([1, 2, 3]); l.addAllLast(4.to(5)); l.asArray = [1 .. 5]
var l = OrderedCollection([4, 5]); l.addAllFirst(1.to(3)); l.asArray = [1 .. 5]
13.fibonacciSequence = OrderedCollection([1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233])
[1, 2, 3].OrderedCollection ++ [4, 5, 6] = [ 1, 2, 3, 4, 5, 6 ].OrderedCollection
[1 .. 5].OrderedCollection.reversed = [5 .. 1].OrderedCollection
OrderedCollection:/1.series(9, 1, 1) = [1 .. 9].OrderedCollection
OrderedCollection:/1.geom(7, 1, 3) = [1, 3, 9, 27, 81, 243, 729].OrderedCollection

'stdlib/Pair'
Pair('x', 'y').typeOf = 'Pair'
Pair('x', 'y').isPair = true
Pair('x', 'y').first = 'x'
Pair('x', 'y')[1] = 'x'
var p = Pair('x', 'y'); p[1] := 'z'; p.first = 'z'
var p = Pair('x', 'y'); p.swapInPlace; p[1] = 'y'
Pair('x', 'y').swapped = Pair('y', 'x')

'stdlib/Point'
Point(0, 0).typeOf = 'Point'
Point(-1, 1).isPoint = true
Point(3, 4).isPoint & { true } = true
(-1@1).isPoint.not = false
-1@1 = Point(-1, 1)
(-1@1).x = -1
(-1@1).y = 1
(-1@1).x(-3) = -3
(-1@1).y(3) = 3
-1@1 * 9 = Point(-9, 9)
-1@1 + 2 = Point(1, 3)
2 * (-1@1) * 2 = Point(-4, 4)
(-1@1).asString = 'Point(-1, 1)'
var p = -1@1; p.x := -3; p.y := 3; p = (-3@3) = true
var p = -1@3, a = [p]; a.first.x := -3; p = (-3@3) = true

'stdlib/PriorityQueue'
PriorityQueue().isPriorityQueue = true
PriorityQueue().isEmpty = true
var p = PriorityQueue(); p.push('a', 1); p.pop = 'a'
var p = PriorityQueue(); p.push('a', 1); p.push('b', 0); p.pop = 'b'
var p = PriorityQueue(); p.pushAll(['a' -> 3, 'b' -> 2, 'c' -> 1]); p.size = 3 & { p.pop = 'c' }
var p = PriorityQueue(); p.peekPriority = nil

'stdlib/Promise'
{ Promise() }.ifError { :error | true }
var p = Promise { :t:/1 :f | t('t') }; p.then { :t | (t = 't').postLine }; p.isPromise
var p = Promise { :t :f:/1 | f('f') }; p.thenElse { :t | t.postLine } { :f | (f = 'f').postLine }; p.isPromise
var p = Promise { :t :f:/1 | f('f') }; p.then({ :t | t.postLine }).catch({ :f | (f = 'f').postLine }); p.isPromise
var p = Promise { :t :f:/1 | f('f') }; p.thenElse({ :t | t.postLine }, { :f | (f = 'f').postLine }).finally({ 'true'.postLine }); p.isPromise

'stdlib/ReadStream'
var r = [1 .. 5].ReadStream; [r.next, r.next(3), r.next, r.next] = [1, [2, 3, 4], 5, nil]
var r = [1 .. 3].ReadStream; [r.next, r.upToEnd] = [1, [2, 3]]
ReadStream().atEnd = true
var r = (1 .. 5).ReadStream; r.size = 5
var r = (1 .. 5).ReadStream; [r.peek, r.next] = [1, 1]
var r = (1 .. 5).ReadStream; r.skip(3); r.upToEnd = [4, 5]
var r = (9 .. 1).ReadStream; r.upTo(0) = [9 .. 1]
var r = (9 .. 1).ReadStream; [r.upTo(3), r.upToEnd] = [[9 .. 4], [2 .. 1]]
var r = (9 .. 1).ReadStream; [r.upToPosition(3), r.upToEnd] = [[9 .. 7], [6 .. 1]]

'stdlib/RegExp'
RegExp('ab+c').isRegExp = true
var r = RegExp('ab*c'); [r.test('ac'), r.test('abc')] = [true, true]
var r = RegExp('ab*c', 'g'); 'ab abc ac'.allRegExpMatches(r) = ['abc', 'ac']

'stdlib/WriteStream'
var a = Array(9); var w = WriteStream(a); w.nextPut(1); w.contents = [1]
var a = Array(9); var w = WriteStream(a); w.nextPut(1); w.nextPutAll([2 .. 8]); w.nextPut(9); w.contents = [1 .. 9]
var a = Array(9); var w = WriteStream(a); w.nextPut(1); w.nextPutAll((2 .. 8)); w.nextPut(9); w.contents = [1 .. 9]
var a = Array(); var w = WriteStream(a); w.nextPut(1); w.contents = [1]
var w = Utf8WriteStream(); 'bodlɛʁ'.encodeOn(w); w.contents.utf8 = 'bodlɛʁ'

'stdlib/system'
systemTimeInMilliseconds() > 0 = true
systemTime().seconds > systemTime().hours = true
systemTime().weeks < 1 = true
unixTime().weeks > 2750 = true
{ unixTime().postLine }.evaluateAfter(0.5.seconds).cancel = nil
{ unixTime().postLine }.evaluateAt(unixTime() + 0.5.seconds).cancel = nil
{ unixTime().seconds.rounded.postLine }.evaluateEvery(3.seconds).cancel = nil
var f = { :t0 | | t1 = 2.randomFloat.seconds; | t0.postLine; f.evaluateAfter(t1, t1) }; f(2.seconds).cancel = nil
'Collection'.traitTypes.includes('Array') = true
'Array'.typeTraits.includes('ArrayedCollection') = true
'add'.methodSignatures.includes("IdentityDictionary>>add:/2") = true
methodSource('sum', 1, 'Array') = '{ :self |\n\t\tself.reduce(plus:/2)\n\t}'
'collect'.methodTypes.includes('Array') = true
'Association'.typeMethods.includes('key') = true
multipleArityMethodList().includes('Array') = true
onlyZeroArityMethodList().includes('systemTime') = true
doesTypeImplementMethod('Array', 'select') = true
[1, 2, 3].respondsTo(select:/2)
'atRandom'.methodTraits.includesAllOf([ "Collection", "SequenceableCollection" ])
