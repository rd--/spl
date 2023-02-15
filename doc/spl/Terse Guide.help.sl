'Kernel/Boolean'
true.typeOf = 'Boolean'
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
true && true = true
false || true = true
[true.json, false.json] = ['true', 'false']
['true', 'false'].collect(parseJson:/1) = [true, false]

'Kernel/Object'
[1, 3, 5].typeOf = 'Array'
[1, 3, 5].species = Array:/1
[1, 3, 5].IdentitySet.species = IdentitySet:/0
[1, 3, 5].OrderedCollection.species = OrderedCollection:/1
(x: 1, y: 3, z: 5).species = IdentityDictionary:/0
'b'.caseOf(['a' -> 1, 'b' -> 2, 'c' -> 3]) = 2
{ 'd'.caseOf(['a' -> 1, 'b' -> 2, 'c' -> 3]) }.ifError { :err | true }

'Kernel/Procedure'
var i = 1; whileTrue { i < 5 } { i := i + 1 }; i = 5
var i = 1; { i < 5 }.whileTrue { i := i + 1 }; i = 5
var i = 1; 1.toDo(3) { :each | i := i + each.squared } ; i = 15
var i = 1; 3.do { :each | i := i + each.squared } ; i = 15
{ }.numArgs = 0
{ :x | x }.numArgs = 1
{ :i :j | i }.numArgs = 2
collect:/2.numArgs = 2
{ { :i | i = nil }.value }.ifError { :err | true }
{ { :x | 0 - x }.value(3, 4) = -3 }.ifError { :err | true }
collect:/2.name = 'collect:/2'
var f = { :x | x * x }; [f(5), f.(5)] = [25, 25]
var f = { :x | x * x }; var d = (p: f); d::p.value(5) = 25
{ 0 }.cull(23) = 0
{ 0 }.cull(23, 3.141) = 0
{ :x | x }.cull(23) = 23
{ :x | x }.cull(23, 3.141) = 23
{ :x :y | x * y }.cull(23, 3.141) = 72.243
var f = { :x | x * x }; f(3) = 9
{ var f = { :x | x * x }; [3, 5, 7].collect(f) = [9, 25, 49] }.ifError { :err | true }
var f = { :x | x * x }; [3, 5, 7].collect(f:/1) = [9, 25, 49]
typeOf:/1.typeOf = 'Procedure'
{ :x :y | x * y + y }.apply([3.141, 23]) = 95.243
{ { :x | x }.apply(0) }.ifError { :err | true }
{ { :x | x }.apply([]) }.ifError { :err | true }

'Kernel/Promise'
{ Promise() }.ifError { :err | true }
var p = Promise { :t:/1 :f | t('t') }; p.then { :t | (t = 't').postLine }; p.isPromise
var p = Promise { :t :f:/1 | f('f') }; p.thenElse { :t | t.postLine } { :f | (f = 'f').postLine }; p.isPromise
var p = Promise { :t :f:/1 | f('f') }; p.then({ :t | t.postLine }).catch({ :f | (f = 'f').postLine }); p.isPromise
var p = Promise { :t :f:/1 | f('f') }; p.thenElse({ :t | t.postLine }, { :f | (f = 'f').postLine }).finally({ 'true'.postLine }); p.isPromise

'Kernel/UndefinedObject'
nil.typeOf = 'UndefinedObject'
nil.isNil = true
nil.isUndefinedObject = true
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
nil.json = 'null'
'null'.parseJson = nil

'Collections/Array'
[].typeOf = 'Array'
[].species = Array:/1
[].isArray = true
Array(0) = []
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
var a = [1, 2, 3]; a.atPut(2, 'two'); a = [1, 'two', 3]
var a = [1, 2, 3]; a[2] := 'two'; a = [1, 'two', 3]
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
[].includes(3) = false
[9 .. 1].includesAllOf([3 .. 7]) = true
[5 .. 3].includesAllOf([3 .. 7]) = false
[].includesAllOf([3 .. 7]) = false
Array(5).fillFromWith([1 .. 5], negated:/1) = [-1 .. -5]
var a = Array(5); a.fillFromWith([1, 3, 5, 7, 9], squared:/1); a = [1, 9, 25, 49, 81]
var a = Array(4); [1, 3, 5, 7].collectInto({ :each | each * each}, a); a = [1, 9, 25, 49]
[1, 2, 3, 4, 3, 2, 1].occurrencesOf(3) = 2
var a = [1, 2], [x, y] = a; [y, x] = [2, 1]
var i = (1 .. 9); var [x, y, z] = i; [z, y, x] = [3 .. 1]
var [x, y] = { var n = system.randomFloat; [n, n] }.value; x = y
[1, 3 .. 9] = [1, 3, 5, 7, 9]
[9, 7 .. 1] = [9, 7, 5, 3, 1]
[1, 2, 3].printString = '[1, 2, 3]'
[1 .. 9].allButFirst = [2 .. 9]
[1 .. 9].allButFirst(7) = [8, 9]
{ var a = Array(1); a.at(3) }.ifError { :err | true }
var a = Array(1); a.unsafeAt(3).isNil = true
{ var a = Array(1); a.atPut(3, 'x') }.ifError { :err | true }
var a = Array(1); a.unsafeAtPut(3, 'x') = 'x' & { a.size = 3 }
Array:/1.newFrom(Interval(1, 5, 2)) = [1, 3, 5]
[1 .. 9].count(even:/1) = 4
[nil, true, false, 3.141, 23, 'str'].json = '[null,true,false,3.141,23,"str"]'
 '[null,true,false,3.141,23,"str"]'.parseJson = [nil, true, false, 3.141, 23, 'str']
[1, 2, 3].select { :x | x > 1 } = [2, 3]
[1, 2, 3].reject { :x | x > 1 } = [1]
(1 .. 9).collect{ :x | x * x }.last = 81
(1 .. 9).collect{ :x | x * x }.collect{ :x | x * x }.last = 6561

'Collections/Association'
('x' -> 1).typeOf = 'Association'
Association('x', 1) = ('x' -> 1)
var a = 'x' -> 1; [a.key, a.value] = ['x', 1]
('x' -> 1).asArray = ['x', 1]
['x' -> 1, 'y' -> 2].collect(asArray:/1) = [['x', 1], ['y', 2]]
(23 -> 3.141).printString = 'Association(23, 3.141)'

'Collections/ByteArray'
ByteArray(0).typeOf = 'ByteArray'
ByteArray(0).species = ByteArray:/1
ByteArray(0).isByteArray
ByteArray(0).size = 0
ByteArray(8).size = 8
ByteArray(8).at(1) = 0
ByteArray(8).atPut(1, 179) = 179
var a = ByteArray(8); a.atPut(1, 179); a.at(1) = 179
[1 .. 9].ByteArray.isByteArray = true
[1 .. 9].ByteArray.reversed = [9 .. 1].ByteArray
[1 .. 3].ByteArray.printString = 'ByteArray([1, 2, 3])'

'Collections/Collection'
[1, 3, 5].select { :x | x > 1 } = [3, 5]
[1, 3, 5].IdentitySet.select { :x | x > 1 } = [3, 5].IdentitySet
[1, 3, 5].OrderedCollection.select { :x | x > 1 } = [3, 5].OrderedCollection
(x: 1, y: 3, z: 5).select { :x | x > 1 } = (y: 3, z: 5)
[].select { :each | 'select'.error } = []
[].species.newFrom(OrderedCollection()) = []
OrderedCollection().Array = []

'Collections/Float64Array'
Float64Array(0).typeOf = 'Float64Array'
Float64Array(0).species = Float64Array:/1
Float64Array(0).isFloat64Array
Float64Array(0).size = 0
Float64Array(8).size = 8
Float64Array(8).at(1) = 0
Float64Array(8).atPut(1, pi) = pi
var a = Float64Array(8); a.atPut(1, pi); a.at(1) = pi
[1 .. 9].Float64Array.isFloat64Array = true
[1 .. 9].Float64Array.reversed = [9 .. 1].Float64Array
var a = [1 .. 9].Float64Array; a.reverseInPlace; a = [9 .. 1].Float64Array
var a = [9 .. 1].Float64Array; a.sortInPlace; a = [1 .. 9].Float64Array
{ Float64Array(1).atPut(3, 'x') }.ifError { :err | true }
var a = Float64Array(1); a.unsafeAtPut(1, 'x'); a.at(1).isNaN = true
var a = Float64Array(1); a.unsafeAtPut(3, 'x'); a.unsafeAt(3) = nil
[1 .. 3].Float64Array.printString = 'Float64Array([1, 2, 3])'

'Collections/IdentityDictionary'
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
var (x, y) = { var n = system.randomFloat; (x: n, y: n) }.value; x = y
(x:1, y:2, z:3).select(even:/1) = (y: 2)
(x:1, y:2, z:3).sum = 6
var d = (x: 9); d::x.sqrt = 3
::x := 4; ::x * ::x = 16
::a := 'x' -> 1; [::a.key, ::a.value] = ['x', 1]
var d = (f: { :i | i * i }); d::f.value(9) = 81
{ IdentityDictionary().removeKey('unknownKey') }.ifError { :err | true }
size (x: 1, y: 2, z: 3) = 3
var d = (x: 1); d.addAll (y: 2, z: 3); d = (x: 1, y: 2, z: 3)
(x: 'x', y: '.', z: 'z').associationsSelect { :each | each.key = each.value } = (x: 'x', z: 'z')
var d = (c: 3, parent: (b: 2, parent: (a: 1))); ['a', 'b', 'c'].collect { :each | d.atDelegateTo(each, 'parent') } = [1, 2, 3]
var d = (c: 3, parent: (b: 2, parent: (a: 1))); ['a', 'b', 'c'].collect { :each | d.messageSend(each, 'parent', []) } = [1, 2, 3]
var d = (x: 1, parent: (y: 2, parent: (z: 3))); d.atPutDelegateTo('z', -3, 'parent'); d.atDelegateTo('z', 'parent') = -3
var d = (c: 3, parent: (b: 2, parent: (a: 1))); [d:.a, d:.b, d:.c] = [1, 2, 3]
var d = (x: 1, parent: (y: 2, parent: (z: 3))); d:.z := -3; [d:.x, d:.y, d:.z] = [1, 2, -3]
var d = (length: { :self | (self::x.squared  + self::y.squared).sqrt }); var p = (x: 3.141, y: 23, parent: d); p:.length = 23.213484895637706
var d = (x: 9, parent: (f: { :self :aNumber | self::x.sqrt * aNumber })); d:.f(7) = 21
(x: 1) = ('x': 1)
('font-size': '11pt', 'font-style': 'italic').keys = ['font-size', 'font-style']

'Collections/IdentitySet'
[1, 3, 5, 3, 1].IdentitySet.isIdentitySet = true
[1, 3, 5, 3, 1].IdentitySet.size = 3
[1, 3, 5, 3, 1].IdentitySet.includes(3) = true
[1, 3, 5, 3, 1].IdentitySet.includes(7) = false
[1, 3, 5, 3, 1].IdentitySet.asArray = [1, 3, 5]
var s = [1, 3, 5, 3, 1].IdentitySet; s.remove(3); s.asArray = [1, 5]
[1 .. 9].IdentitySet.atRandom.betweenAnd(1, 9)

'Collections/Interval'
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
(1 .. 9) = (1 .. 9)
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

'Collections/OrderedCollection'
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

'Collections/PriorityQueue'
PriorityQueue().isPriorityQueue = true
PriorityQueue().isEmpty = true
var p = PriorityQueue(); p.push('a', 1); p.pop = 'a'
var p = PriorityQueue(); p.push('a', 1); p.push('b', 0); p.pop = 'b'
var p = PriorityQueue(); p.pushAll(['a' -> 3, 'b' -> 2, 'c' -> 1]); p.size = 3 & { p.pop = 'c' }
var p = PriorityQueue(); p.peekPriority = nil

'Collections/StringDictionary'
StringDictionary().isStringDictionary
StringDictionary().includesKey('x') = false
StringDictionary().at('x') = nil
var d = StringDictionary(); d.atPut('x', 1); d.at('x') = 1
var d = StringDictionary(); d['x'] := 1; d['x'] = 1
var d = StringDictionary(); d['x'] := 1; d['y'] := 2; d.size = 2
var d = StringDictionary(); d::x := 1; d::y := 2; d.size = 2
['x' -> 1, 'y' -> 2].StringDictionary['y'] = 2
{ StringDictionary().atPut(1, 1) }.ifError { :err | true }
(x: 3.141, y: 23).StringDictionary.json = '{"x":3.141,"y":23}'
'{"x":3.141,"y":23}'.parseJson.IdentityDictionary = (x: 3.141, y: 23)

'Text/RegExp'
RegExp('ab+c').isRegExp = true
var r = RegExp('ab*c'); [r.test('ac'), r.test('abc')] = [true, true]
var r = RegExp('ab*c', 'g'); 'ab abc ac'.allRegExpMatches(r) = ['abc', 'ac']
RegExp('x.x', 'g').stringLiteral = '/x.x/g'
RegExp('x.x', 'g').printString.size = 18

'Text/String'
''.typeOf = 'String'
''.size = 0
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
{ '€'.ascii }.ifError { :err | true }
'the quick brown fox jumps'.includesSubstring('fox') = true
'the quick brown fox jumps'.includesSubstring('fix') = false
'the quick brown fox jumps'.findString('fox') = 17
'the quick brown fox jumps'.findString('rat') = 0
'the quick brown fox jumps'.findStringStartingAt('fox', 1) = 17
'the quick brown fox jumps'.copyFromTo(17, 19) = 'fox'
['the', 'quick', 'brown', 'fox'].joinSeparatedBy(' ') = 'the quick brown fox'
['the', 'quick', 'brown', 'fox'].join = 'thequickbrownfox'
'the quick brown fox jumps'.splitBy(' ') = ['the', 'quick', 'brown', 'fox', 'jumps']
'once at end'.occurrencesOf('d') = 1
'abracadabra'.occurrencesOf('a') = 5
'once at end'.indicesOf('d') = [11]
'abracadabra'.indicesOf('a') = [1, 4, 6, 8, 11]
'turramurra'.occurrencesOf('urra') = 2
'turramurra'.indicesOf('urra') = [2, 7]
'sum:/1'.splitBy(':/') = ['sum', '1']
'ascii'.toUpperCase = 'ASCII'
'ASCII'.toLowerCase = 'ascii'
`x` = 'x'
`"x"` = '"x"'
`x` = 'x'.parseBacktickQuotedString
"x" = 'x'
"x" = 'x'.parseDoubleQuotedString
'string'[3] = 'r'
{ 'string'[3] := 'r' }.ifError { :err | true }
'{"x": 3.141, "y": 23}'.parseJson = (x: 3.141, y: 23)
{ '_'.parseJson }.ifError { :err | true }
'a text string'.json = '"a text string"'
 '"a text string"'.parseJson = 'a text string'
'string'.last = 'g'
var x = ['a', 'bc', 'def']; x.unlines.lines = x
'3 + 4'.eval = 7
'a short string'.replace('short', 'longer') = 'a longer string'
'x x x'.replace('x', 'y') = 'y x x'
'x x x'.replaceAll('x', 'y') = 'y y y'
'x y z'.replaceRegExp(RegExp('x|z', 'g'), '-') = '- y -'


'Exceptions/Error'
Error().isError = true
Error('message').isError = true
Error('message').name = 'Error'
Error('message').message = 'message'
Error('message').log = nil
{ Error('message').signal }.ifError { :err | true }
{ error('message') }.ifError { :err | true }

'Numbers/Binary'
16 << 3 = 128
16 >> 3 = 2
23 << 7 = 2944
7 << 23 = 58720256

'Numbers/Number'
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
var total = 0; 9.timesRepeat { total := total + system.randomFloat }; total < 7
3.max(7) = 7
7.min(3) = 3
12345.truncateTo(600) = 12000
2971215073.isPrime = true
2971215073.nextPrime = 2971215083 & { 2971215083.isPrime }
13.betweenAnd(11, 14) = true
9.atRandom.isInteger = true
9.randomInteger.isInteger = true
9.randomFloat.isInteger = false
pi.randomFloat.isInteger = false
[3.141.json, 23.json] = ['3.141', '23']
['3.141', '23'].collect(parseJson:/1) = [3.141, 23]
var r; 5.do { :each | r := each }; r = 5
var r; 0.do { :each | r := each }; r = nil
1.toDo(0) { :each | 'toDo'.error }; true

'System/system'
system.typeOf = 'System'
system.typeDictionary.keys.includes('System') = true
system.randomFloat < 1
system.uniqueId ~= system.uniqueId

'System/categoryDictionary'
system.categoryDictionary.isIdentityDictionary = true
system.categorizeAll('accessing', ['at', 'atPut', 'first', 'key', 'last', 'value']) = nil
system.isCategoryName('accessing') = true
system.category('accessing').isIdentitySet = true
system.categoriesOf('at').includes('accessing') = true
system.categoriesOf('notInCategorySystem') = []
system.isCategorized('at') = true
system.isCategorized('notInCategorySystem') = false
system.categorizeAll('Collections/Abstract', ['ArrayedCollection', 'Collection', 'SequenceableCollection']) = nil
'Collections/Abstract'.categoryNameParts = ['Collections', 'Abstract']

'System/methodDictionary'
system.methodDictionary.isIdentityDictionary = true
system.methodDictionary::collect.isIdentityDictionary = true
system.methodDictionary::collect[2].isIdentityDictionary = true
system.methodDictionary::collect[2]::Array.isMethod = true
system.methodDictionary.includesKey('collect') = true
system.allMethods.collect { :each | each.signature }.includes('Collection>>sum:/1') = true
system.methodLookup('collect', 2, 'Array').isNil = false
system.methodImplementations('sum').collect { :each | each.origin.name }.includes('Interval') = true
system.methodSignatures('add').includes('IdentityDictionary>>add:/2') = true
system.methodLookup('sum', 1, 'Array').sourceCode = '{ :self |\n\t\tself.reduce(plus:/2)\n\t}'
system.methodLookup('sum', 1, 'Array').origin.name = 'Collection'
system.methodLookup('sum', 1, 'Array').name = 'sum'
system.methodTypes('last:/1').includes('Interval') = true
system.multipleArityMethodList.includes('randomFloat') = true
system.onlyZeroArityMethodList.includes('PriorityQueue') = true
system.doesTraitImplementMethod('Collection', 'select') = true
system.doesTypeImplementMethod('Array', 'adaptToNumberAndApply') = true
[1, 2, 3].respondsTo(select:/2) = true
system.methodPrintString('add').size >= 3
system.methodLookup('collect', 2, 'Array').isMethod = true
system.methodLookup('collect', 2, 'Array').origin.name = 'ArrayedCollection'
system.methodLookup('collect', 2, 'Array').procedure . ([3, 4, 5], { :x | x * x }) = collect([3, 4, 5], { :x | x * x })
system.methodLookup('sum', 1, 'Array') == system.methodLookup('sum', 1, 'OrderedCollection')
'sum:/1'.parseQualifiedMethodName = ['sum', 1]

'System/time'
system.systemTimeInMilliseconds > 0 = true
system.unixTimeInMilliseconds > 1671935015392 = true

'System/traitDictionary'
system.traitDictionary.isIdentityDictionary = true
system.traitDictionary.includesKey('Collection') = true
system.traitTypes('Collection').includes('Array') = true
system.typeTraits('Array').includes('ArrayedCollection') = true
system.methodTraits('atRandom:/1').includesAllOf(['Collection', 'SequenceableCollection']) = true
system.methodTraits('sum:/1') = ['Collection']
system.traitTypes('Object').includes('Number') = true
system.trait('Object').methodDictionary.includesKey('respondsTo:/2') = true
system.trait('Collection').isTrait = true
system.trait('Collection').name = 'Collection'
system.trait('Collection').methodDictionary.includesKey('sum:/1') = true
system.trait('Collection').methodDictionary::sum:/1.isMethod = true
system.traitTypes('Dictionary').includes('IdentityDictionary') = true
system.traitDictionary['Dictionary'].isTrait = true

'System/typeDictionary'
system.typeDictionary.isIdentityDictionary = true
system.typeDictionary.keys.includes('Array') = true
system.typeDictionary.includesKey('Array') = true
system.typeDictionary::Array.isType = true
system.typeDictionary::Array.traitNameArray.includes('Collection') = true
system.typeDictionary::Association.slotNameArray = ['key', 'value']
system.typeDictionary::Association.methodDictionary.keys.includes('equals:/2')
system.typeDictionary::Association.methodDictionary.includesKey('key:/1') = true
system.typeDictionary::UndefinedObject.methodDictionary.includesKey('ifNil:/2') = true
system.typeMethods('Association').select({ :each | each.name = 'copy' }).size = 1
system.typeMethods('Association').collect(name:/1).includes('copy') = true
system.type('Array').isType = true
system.type('Array').name = 'Array'
system.type('Array').methodDictionary.includesKey('copy:/1') = true
system.type('Array').methodDictionary::copy:/1.isMethod = true
system.typeMethodSet('Array').collect(name:/1).includes('select') = true
