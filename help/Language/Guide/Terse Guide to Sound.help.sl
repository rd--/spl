# Terse Guide to Sound

## Music-JiTuning
```
| t = [63, 72, 84, 98, 112].JiTuning; | [t.limit, t.degree] = [7, 5]
| t = [63, 72, 84, 98, 112].JiTuning; | t.ratios = [1, 8:7, 4:3, 14:9, 16:9]
| t = [63, 72, 84, 98, 112].JiTuning; | t.cents.rounded = [0, 231, 498, 765, 996]
| r = [1, 8:7, 4:3, 14:9, 16:9]; | [r.reduce(gcd:/2), r.reduce(lcm:/2)] = [1:63, 112]
[1, 8:7, 4:3, 14:9, 16:9] / 1:63 = [63, 72, 84, 98, 112]
[1, 8:7, 4:3, 14:9, 16:9].JiTuning.integers = [63, 72, 84, 98, 112]
[63, 72, 84, 98, 112].JiTuning.ratios = [1, 8:7, 4:3, 14:9, 16:9]
[1, 3].JiTuning.ratios = [1, 3]
```

## Music-RatioTuning
```
| r = RatioTuning('', '', [1:1 8:7 4:3 14:9 16:9]); | [r.degree, r.limit, r.cents.rounded] = [5 7 [0 231 498 765 996]]
RatioTuning('', '', [1:1 8:7 4:3 14:9 16:9]).integers =  [63 72 84 98 112]
IntegerTuning('', '', [63 72 84 98 112]).ratios = [1:1 8:7 4:3 14:9 16:9]
RatioTuning('', '', [1:1 8:7 4:3 14:9 16:9]) = IntegerTuning('', '', [63 72 84 98 112])
```

## Music-Pitch
```
69.midiNoteNumber = 440.hertz (* frequency from midi note number *)
4.75.linearOctave = 440.hertz (* frequency from linear octave *)
4.09.octavePitchClass ~ 440.hertz (* frequency from octave pitch class *)
440.hertz.linearOctave = 4.75 (* hertz (cycles per second) to linear octave *)
4.75.linearOctave.hertz = 440 (* linear octave to hertz *)
440.hertz.midiNoteNumber = 69 (* cycles per second (hertz) to midi note number *)
69.midiNoteNumber.hertz = 440 (* midi note number to cycles per second (hertz) *)
0.midiNoteNumber.hertz ~ 8.175
69.midiNoteNumber.octavePitchClass = 4.09 (* midi note number to octave pitch class *)
440.hertz.octavePitchClass = 4.09 (* cycles per second (hertz) to octave pitch class *)
4.09.octavePitchClass.hertz ~ 440 (* octave pitch class to cycles per second *)
4.09.octavePitchClass.midiNoteNumber ~ 69 (* octave pitch class to midi note number *)
0.00.octavePitchClass.hertz ~ 16.35
440.hertz.linearOctave = 4.75 (* frequency as linear octave *)
440.hertz.midiNoteNumber = 69 (* frequency as midi note number *)
440.hertz.octavePitchClass = 4.09 (* octave pitch class number *)
```

## Music-Pitch -- csound
```
440.cps = 440.hertz (* cps = cycles per second *)
4.75.oct = 440.hertz (* oct = linear octave *)
4.09.pch ~ 440.hertz (* pch = octave pitch class *)
440.cps.oct = 4.75 (* cps to oct *)
4.75.oct.pch = 4.09 (* oct to pch *)
4.09.pch.cps ~ 440 (* pch to oct *)
440.cps.midi = 69 (* cps to midi *)
440.cps.oct = 4.75 (* cps to oct *)
440.cps.pch = 4.09 (* cps to pch *)
4.75.oct.cps = 440 (* oct to cps *)
4.75.oct.midi = 69 (* oct to midi *)
4.75.oct.pch = 4.09 (* oct to pch *)
4.09.pch.cps ~ 440 (* pch to cps *)
4.09.pch.midi ~ 69 (* pch to midi *)
4.09.pch.oct ~ 4.75 (* pch to oct *)
69.midi.cps = 440 (* midi to cps *)
69.midi.oct = 4.75 (* midi to oct *)
69.midi.pch = 4.09 (* midi to pch *)
```

## Music -- pitch
```
7.flat = 6.9 & { 7.flat.flat ~ 6.8 } (* alterations to a degree are written as fractional difference *)
7.sharp = 7.1 & { 7.sharp.sharp ~ 7.2 }
7.quarterToneFlat = 6.95
7.quarterToneSharp = 7.05
```

## SuperCollider-Lang
```
(1 .. 5).keep(3) = (1 .. 3) (* keep first count items, alias for first: *)
(1 .. 5).drop(2) = (3 .. 5) (* discard first count items *)
(1 .. 9).drop(3) = (4 .. 9)
(1 .. 9).dropLast(3) = (1 .. 6)
(1 .. 9).drop(-3) = (1 .. 6) (* negative count drops from end *)
(1 .. 9).keep(3) = (1 .. 3)
(1 .. 9).keepLast(3) = (6 .. 9)
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
(1 .. 5000).select { :n | n = n.asDigits(10).collect { :x | x ^ x }.sum } = [1, 3435]
(1 .. 9).atRandom.inclusivelyBetweenAnd(1, 9)
(1 .. 9).atRandom.exclusivelyBetweenAnd(0, 10)
[3, 4, 1, 1].integrate = [3, 7, 8, 9]
[3, 4, 1, 1].differentiate = [3, 1, -3, 0]
[0, 3, 1].differentiate = [0, 3, -2]
[1, 2, 4].separate { :a :b | (b - a) > 1 } = [[1, 2], [4]] (* separate using predicate block *)
[1, 2, 4, 5, 7, 8].separate { :a :b | (b - a) > 1 } = [[1, 2], [4, 5], [7, 8]]
[1, 3, 5].stutter(3) = [1, 1, 1, 3, 3, 3, 5, 5, 5]
(1 .. 5).duplicateEach(2) = [1 1 2 2 3 3 4 4 5 5]
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
(1 .. 4).mirror1 = [1, 2, 3, 4, 3, 2] (* mirror without last element *)
(1 .. 4).mirror2 = [1, 2, 3, 4, 4, 3, 2, 1] (* append reverse of array *)
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
10.instill(3, -30, 20) = [10, 20, -30] (* instill is defined at Object *)
10.instill(1, -10, nil) = -10
nil ? { 'x' } = 'x' (* right hand side if nil *)
'x' ? { 'y' } = 'x' (* left hand side unless nil *)
Array(4).fill { :i | i * 2 } = [2, 4, 6, 8] (* fill array using block at indicies *)
3:2.RatioCents.rounded = 702 (* ratio (interval) to cents *)
3:2.RatioCents ~ 702 (* ratio (interval) to cents *)
702.CentsRatio ~ 1.5 (* cents (interval) to ratio *)
3:2.RatioMidi ~ 7.02 (* ratio (interval) to midi *)
7.02.MidiRatio ~ 1.5 (* midi (interval) to ratio *)
[1, 3, 2, 5, 4].order = [1, 3, 2, 5, 4] (* indices that would sort reciever *)
'string'.split.order = [6, 4, 5, 3, 1, 2] (* indices that would sort reciever *)
4.75.OctCps = 440 (* linear octave to hertz *)
440.CpsOct = 4.75 (* hertz to linear octave *)
440.CpsMidi = 69 (* hertz to midi note number *)
69.MidiCps = 440 (* midi note number to hertz *)
0.MidiCps.rounded = 8 (* midi note zero *)
1.CpsMidi.rounded = -36 (* one hertz *)
[10, 20, 30, 40, 50].crossedMultiply([1, 2, 3]) = [10, 20, 30, 20, 40, 60, 30, 60, 90, 40, 80, 120, 50, 100, 150]
[10, 20, 30, 40, 50].crossedMultiply([1, 2, 3]) = [10, 20, 30, 40, 50].withCrossedCollect([1, 2, 3], times:/2)
(1 .. 5).slide(3, 1) = [1 2 3 2 3 4 3 4 5] (* adjacent elements given windowLength and stepSize *)
(1 .. 7).slide(3, 2) = [1 2 3 3 4 5 5 6 7] (* 1-3, 3-5, 5-7 *)
(1 .. 6).slide(4, 1) = [1 2 3 4 2 3 4 5 3 4 5 6] (* 1-4, 2-5, 3-6 *)
(1 .. 5).slidingWindows(3, 1) = [(1 .. 3), (2 .. 4), (3 .. 5)] (* 1-3, 2-4, 3-5 *)
(1 .. 7).slidingWindows(3, 2) = [(1 .. 3), (3 .. 5), (5 .. 7)] (* 1-3, 3-5, 5-7 *)
(1 .. 6).slidingWindows(4, 1) = [(1 .. 4), (2 .. 5), (3 .. 6)] (* 1-4, 2-5, 3-6 *)
(1 .. 6).shift(3, 0) = [0 0 0 1 2 3] (* shift right with fill value *)
(1 .. 6).shift(-3, 0) = [4 5 6 0 0 0] (* shift left with fill value *)
[1 2 3].powerset = [[], [3], [2], [2 3], [1], [1 3], [1 2], [1 2 3]] (* powerset *)
[1 2 3].powerset.allButFirst = [3; 2; 2 3; 1; 1 3; 1 2; 1 2 3] (* powerset *)
[1 .. 4].powerset.size = (2 ^ 4) (* powerset size *)
[1 .. 5].powerset.size = (2 ^ 5) (* powerset size *)
```

## SuperCollider-J
```
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
| a = 1, b = 2, x = [a b]; | [x x].allTuples = [a a; a b; b a; b b]
| k = 5, x = (1 .. k); | [x, x].allTuples.size = (k ^ 2)
['a' 'b'; 1 2 3 4; 'x'].allTuples = ['a' 1 'x'; 'a' 2 'x'; 'a' 3 'x'; 'a' 4 'x'; 'b' 1 'x'; 'b' 2 'x'; 'b' 3 'x'; 'b' 4 'x']
[5, 5].shapeIndices = [[1 .. 5], [1 .. 5]].allTuples (* all indices to array of given shape *)
| n = 0; | [5, 5].shapeIndicesDo { :each | n := n + 1 }; n = 25 (* all indices to array of given shape *)
| r = Random(98765); | { r.randomInteger(9) }.duplicateShape([3, 5]) = [[5, 4, 2, 7, 1], [5, 2, 5, 5, 9], [6, 2, 4, 1, 5]]
| r = Random(98765); | { r.randomInteger(9) }.duplicateShape([2, 2, 3]) = [[[5, 4, 2], [7, 1, 5]], [[2, 5, 5], [9, 6, 2]]]
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
(6 .. 1).reshapeLike([1, [2, 3], [4, 5, 6]]) = [6, [5, 4], [3, 2, 1]]
[[6, 5, 4], [3, 2], 1].reshapeLike([1, [2, 3], [4, 5, 6]]) = [6, [5, 4], [3, 2, 1]]
| a = [[10, 20],[30, 40, 50], 60, 70, [80, 90]], b = [[1, 2, [3, 4], [[5], 6], 7], 8, [[9]]]; | a.reshapeLike(b) = [[10, 20, [30, 40], [[50], 60], 70], 80, [[90]]] & { b.reshapeLike(a) = [[1, 2], [3, 4, 5], 6, 7, [8, 9]] }
```
