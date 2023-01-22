'lib/cg/Point'
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

'lib/col/Cons'
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

'lib/col/LinkedList'
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

'lib/col/Pair'
Pair('x', 'y').typeOf = 'Pair'
Pair('x', 'y').isPair = true
Pair('x', 'y').first = 'x'
Pair('x', 'y')[1] = 'x'
var p = Pair('x', 'y'); p[1] := 'z'; p.first = 'z'
var p = Pair('x', 'y'); p.swapInPlace; p[1] = 'y'
Pair('x', 'y').swapped = Pair('y', 'x')

'lib/num/LargeInteger'
(2 ** 54).asLargeInteger.squared.printString = '324518553658426726783156020576256'
'324518553658426726783156020576256'.asLargeInteger.isLargeInteger = true
2971215073.asLargeInteger.isPrime = true

'lib/rx/RegExp'
RegExp('ab+c').isRegExp = true
var r = RegExp('ab*c'); [r.test('ac'), r.test('abc')] = [true, true]
var r = RegExp('ab*c', 'g'); 'ab abc ac'.allRegExpMatches(r) = ['abc', 'ac']

'lib/stream/ReadStream'
var r = [1 .. 5].ReadStream; [r.next, r.next(3), r.next, r.next] = [1, [2, 3, 4], 5, nil]
var r = [1 .. 3].ReadStream; [r.next, r.upToEnd] = [1, [2, 3]]
ReadStream().atEnd = true
var r = (1 .. 5).ReadStream; r.size = 5
var r = (1 .. 5).ReadStream; [r.peek, r.next] = [1, 1]
var r = (1 .. 5).ReadStream; r.skip(3); r.upToEnd = [4, 5]
var r = (9 .. 1).ReadStream; r.upTo(0) = [9 .. 1]
var r = (9 .. 1).ReadStream; [r.upTo(3), r.upToEnd] = [[9 .. 4], [2 .. 1]]
var r = (9 .. 1).ReadStream; [r.upToPosition(3), r.upToEnd] = [[9 .. 7], [6 .. 1]]

'lib/stream/WriteStream'
var a = Array(9); var w = WriteStream(a); w.nextPut(1); w.contents = [1]
var a = Array(9); var w = WriteStream(a); w.nextPut(1); w.nextPutAll([2 .. 8]); w.nextPut(9); w.contents = [1 .. 9]
var a = Array(9); var w = WriteStream(a); w.nextPut(1); w.nextPutAll((2 .. 8)); w.nextPut(9); w.contents = [1 .. 9]
var a = Array(); var w = WriteStream(a); w.nextPut(1); w.contents = [1]
var w = Utf8WriteStream(); 'bodlɛʁ'.encodeOn(w); w.contents.utf8 = 'bodlɛʁ'

'lib/time/Duration'
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
systemTime().seconds > systemTime().hours = true
systemTime().weeks < 1 = true
unixTime().weeks > 2750 = true
{ unixTime().postLine }.evaluateAfter(0.5.seconds).cancel = nil
{ unixTime().postLine }.evaluateAt(unixTime() + 0.5.seconds).cancel = nil
{ unixTime().seconds.rounded.postLine }.evaluateEvery(3.seconds).cancel = nil
var f = { :t0 | | t1 = 2.randomFloat.seconds; | t0.postLine; f.evaluateAfter(t1, t1) }; f(2.seconds).cancel = nil
