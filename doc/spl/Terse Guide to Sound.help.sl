'Music'
| t = [63, 72, 84, 98, 112].JiTuning; | [t.limit, t.degree] = [7, 5]
| t = [63, 72, 84, 98, 112].JiTuning; | t.ratios = [1, 8:7, 4:3, 14:9, 16:9]
| t = [63, 72, 84, 98, 112].JiTuning; | t.cents.rounded = [0, 231, 498, 765, 996]
| r = [1, 8:7, 4:3, 14:9, 16:9]; | [r.reduce(gcd:/2), r.reduce(lcm:/2)] = [1:63, 112]
[1, 8:7, 4:3, 14:9, 16:9] / 1:63 = [63, 72, 84, 98, 112]
[1, 8:7, 4:3, 14:9, 16:9].JiTuning.integerPitches = [63, 72, 84, 98, 112]
[63, 72, 84, 98, 112].JiTuning.ratios = [1, 8:7, 4:3, 14:9, 16:9]
[1, 3].JiTuning

'Sound/Sc/Lang'
[1, 2, 3, 4, 5].keep(3) = [1, 2, 3] (* keep first n items, alias for first: *)
[1, 2, 3, 4, 5].drop(2) = [3, 4, 5] (* discard first n items *)
(1 .. 9).drop(3) = [4 .. 9]
(1 .. 9).dropLast(3) = [1 .. 6]
(1 .. 9).keep(3) = [1 .. 3]
(1 .. 9).keepLast(3) = [6 .. 9]
[3, 5, 4].normalize = [0, 1, 1/2]
({ :x | x * 2 } <> { :x | x + 3 }).value(4) = 14 (* function composition, right to left *)
'x' + 'y' = 'x y' (* catenation with space *)
'/usr' +/+ 'local' = '/usr/local' (* file path catenation *)
var l = []; [1 .. 9].doAdjacentPairs { :a :b | l.add(a -> b) }; l.size = 8
[1, 3, 5, 7, 9].isSeries = true (* is array an arithmetic series *)
[1 .. 7].collect { :x | x.asBinaryDigits(3) } = [[0, 0, 1], [0, 1, 0], [0, 1, 1], [1, 0, 0], [1, 0, 1], [1, 1, 0], [1, 1, 1]]
23.asDigits(2, 5) = [1, 0, 1, 1, 1] (* binary *)
23.asDigits(8, 2) = [2, 7] (* octal digits *)
23.asDigits(10, 2) = [2, 3] (* decimal digits *)
23.asDigits(16, 2) = [1, 7] (* hexadecimal digits *)
127.asDigits(10, 3) = [1, 2, 7]
127.asDigits(10) = [1, 2, 7]
127.asDigits(2, 7) = [1, 1, 1, 1, 1, 1, 1]
(1 .. 5000).select { :n | n = n.asDigits(10).collect { :x | x ** x }.sum } = [1, 3435]
(1 .. 9).atRandom.inclusivelyBetween(1, 9)
(1 .. 9).atRandom.exclusivelyBetween(0, 10)
[3, 4, 1, 1].integrate = [3, 7, 8, 9]
[3, 4, 1, 1].differentiate = [3, 1, -3, 0]
[0, 3, 1].differentiate = [0, 3, -2]
[1, 2, 4].separate { :a :b | (b - a) > 1 } = [[1, 2], [4]] (* separate using predicate block *)
[1, 2, 4, 5, 7, 8].separate { :a :b | (b - a) > 1 } = [[1, 2], [4, 5], [7, 8]]
[1, 3, 5].stutter(3) = [1, 1, 1, 3, 3, 3, 5, 5, 5]
[0, 0, 0, 1, 1, 1].hammingDistance([0, 0, 1, 1, 0, 0]) = 3 (* number places at which element differs *)
[0, 0, 0, 1, 1, 1].hammingDistance([0, 0, 1, 1, 0]) = 3 (* rhs has fewer elements, includes difference *)
[0, 0, 0, 1, 1].hammingDistance([0, 0, 1, 1, 0, 0]) = 3 (* lhs has fewer elements, includes difference *)
[1, 2, 3].levenshteinDistance([1, 2, 3]) = 0 (* identity *)
[1, 2, 3].levenshteinDistance([1, 2, -3]) = 1 (* substitution (at end) *)
[1, 2, 3].levenshteinDistance([1, 2]) = 1 (* deletion (from end) *)
[1, 2].levenshteinDistance([1, 2, 3]) = 1 (* addition (at end) *)
[1, 3].levenshteinDistance([1, 2, 3]) = 1 (* addition (in interior) *)
[1, 2, 3].levenshteinDistance([1, 3]) = 1 (* deletion (from interior) *)
[1, 2, 3].levenshteinDistance([1, 3, 2]) = 2 (* substitutions *)
[1 .. 4].similarity([1 .. 4]) = 1 (* similarity based on Levenshtein distance (1 = equal) *)
[1 .. 4].similarity([5 .. 8]) = 0 (* similarity based on Levenshtein distance (0 = unequal) *)
[1 .. 4].similarity([1, 3, 2, 4]) = 0.5 (* similarity based on Levenshtein distance *)
[1 .. 4].mirror = [1, 2, 3, 4, 3, 2, 1] (* append reverse of prefix of array *)
[1 .. 9].normalizeSum.sum = 1 (* self / self.sum *)
[1 .. 9].normalize(10, 90) = [10, 20 .. 90] (* normalise between minima and maxima *)
[1 .. 5].wrapExtend(9) = ([1 .. 5] ++ [1 .. 4]) (* extend array cyclically *)
[1 .. 5].wrapExtend(3) = [1 .. 3] (* truncate is required *)
(1 .. 9).clump(3) = [[1 .. 3], [4 .. 6], [7 .. 9]] (* chunks of n places *)
(1 .. 7).clump(3) = [[1 .. 3], [4 .. 6], [7]] (* chunks of n places, last segment may have less places *)
'string'.asciiByteArray.clump(2).collect { :each | each.ByteArray.asciiString } = ['st', 'ri', 'ng']
(9 .. 1).detectIndex(even:/1) = 2 (* answer index of detected element, else nil *)
(9 .. 1).detectIndex(isZero:/1).isNil (* answer index of detected element, else nil *)
5.geom(3, 2) = [3, 6, 12, 24, 48] (* geometric series (size from by) *)
(1, 3 .. 9).isSeries (* is arithmetic series *)
(1, 3 .. 9).isSeriesBy(2) (* is arithmetic series by *)
(1, 3 .. 9).indexOfGreaterThan(6) = 4
[2, 3, 5, 6].indexInBetween(5.2) = 3.2 (* interpolated index for value (collection must be sorted) *)
[2, 3, 5, 6].blendAt(3.2) = 5.2 (* interpolated value between indices *)
[0, 4].collect { :i | [2, 3, 5].clipAt(i) } = [2, 5] (* clamp index to valid range*)
(0 .. 10).collect { :n | n.linLin(0, 10, -4.3, 100).rounded } = [-4, 6, 17, 27, 37, 48, 58, 69, 79, 90, 100]
(0 .. 10).collect { :n | n.linExp(0, 10, 4.3, 100).rounded } = [4, 6, 8, 11, 15, 21, 28, 39, 53, 73, 100]
(1 .. 10).collect { :n | n.expLin(0.1, 10, -4.3, 100).rounded } = [48, 64, 73, 79, 84, 88, 92, 95, 98, 100]
(1 .. 10).collect { :n | n.expExp(0.1, 10, 4.3, 100).rounded } = [21, 33, 44, 53, 62, 71, 78, 86, 93, 100]
(0 .. 10).collect { :n | n.linCurve(0, 10, -4.3, 100, -3).rounded } = [-4, 24, 45, 61, 72, 81, 87, 92, 96, 98, 100]
(1 .. 10).collect { :n | n.curveLin(0, 10, -4.3, 100, -3).rounded } = [-1, 3, 7, 12, 18, 25, 34, 45, 63, 100]
5.linLin(0, 10, -4.3, 100).rounded = 48 (* linear to linear mapping *)
5.linExp(0, 10, 4.3, 100).rounded = 21 (* linear to exponential mapping *)
5.expLin(0.1, 10, -4.3, 100).rounded = 84 (* exponential to linear mapping *)
5.expExp(0.1, 10, 4.3, 100).rounded = 62 (* exponential to exponential mapping *)
5.linCurve(0, 10, -4.3, 100, -3).rounded = 81 (* linear to parametric curve mapping *)
5.curveLin(0, 10, -4.3, 100, -3).rounded = 18 (* parametric curve to liner mapping *)
{ :break:/1 | 10.do { :index | (index = 5).ifTrue { 5.break } } }.block = 5 (* non-local return *)
[1, 2, 4, 8, 16, 32, 64, 128, 256].collect { :each | (each + 1).nextPowerOfTwo } = [2, 4, 8, 16, 32, 64, 128, 256, 512]
[4, 8, 16, 32, 64, 128, 256, 512].collect { :each | (each - 1).previousPowerOf(2) } = [2, 4, 8, 16, 32, 64, 128, 256]
[10, 20, 30].obtain(3, nil) = 30 (* at or default value for out of range index *)
[10, 20].obtain(3, 30) = 30
7.obtain(2, 1) = 1 (* obtain is defined at Object *)
7.obtain(1, nil) = 7
[10, 20, 30, 40].instill(3, -30, nil) = [10, 20, -30, 40] (* atPut or extends array if required *)
[10, 20].instill(3, -30, nil) = [10, 20, -30]
[10].instill(3, -30, 20) = [10, 20, -30]
10.instill(3, -30, 20) = [ 10, 20, -30 ] (* instill is defined at Object *)
10.instill(1, -10, nil) = -10
nil ? 'x' = 'x' (* right hand side if nil *)
'x' ? 'y' = 'x' (* left hand side unless nil *)
Array(4).fill { :i | i * 2 } = [2, 4, 6, 8] (* fill array using block at indicies *)
3:2.RatioCents.rounded = 702
3:2.RatioCents ~ 702
3:2.RatioMidi ~ 7.02
[1, 3, 2, 5, 4].order = [0, 2, 1, 4, 3] (* indices that would sort reciever *)
'string'.split.order = [6, 4, 5, 3, 1, 2] (* indices that would sort reciever *)

'Sound/Sc/Lang/J'
[[], [1], [[2]], [[[3]]]].collect(rank:/1) = [1, 1, 2, 3] (* rank *)
[[1, 2, 3], [4, 5, 6]].shape = [2, 3] (* size of shape is rank *)
[[1, 2], [3, 4], [5, 6]].shape = [3, 2] (* size of each element is size at depth *)
[[[1], [2]], [[3], [4]], [[5], [6]]].shape = [3, 2, 1] (* rank and shape both assume regularity *)
[4].iota = [1, 2, 3, 4] (* array with counter *)
[3, 2].iota = [[1, 2], [3, 4], [5, 6]] (* matrix (two-dimensional array) with counter *)
[3, 2, 1].iota = [[[1], [2]], [[3], [4]], [[5], [6]]] (* three-dimensional array with counter *)
[3, 2, 1].iota.rank = 3 (* iota rank is size of input *)
[3, 2, 1].iota.shape = [3, 2, 1] (* iota shape is input array *)
[3, 2, 1].iota.reshape([2, 3, 1]).shape = [2, 3, 1] (* shape after reshape is requested shape *)
[4, 7, 6, 8].reshape([2, 2]) = [[4, 7], [6, 8]] (* reshape array given Apl type shape value *)
[4, 7, 6, 8].reshape([2, 3]) = [[4, 7, 6], [8, 4, 7]] (* cycle input as required *)
[[1, 2, 3], [4, 5], [6]].allTuples = [[1, 4, 6], [1, 5, 6], [2, 4, 6], [2, 5, 6], [3, 4, 6], [3, 5, 6]]
[5, 5].shapeIndices = [[1 .. 5], [1 .. 5]].allTuples (* all indices to array of given shape *)
| n = 0; | [5, 5].shapeIndicesDo { :each | n := n + 1 }; n = 25 (* all indices to array of given shape *)
| r = Random(98765); | { r.randomInteger(9) }.dupShape([3, 5]) = [[5, 4, 2, 7, 1], [5, 2, 5, 5, 9], [6, 2, 4, 1, 5]]
| r = Random(98765); | { r.randomInteger(9) }.dupShape([2, 2, 3]) = [[[5, 4, 2], [7, 1, 5]], [[2, 5, 5], [9, 6, 2]]]
| s = [2, 3], a = s.iota; | s.shapeIndicesDo { :each | a.atPathPut(each, each.join.asInteger) }; a = [[11, 12, 13], [21, 22, 23]]
[3, 2].iota = [[1, 2], [3, 4], [5, 6]]
[3, 2].iota.bubble(0, 1) = [[[1, 2], [3, 4], [5, 6]]]
[3, 2].iota.bubble(1, 1) = [[[1, 2]], [[3, 4]], [[5, 6]]]
[3, 2].iota.bubble(2, 1) = [[[1], [2]], [[3], [4]], [[5], [6]]]
| z = [3, 2].iota; | z.bubble(0, 0) = z.bubble(0, 1)
| z = [3, 2].iota; | z.bubble(0, 1) = [z]
| z = [3, 2].iota; | z.bubble(0, 1).unbubble(0, 1) = z
| z = [3, 2].iota; | z.bubble(1, 1).unbubble(1, 1) = z
| z = [3, 2].iota; | z.bubble(2, 1).unbubble(2, 1) = z
| z = [3, 2].iota; | z.bubble(0, 2) = [[z]]
| z = [3, 2].iota; | z.bubble(0, 2).unbubble(0, 2) = z
[[1, 2, 3], [[41, 52], 5, 6], 1, 2, 3].maxDepth = 3
(0 .. 3).collect { :k | [[1, 2, 3], [[41, 52], 5, 6], 1, 2, 3].maxSizeAtDepth(k) } = [5, 3, 2, 1]
[4, 5].iota.slice([nil, (1 .. 3)]) = [[1, 2, 3], [6, 7, 8], [11, 12, 13], [16, 17, 18]]
[4, 5].iota.slice([[3], (1 .. 3)]) = [11, 12, 13]
[4, 5].iota.slice([3, (1 .. 3)]) = [11, 12, 13]
[4, 5].iota.slice([(3 .. 4), (1 .. 3)]) = [[11, 12, 13], [16, 17, 18]]
[4, 5].iota.slice([(2 .. 4), [4]]) = [9, 14, 19]
[4, 5].iota.slice([(2 .. 4), 4]) = [9, 14, 19]
[4, 5].iota.slice([[3], [4]]) = 14
[4, 5].iota.slice([3, 4]) = 14
[3, 3, 3].iota.slice([[1, 2], [2, 3], [1, 3]]) = [[[4, 6], [7, 9]], [[13, 15], [16, 18]]]
[3, 3, 3].iota.slice([nil, nil, [1, 3]]) = [[[1, 3], [4, 6], [7, 9]], [[10, 12], [13, 15], [16, 18]], [[19, 21], [22, 24], [25, 27]]]
[3, 3, 3].iota.slice([[2]]) = [[10, 11, 12], [13, 14, 15], [16, 17, 18]]
[3, 3, 3].iota.slice([2]) = [[10, 11, 12], [13, 14, 15], [16, 17, 18]]
[3, 3, 3].iota.slice([nil, [2]]) = [[4, 5, 6], [13, 14, 15], [22, 23, 24]]
[3, 3, 3].iota.slice([nil, nil, 2]) = [[2, 5, 8], [11, 14, 17], [20, 23, 26]]
[3, 3, 3].iota.slice([nil, [3], [2]]) = [8, 17, 26]
[3, 3, 3].iota.slice([nil, 3, 2]) = [8, 17, 26]
[3, 3, 3].iota.slice([nil, [2], (2 .. 3)]) = [[5, 6], [14, 15], [23, 24]]
[3, 3, 3].iota.slice([nil, 2, (2 .. 3)]) = [[5, 6], [14, 15], [23, 24]]
[3, 3, 3].iota.slice([[2], [1, 2]]) = [[10, 11, 12], [13, 14, 15]]
[3, 3, 3].iota.slice([2, [1, 2]]) = [[10, 11, 12], [13, 14, 15]]
[2, 3, 2].iota.collect(reverse:/1) = [[[5, 6], [3, 4], [1, 2]], [[11, 12], [9, 10], [7, 8]]]
[2, 3, 2].iota.deepCollect(0, reverse:/1) = [[[7, 8], [9, 10], [11, 12]], [[1, 2], [3, 4], [5, 6]]]
[2, 3, 2].iota.deepCollect(2, reverse:/1) = [[[2, 1], [4, 3], [6, 5]], [[8, 7], [10, 9], [12, 11]]]
| a = [[10, 20],[30, 40, 50], 60, 70, [80, 90]], b = [[1, 2, [3, 4], [[5], 6], 7], 8, [[9]]]; | a.reshapeLike(b) = [[10, 20, [30, 40], [[50], 60], 70], 80, [[90]]] & { b.reshapeLike(a) = [[1, 2], [3, 4, 5], 6, 7, [8, 9]] }
