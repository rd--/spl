'Collections/Cons'
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

'Collections/LinkedList'
LinkedList().typeOf = 'LinkedList'
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

'Collections/Pair'
Pair('x', 'y').typeOf = 'Pair'
Pair('x', 'y').isPair = true
Pair('x', 'y').first = 'x'
Pair('x', 'y')[1] = 'x'
var p = Pair('x', 'y'); p[1] := 'z'; p.first = 'z'
var p = Pair('x', 'y'); p.swapInPlace; p[1] = 'y'
Pair('x', 'y').swapped = Pair('y', 'x')

'Collections/SortedArray'
SortedArray().isSortedArray (* sorted array *)
SortedArray().species = SortedArray:/0 (* species is sorted array *)
SortedArray().size = 0 (* query size *)
var a = SortedArray(); a.add(3); a.add(1); a.add(2); a.Array = [1 .. 3] (* add inserts items into sequence *)
var a = [3, 1].SortedArray; a.add(2); a.Array = [1 .. 3] (* sorted array from array *)
var a = [7, 5 .. 1].SortedArray; a.addAll([8, 6 .. 2]); a.Array = [1 .. 8] (* add all elements of collection into sequence *)
var a = [9 .. 1].SortedArray; a.collect { :x | 9 - x }; a.Array = [1 .. 9] (* collect into ordered collection *)

'Collections/Streams/ReadStream'
var r = [1 .. 5].ReadStream; [r.next, r.next(3), r.next, r.next] = [1, [2, 3, 4], 5, nil]
var r = [1 .. 3].ReadStream; [r.next, r.upToEnd] = [1, [2, 3]]
ReadStream().atEnd = true
var r = (1 .. 5).ReadStream; r.size = 5
var r = (1 .. 5).ReadStream; [r.peek, r.next] = [1, 1]
var r = (1 .. 5).ReadStream; r.skip(3); r.upToEnd = [4, 5]
var r = (9 .. 1).ReadStream; r.upTo(0) = [9 .. 1]
var r = (9 .. 1).ReadStream; [r.upTo(3), r.upToEnd] = [[9 .. 4], [2 .. 1]]
var r = (9 .. 1).ReadStream; [r.upToPosition(3), r.upToEnd] = [[9 .. 7], [6 .. 1]]

'Collections/Streams/WriteStream'
var a = Array(9); var w = WriteStream(a); w.nextPut(1); w.contents = [1]
var a = Array(9); var w = WriteStream(a); w.nextPut(1); w.nextPutAll([2 .. 8]); w.nextPut(9); w.contents = [1 .. 9]
var a = Array(9); var w = WriteStream(a); w.nextPut(1); w.nextPutAll((2 .. 8)); w.nextPut(9); w.contents = [1 .. 9]
var a = Array(0); var w = WriteStream(a); w.nextPut(1); w.contents = [1]
var w = Utf8WriteStream(); 'bodlɛʁ'.encodeOn(w); w.contents.utf8 = 'bodlɛʁ'

'String/Markdown'
'# A Heading'.markdownToHtml.lines[1] = '<h1>A Heading</h1>'

'SmallHours'
workspace::smallHours.helpFind('Collection')

'Cli'
'/home/rohan/sw/spl/doc/spl/Terse Guide.help.sl'.readTextFile.then { :text | text.paragraphs.do { :each | each.lines.postLine } }
'/home/rohan/sw/spl/doc/spl/Terse Guide.help.sl'.terseGuideSummary
'/home/rohan/sw/spl/doc/spl/Terse Guide to Graphics.help.sl'.terseGuideSummary
'/home/rohan/sw/spl/doc/spl/Terse Guide to Sound.help.sl'.terseGuideSummary
