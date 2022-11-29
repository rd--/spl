'kernel/Array'
[].class = Array
[].species = Array
Array.name = 'Array'
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
[1, 2, 3, 5, 7, 9].reduce(plus) = 27
[1, 2, 3, 5, 7, 9].injectInto(0, plus) = 27
[1, 2, 3, 5, 7, 9].product = 1890
[1, 2, 3, 5, 7, 9].reduce(times) = 1890
[1, 2, 3, 5, 7, 9].injectInto(1, times) = 1890
[1, 2, 3, 5, 7, 9].collect(sqrt).sum.rounded = 12
[].allSatisfy(odd) = true
[1, 3, 5, 7, 9].allSatisfy(odd) = true
[1, 2].allSatisfy(odd) = false
[].anySatisfy(odd) = false
[0, 2, 4, 6, 8].anySatisfy(odd) = false
[0, 1].anySatisfy(odd) = true
[1, 2, 3] ++ [4, 5, 6] = [1, 2, 3, 4, 5, 6]
[[1, 2, 3], [4, 5, 6], [7, 8, 9]].concatenation = [1, 2, 3, 4, 5, 6, 7, 8, 9]
[[1, 2, 3], [4, 5], [6]].concatenation = [1, 2, 3, 4, 5, 6]
var a = [1, 2, 3]; a[2] = a.at(2)
var a = [1, 2, 3]; a.put(2, 'two'); a = [1, "two", 3]
var a = [1, 2, 3]; a[2] := 'two'; a = [1, "two", 3]
var a = [5, 4, 3, 2, 1]; a.detect { :each | each % 2 = 0 } = 4
var a = [5, 4, 3, 2, 1]; a.find { :each | each % 7 = 0 } = nil
var a = [5, 4, 3, 2, 1]; a.findIndex { :each | each % 3 = 0 } = 3
[[1, 2, 3, 4], [5, 6, 7, 8]].transpose = [[1, 5], [2, 6], [3, 7], [4, 8]]
1.toAsCollect(9, Array) { :each | each * each } = [1, 4, 9, 16, 25, 36, 49, 64, 81]
[1 .. 9].copy == [1 .. 9] = false
[1 .. 9].shuffled ~= [1 .. 9]
[1 .. 9].shuffled ~= [1 .. 9]
[1 .. 9].shuffled.sorted = [1 .. 9]
13.fibonacciArray = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233]
3.replicate('3') = ['3', '3', '3']
'3'.dup(3) = ['3', '3', '3']
'3' ! 3 = ['3', '3', '3']
({ random() } ! 3).allSatisfy(isNumber) = true
[1, 2, 3, 4, 3, 2, 1].detectMax(identity) = 4
[9 .. 1].indexOf(3) = 7
[9 .. 1].includes(3) = true
Array(5).fillFromWith([1 .. 5], negated) = [-1 .. -5]
var a = Array(5); a.fillFromWith([1, 3, 5, 7, 9], squared); a = [1, 9, 25, 49, 81]
var a = Array(4); [1, 3, 5, 7].collectInto({ :each | each * each}, a); a = [1, 9, 25, 49]
Array.series(5, 1, 2) = [1, 3, 5, 7, 9]
Array.geom(7, 1, 3) = [1, 3, 9, 27, 81, 243, 729]
[1, 2, 3, 4, 3, 2, 1].occurrencesOf(3) = 2
var a = [1, 2], [x, y] = a; [y, x] = [2, 1]
var i = (1 .. 9); var [x, y, z] = i; [z, y, x] = [3 .. 1]
var [x, y] = { var n = random(); [n, n] }.value; x = y
[1, 3 .. 9] = [1, 3, 5, 7, 9]
[9, 7 .. 1] = [9, 7, 5, 3, 1]
[1, 2, 3].printString = '[1, 2, 3]'
[1 .. 9].allButFirst = [2 .. 9]
[1 .. 9].allButFirst(7) = [8, 9]
{ var a = Array(1); a.at(3) }.ifError { :error | true }
var a = Array(1); a.unsafeAt(3).isNil = true
{ var a = Array(1); a.put(3, 'x') }.ifError { :error | true }
var a = Array(1); a.unsafePut(3, 'x') = 'x' & { a.size = 3 }

'kernel/Boolean'
true.class = Boolean
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

'kernel/Nil'
nil.class = Nil
Nil() = nil
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
var total = 0; 9.timesRepeat { total := total + random() }; total < 7
3.max(7) = 7
7.min(3) = 3
12345.truncateTo(600) = 12000
16 << 3 = 128
16 >> 3 = 2
2971215073.isPrime = true
2971215073.nextPrime = 2971215083 & { 2971215083.isPrime }
13.betweenAnd(11, 14) = true

'kernel/Procedure'
{ Procedure() }.ifError { :error | true } = true
var m = { random() }.dup(9).mean; m > 0 & { m < 1 }
({ random() } ! 9).size = 9
var i = 1; while { i < 5 } { i := i + 1 }; i = 5
var i = 1; 1.toDo(3) { :each | i := i + each.squared } ; i = 15
var i = 1; 3.do { :each | i := i + each.squared } ; i = 15
var f = { 0 }; f.numArgs = 0
var f = { :i | i }; f.numArgs = 1
var f = { :i :j | [i, j] }; f.numArgs = 2
var f = { :i | i = nil }; { f() }.ifError { :error | true }
var f = { :i | i * 2 }; { f(3, 4) = 6 } .ifError { :error | true }
collect.name = 'collect'
var f = { :x | x * x }; [f(5), f.(5)] = [25, 25]
var f = { :x | x * x }; var d = (p: f); [d::p(5), d::p.(5)] = [25, 25]

'kernel/StringDictionary'
StringDictionary().isStringDictionary
StringDictionary().includesKey('x') = false
StringDictionary().at('x') = nil
var d = StringDictionary(); d.put('x', 1); d.at('x') = 1
var d = StringDictionary(); d['x'] := 1; d['x'] = 1
var d = StringDictionary(); d['x'] := 1; d['y'] := 2; d.size = 2
var d = StringDictionary(); d::x := 1; d::y := 2; d.size = 2
['x' -> 1, 'y' -> 2].asStringDictionary['y'] = 2
{ StringDictionary().put(1, 1) }.ifError { :error | true }

'kernel/String'
''.class = String
String() = ''
'x'.asString = 'x'
'x'.asString.size = 1
'x'.printString.size = 3
1.asString = '1'
'ascii'.ascii = [97, 115, 99, 105, 105].asByteArray
'€'.utf8 = [226, 130, 172].asByteArray
[226, 130, 172].asByteArray.utf8 = '€'
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

'stdlib/Association'
('x' -> 1).class = Association
Association('x', 1) = ('x' -> 1)
var a = 'x' -> 1; [a.key, a.value] = ['x', 1]
('x' -> 1).asArray = ['x', 1]
['x' -> 1, 'y' -> 2].collect(asArray) = [['x', 1], ['y', 2]]
(23 -> 3.141).printString = 'Association(23, 3.141)'

'stdlib/ByteArray'
ByteArray().class = ByteArray
ByteArray().species = ByteArray
ByteArray().isByteArray
ByteArray().size = 0
ByteArray(8).size = 8
ByteArray(8).at(1) = 0
ByteArray(8).put(1, 179) = 179
var a = ByteArray(8); a.put(1, 179); a.at(1) = 179
[1 .. 9].asByteArray.isByteArray = true
[1 .. 9].asByteArray.reversed = [9 .. 1].asByteArray
[1 .. 3].asByteArray.printString = '[1, 2, 3].asByteArray'

'stdlib/Duration'
2.seconds.class = Duration
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
Float64Array().class = Float64Array
Float64Array().species = Float64Array
Float64Array().isFloat64Array
Float64Array().size = 0
Float64Array(8).size = 8
Float64Array(8).at(1) = 0
Float64Array(8).put(1, pi) = pi
var a = Float64Array(8); a.put(1, pi); a.at(1) = pi
[1 .. 9].asFloat64Array.isFloat64Array = true
[1 .. 9].asFloat64Array.reversed = [9 .. 1].asFloat64Array
var a = [1 .. 9].asFloat64Array; a.reverseInPlace; a = [9 .. 1].asFloat64Array
var a = [9 .. 1].asFloat64Array; a.sortInPlace; a = [1 .. 9].asFloat64Array
{ Float64Array(1).put(3, 'x') }.ifError { :error | true }
var a = Float64Array(1); a.unsafePut(1, 'x'); a.at(1).isNaN = true
var a = Float64Array(1); a.unsafePut(3, 'x'); a.unsafeAt(3) = nil
[1 .. 3].asFloat64Array.printString = '[1, 2, 3].asFloat64Array'

'stdlib/IdentityDictionary'
().species = IdentityDictionary
var d = IdentityDictionary(); d.add('x' -> 1); d.add('y' -> 2); d.size = 2
var d = ['x' -> 1, 'y' -> 2].asIdentityDictionary; d.keys = ['x', 'y']
var d = ['x' -> 1, 'y' -> 2].asIdentityDictionary; d.values = [1, 2]
var d = ['x' -> 1, 'y' -> 2].asIdentityDictionary; d.at('x') = 1
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
var (x, y) = { var n = random(); (x: n, y: n) }.value; x = y
(x:1, y:2, z:3).select(even) = (y: 2)
(x:1, y:2, z:3).sum = 6
var d = (x: 9); d::x.sqrt = 3
::x := 4; ::x * ::x = 16
::p := Point(-1, 1); ::p.x + ::p.y = 0
var d = (f: { :i | i * i }); d::f(9) = 81
{ IdentityDictionary().removeKey('unknownKey') }.ifError { :error | true }
size (x: 1, y: 2, z: 3) = 3
var d = (x: 1); d.addAll (y: 2, z: 3); d = (x: 1, y: 2, z: 3)

'stdlib/IdentitySet'
[1, 3, 5, 3, 1].asIdentitySet.isIdentitySet = true
[1, 3, 5, 3, 1].asIdentitySet.size = 3
[1, 3, 5, 3, 1].asIdentitySet.includes(3) = true
[1, 3, 5, 3, 1].asIdentitySet.includes(7) = false
[1, 3, 5, 3, 1].asIdentitySet.asArray = [1, 3, 5]
var s = [1, 3, 5, 3, 1].asIdentitySet; s.remove(3); s.asArray = [1, 5]

'stdlib/Interval'
(1 .. 9).species = Array
1.to(9).isInterval = true
to(1, 9).size = 9
(1 .. 9) = 1.to(9)
Interval(-2, 2, 1).collect(even) = [true, false, true, false, true]
(-2 .. 2).collect(odd) = [false, true, false, true, false]
1 + 1.to(9).collect(squared) = [2, 5, 10, 17, 26,37, 50, 65, 82]
2 * (1 .. 9).collect(squared) = [2, 8, 18, 32, 50,72, 98, 128, 162]
1.to(9).asArray = [1, 2, 3, 4, 5, 6, 7, 8, 9]
(1 .. 9).asArray.copyFromTo(3, 7) = [3, 4, 5, 6, 7]
var i = 1; 1.to(9).do { :each | i := i + each }; i = 46
Interval(-1, 1, 1).asString = 'Interval(-1, 1, 1)'
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
var l = List(); Interval(9, 1, -1).do { :each | l.add(each) }; l.asArray = [9 .. 1]
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
LinkedList().species = Array
LinkedList().isLinkedList = true
LinkedList(3).size = 0
LinkedList.ofSize(3).size = 3
LinkedList([1, 2, 3]).size = 3
var l = LinkedList(); l.addFirst(1); l.addFirst(2); l.asArray = [2, 1]
var l = LinkedList(); l.addLast(1); l.addLast(2); l.asArray = [1, 2]
var l = LinkedList(); 5.do { :each | l.add(each) }; l.asArray = [1 .. 5]
LinkedList([1 .. 9]).collect { :each | 10 - each } = LinkedList([9 .. 1])
var l = LinkedList([1 .. 9]); l.removeFirst; l.first = 2
var l = LinkedList([1 .. 9]); l.removeLast; l.last = 8
var l = LinkedList([1]); l.removeFirst = 1 & { l.isEmpty }
var l = LinkedList([1]); l.removeLast = 1 & { l.isEmpty }
var l = LinkedList([1 .. 9]); l.removeAllSuchThat(odd); l.asArray = [2, 4, 6, 8]
LinkedList((1 .. 99)).select(even).asArray = [2, 4 .. 98]
LinkedList((1 .. 9)).selectThenCollect(even, squared).asArray = [4, 16, 36, 64]
LinkedList((1 .. 9)).collectThenSelect(squared, { :each | each > 36 }).asArray = [49, 64, 81]
LinkedList([1 .. 9]).reversed = [9 .. 1]
{ LinkedList().removeFirst }.ifError { :error | true }
{ LinkedList().removeLast }.ifError { :error | true }

'stdlib/List'
List().species = List
List().isList = true
List(3).size = 0
List.ofSize(3) = [nil, nil, nil].asList
List([1, 2, 3]).size = 3
var l = List(); l.addFirst(1); l.addFirst(2); l.asArray = [2, 1]
var l = List(); l.addLast(1); l.addLast(2); l.asArray = [1, 2]
var l = List(); 5.do { :each | l.add(each) }; l.asArray = [1 .. 5]
List([1 .. 9]).collect { :each | 10 - each } = List([9 .. 1])
var l = List([1 .. 9]); l.removeLast = 9 & { l.size = 8 }
var l = List([1, 2, 3]); l.addAllLast(4.to(5)); l.asArray = [1 .. 5]
var l = List([4, 5]); l.addAllFirst(1.to(3)); l.asArray = [1 .. 5]
13.fibonacciList = List([1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233])
[1, 2, 3].asList ++ [4, 5, 6] = [ 1, 2, 3, 4, 5, 6 ].asList
[1 .. 5].asList.reversed = [5 .. 1].asList
List.series(9, 1, 1) = [1 .. 9].asList
List.geom(7, 1, 3) = [1, 3, 9, 27, 81, 243, 729].asList

'stdlib/Point'
Point(0, 0).class = Point
Point(-1, 1).isPoint
Point(-1, 1).x = -1
Point(-1, 1).y = 1
Point(-1, 1).x(-3) = -3
Point(-1, 1).y(3) = 3
Point(-1, 1) * 9 = Point(-9, 9)
Point(-1, 1) + 2 = Point(1, 3)
2 * Point(-1, 1) * 2 = Point(-4, 4)
Point(-1, 1).asString = 'Point(-1, 1)'
Point(3, 4).isPoint = true
Point(3, 4).isPoint.not = false
Point(3, 4).isPoint & { true } = true
var p = Point(-1, 1); p.x := -3; p.y := 3; p = Point(-3, 3) = true
var p = Point(-1, 3), a = [p]; a.first.x := -3; p = Point(-3, 3) = true

'stdlib/PriorityQueue'
PriorityQueue().isPriorityQueue = true
PriorityQueue().isEmpty = true
var p = PriorityQueue(); p.push('a', 1); p.pop = 'a'
var p = PriorityQueue(); p.push('a', 1); p.push('b', 0); p.pop = 'b'
var p = PriorityQueue(); p.pushAll(['a' -> 3, 'b' -> 2, 'c' -> 1]); p.size = 3 & { p.pop = 'c' }
var p = PriorityQueue(); p.peekPriority = nil

'stdlib/Promise'
{ Promise() }.ifError { :error | true }
var p = Promise { :t :f | t('t') }; p.then { :t | (t = 't').postLine }; p.isPromise
var p = Promise { :t :f | f('f') }; p.thenElse { :t | t.postLine } { :f | (f = 'f').postLine }; p.isPromise
var p = Promise { :t :f | f('f') }; p.then({ :t | t.postLine }).catch({ :f | (f = 'f').postLine }); p.isPromise
var p = Promise { :t :f | f('f') }; p.thenElse({ :t | t.postLine }, { :f | (f = 'f').postLine }).finally({ 'true'.postLine }); p.isPromise

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
var f = { :t0 | | t1 = 2.random.seconds; | t0.postLine; f.evaluateAfter(t1, t1) }; f(2.seconds).cancel = nil
'Collection'.traitTypes.includes('Array') = true
'Array'.typeTraits.includes('ArrayedCollection') = true
'add'.methodSignatures.includes("IdentityDictionary>>add/2") = true
'sum'.methodSource(1, 'Array') = '{ :self | self.reduce(plus) }'
'collect'.methodTypes.includes('Array') = true
'Association'.typeMethods.includes('key') = true
multipleArityMethodList().includes('Array') = true
onlyZeroArityMethodList().includes('Nil') = true
'Array'.respondsTo('select') = true
