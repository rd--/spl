# Terse Guide to SuperCollider

## Dictionary -- extensions
```
(x: 1, y: 2, z: 3).multiChannelExpand = [(x: 1, y: 2, z: 3)]
(x: 1, y: [2 3]).multiChannelExpand = [(x: 1, y: 2), (x: 1, y: 3)]
(x: 1, y: [2 3], z: [4 5 6]).multiChannelExpand = [(x: 1, y: 2, z: 4), (x: 1, y: 3, z: 5), (x: 1, y: 2, z: 6)]
(w: [1 2], x: [3 4 5], y: 6).multiChannelExpand = [(w: 1, x: 3, y: 6), (w: 2, x: 4, y: 6), (w: 1, x: 5, y: 6)]
```

## Number -- extensions
```
0:14.collect { :each | each.degreeToKey([0, 2, 4, 5, 7, 9, 11], 12) } = [0, 2, 4, 5, 7, 9, 11, 12, 14, 16, 17, 19, 21, 23, 24]
-3:13.collect { :each | each.foldOnce(1, 9) } = [5, 4, 3, 2, 1, 2, 3, 4, 5, 6, 7, 8, 9, 8, 7, 6, 5]
-3:13.collect { :each | each.fold(1, 9) } = [5, 4, 3, 2, 1, 2, 3, 4, 5, 6, 7, 8, 9, 8, 7, 6, 5]
-3:13.collect { :each | each.foldOnce(4, 7) } = [11, 10, 9, 8, 7, 6, 5, 4, 5, 6, 7, 6, 5, 4, 3, 2, 1]
-3:13.collect { :each | each.fold(4, 7) } = [5, 4, 5, 6, 7, 6, 5, 4, 5, 6, 7, 6, 5, 4, 5, 6, 7]
```

## RandomNumberGenerator -- extensions
```
let c = system.coin(0.5).if { 't' } { 'f' }; c = 't' | { c = 'f' }
system.coin(1/3).isBoolean /* probability may be a fraction */
```

## Sequence -- extensions
```
[1, 2, 3] * 4 = [4, 8, 12]
[-2 .. 2].max(0) = [0, 0, 0, 1, 2]
[-2 .. 2].max(0) = 0.max([-2 .. 2])
[-2 .. 2].min(0) = [-2, -1, 0, 0, 0]
0.min([-2 .. 2]) = [-2 .. 2].min(0)
[-3 .. 3].roundTo(2) = [-2, -2, -0, 0, 2, 2, 4]
[9, 25, 81].collect(sqrt:/1) * [2, 3, 4] = [ 6, 15, 36 ]
[1, 2, 3, 4, 5] * [6, 7, 8, 9] = [6, 14, 24, 36, 30]
[1, 2, 3].cos.round = [1, -0, -1]
[1, 2, 3].cube = [1, 8, 27]
[1 .. 5].stutter(2) = [1, 1, 2, 2, 3, 3, 4, 4, 5, 5]
1.to(9).collect(square:/1) * 2 = [2, 8, 18, 32, 50,72, 98, 128, 162]
1.to(9).collect(square:/1) / 2 = [0.5, 2, 4.5, 8, 12.5, 18,24.5, 32, 40.5]
2 * 1.to(9).collect(square:/1) / 2 = [1, 4, 9, 16, 25,36, 49, 64, 81]
2 * 1.to(9).collect(square:/1) / 2 * 9 / 9 = [1, 4, 9, 16, 25,36, 49, 64, 81]
[1, 2].extendTo(5) = [1, 2, 1, 2, 1]
[[1, 2], [3, 4, 5]].extendToBeOfEqualSize = [[1, 2, 1], [3, 4, 5]]
[[1, 2], [3, 4, 5], 6].extendToBeOfEqualSize = [[1, 2, 1], [3, 4, 5], [6, 6, 6]]
[[1, 2], [3, 4, 5]].flop = [[1, 3], [2, 4], [1, 5]]
[0, [1, 2], [3, 4, 5]].flop = [[0, 1, 3], [0, 2, 4], [0, 1, 5]]
[1 2; 3 4 5].flop = [1 3; 2 4; 1 5]
[1 2; 3 4 5; 6].flop = [1 3 6; 2 4 6; 1 5 6]
[[1, 2], [3, 4]].tuples = [[1, 3], [1, 4], [2, 3], [2, 4]]
[[1, 2], [3, 4], [4, 5], [6, 7, 8, 9]].tuples.size = 32
[10, 20, 30, 40, 50].withCollectCrossed([1, 2, 3], +) = [11, 12, 13, 21, 22, 23, 31, 32, 33, 41, 42, 43, 51, 52, 53]
let x = [4, 4.5]; let y = [2, 3, 5, 6]; let z = [x, y]; z.withCollectTable(z, *) = [x * [x, y], y * [x, y]]
let x = [4, 4.5]; let y = [2, 3, 5, 6]; [x * [x, y], y * [x, y]] = [[[16, 18], [9, 13.5, 22.5, 27]], [[8, 9], [6, 9, 15, 18], [20, 22.5], [12, 18, 30, 36]]]
[10, 20, 30, 40, 50].crossedMultiply([1, 2, 3]) = [10, 20, 30, 20, 40, 60, 30, 60, 90, 40, 80, 120, 50, 100, 150]
[10, 20, 30, 40, 50].crossedMultiply([1, 2, 3]) = [10, 20, 30, 40, 50].withCollectCrossed([1, 2, 3], *)
1.atExtending(-1) = 1 /* atWrap but answering self for scalar values */
[1].atExtending(-1) = 1 /* atWrap but answering self for scalar values */
1.sizeForExtending = 1 /* size but answering one for scalar values */
[1].sizeForExtending = 1 /* size but answering one for scalar values */
[1 .. 9].atBlend(4.5) = 4.5 /* linear interpolating indexing */
[1 .. 9].atAllBlend([3, 4.5, 5]) = [3, 4.5, 5] /* linear interpolating indexing */
[1 .. 3].atAllBlend([1, 1.5 .. 3]) = [1, 1.5 .. 3]
[1, 3 .. 9].resample(9) = [1 .. 9] /* linear interpolating resampler */
[1 .. 4].resample(12).roundTo(0.01) = [1 1.27 1.55 1.82 2.09 2.36 2.64 2.91 3.18 3.45 3.73 4]
[2 3 5 6].indexOfInBetween(5.2) = 3.2 /* interpolated index for value (collection must be sorted) */
[2 3 5 6].atBlend(3.2) = 5.2 /* interpolated value between indices */
[0 1 2 3 4 4 3 2].integrate = [0 1 3 6 10 14 17 19] /* cummulative sum */
([0 1 2 3 4 4 3 2].asRandomTable * 100).round = [0 23 35 44 53 61 72 88]
([0, 1, 2, 3, 2].asRandomTable * 100).round = [0, 30, 47, 60, 80]
([0 1 2 3 4 4 3 2].integrate.normalizeRange(1, 8) * 100).round = [100 137 211 321 468 616 726 800]
[1 2 4 7 11 16].differentiate = [1 1 2 3 4 5] /* differentiate, first entry is distance from zero */
```

## String -- extensions
```
'x' ++? 'y' = 'xy' /* optional (non-nil) append */
'x' ++? { 'y' } = 'xy' /* optional (non-nil) append */
'x' ++? nil = 'x' /* optional (non-nil) append */
```

## Ugen -- sound type
```
SinOsc(440, 0).isUgen = true
'g'.encodeUgen(SinOsc(440, 0) * 0.1).isByteArray = true
SinOsc(440, 0).isOutputSignal = true
```

## SoundFile
```
SfAcquire('PianoC5', 2, [1, 2]) = [100, 101]
```

## System -- extensions
```
system.scSynth.typeOf = 'ScSynth'
system.scSynth.isScSynth
```

## Ls -- lazy sequence library
```
let l = LsOnce(1); let a = l.upToEnd; l.reset ; l.upToEnd = a
LsCat([1 2 3]).upToEnd = [1 2 3]
let l = LsCat([1 2 3]); let a = l.upToEnd; l.reset; l.upToEnd = a
LsCat([LsGeom(1, 3, 4), 0, LsSeries(1, 3, 4)]).upToEnd = [1 3 9 27 0 1 4 7 10]
LsN(LsSeries(1, 1, 3), 2).upToEnd = [1 2 3 1 2 3]
LsSeq([1 2 3], 2).upToEnd = [1 2 3 1 2 3]
LsSeq([1 2 3], Infinity).next(9) = [1 2 3 1 2 3 1 2 3]
LsSeq([LsGeom(1, 3, 3), LsSeries(1, 3, 3)], 2).upToEnd = [1 3 9 1 4 7 1 3 9 1 4 7]
LsSer([LsGeom(1, 3, 3), LsSeries(1, 3, 3)], 12).upToEnd = [1 3 9 1 4 7 1 3 9 1 4 7]
LsDupEach(LsSeries(1, 3, 5), 2).upToEnd = [1 1 4 4 7 7 10 10 13 13]
LsDupEach(LsSeries(1, 3, 5), LsSeq([2 3], Infinity)).upToEnd = [1 1 4 4 4 7 7 10 10 10 13 13]
LsRemDup(LsDupEach(LsSeries(1, 3, 5), 2)).upToEnd = [1 4 7 10 13]
LsTake(LsForever(1), 3).upToEnd = [1 1 1]
LsDrop(LsSeries(1, 1, 9), 3).upToEnd = [4 .. 9]
LsForever(1).take(3).upToEnd = [1 1 1]
LsClutch(LsSeries(1, 3, 5), LsSeq([true false true true false], Infinity), -1).upToEnd = [1 1 4 7 7 10 10 13]
LsClutch(LsSeries(1, 3, 5), LsSeq([1 0 1 1 0], Infinity), -1).upToEnd = [1 1 4 7 7 10 10 13]
LsClump(LsSeries(1, 1, 5), 2).upToEnd = [1 2; 3 4; 5]
LsClump(LsSeries(1, 1, 11), LsCyc([2 3])).upToEnd = [1 2; 3 4 5; 6 7; 8 9 10; 11]
LsSeries(1, 1, 9).collect { :each | each * each }.upToEnd = [1 4 9 16 25 36 49 64 81]
LsSeries(1, 1, Infinity).select(isEven:/1).next(4) = [2 4 6 8]
LsSeries(1, 1, Infinity).reject(isEven:/1).next(5) = [1 3 5 7 9]
LsSwitch1([1 3 5], 2).next(3) = [3 3 3]
LsSwitch1([LsSeries(1, 2, 3), LsGeom(2, 3, 3)], LsCyc([1, 2])).next(9) = [1 2 3 6 5 18 1 2 3]
let a = LsSeq([1 2], 2); let b = LsSeq([6 7], 1); LsSwitch([a b 8], LsSeq([3 3 1 2], Infinity)).next(10) = [8 8 1 2 1 2 6 7 8 8]
LsLace([1, LsCyc([2 5]), LsCyc([3 4])]).next(8) = [1 2 3 1 5 4 1 2]
LsLace([1, LsCyc([2 5]), LsCyc([3 4])], 8).upToEnd = [1 2 3 1 5 4 1 2]
LsTuple([1 2 3; 4 5; 6].collect(LsCyc:/1), Infinity).next(6) = [1 4 6; 2 5 6; 3 4 6; 1 5 6; 2 4 6; 3 5 6]
LsTuple([LsCyc([1 .. 5]), LsSeq([5 6 7], 2)], 1).upToEnd = [1 5; 2 6; 3 7; 4 5; 5 6; 1 7; 1 5]
LsSeries(1, 2, 5).drop(2).upToEnd = [5 7 9]
let l = LsSeries(1, 2, 5).drop(2); let a = l.upToEnd; l.reset; l.upToEnd = a
(LsGeom(1, 3, 4) + LsSeries(1, 3, Infinity)).upToEnd = [1 + 1, 3 + 4, 9 + 7, 27 + 10]
(LsGeom(1, 3, 4) * LsSeries(1, 3, Infinity)).upToEnd = ([1 3 9 27] * [1 4 7 10])
(LsGeom(2, 4, 5) / 2).upToEnd = [1 4 16 64 256]
(512 / LsGeom(2, 4, 5)).upToEnd = [256 64 16 4 1]
LsAt([1 3 5 7 9], LsSeries(1, 1, 5)).upToEnd = [1 3 5 7 9]
LsAtWrap([1 3 5 7 9], LsSeries(-1, 1, 9)).upToEnd = [7 9 1 3 5 7 9 1 3]
LsAtFold([1 3 5 7 9], LsSeries(-1, 1, 9)).upToEnd = [5 3 1 3 5 7 9 7 5]
LsAccum(LsSeries(1, 1, 9)).upToEnd = [1 3 6 10 15 21 28 36 45]
LsWalk([1 3 5 7 9], 1).next(13) = [1 3 5 7 9 7 5 3 1 3 5 7 9]
LsWalk([1 3 5 7 9 11], LsCyc([1, 2])).next(13) = [1 5 7 11 9 5 3 3 5 9 11 7 5]
LsBind(freq: LsCyc([3 5 7] * 111), amp: 0.1).next(3) = [(freq: 333, amp: 0.1), (freq: 555, amp: 0.1), (freq: 777, amp: 0.1)]
LsBind(freq: 333, amp: 0.1).next(2) = [(freq: 333, amp: 0.1), (freq: 333, amp: 0.1)]
LsSet('freq', 111, LsBind(freq: 333)).next(3) = [(freq: 111), (freq: 111), (freq: 111)]
LsSet('freq', LsSeries(1, 1, 3) * 111, LsBind(dur: 1)).upToEnd = [(dur: 1, freq: 111), (dur: 1, freq: 222), (dur: 1, freq: 333)]
LsTrace(LsSeries(1, 1, 3)).upToEnd = [1 .. 3]
LsScan(LsSeries(1, 1, 9), +).upToEnd = [1 3 6 10 15 21 28 36 45]
LsScan(LsSeries(1, 1, 9), *).upToEnd = [1 2 6 24 120 720 5040 40320 362880]
LsScan(LsSeries(1, 1, 9), -).upToEnd = [1 -1 -4 -8 -13 -19 -26 -34 -43]
LsScan(LsSeries(1, 1, 9), -.swap).upToEnd = [1 1 2 2 3 3 4 4 5]
LsN(LsScan(LsSeries(1, 1, 6), *), 2).upToEnd = [1 2 6 24 120 720 1 2 6 24 120 720]
LsGeom(1, 2, 9).upToEnd = [1 2 4 8 16 32 64 128 256]
LsDiff(LsSeries(1, 1, 9)).upToEnd = [1 1 1 1 1 1 1 1]
LsDiff(LsGeom(1, 2, 9)).upToEnd = [1 2 4 8 16 32 64 128]
LsN(LsDiff(LsGeom(1, 2, 7)), 2).upToEnd = [1 2 4 8 16 32 1 2 4 8 16 32]
LsAdjacent(LsSeries(1, 1, 9), +).upToEnd = [3 5 7 9 11 13 15 17]
LsAdjacent(LsSeries(1, 1, 9), *).upToEnd = [2 6 12 20 30 42 56 72]
```
