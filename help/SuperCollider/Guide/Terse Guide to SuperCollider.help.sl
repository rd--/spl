# Terse Guide to SuperCollider

## Dictionary -- extensions
```
(x: 1, y: [2 3]).multiChannelExpand = [(x: 1, y: 2), (x: 1, y: 3)]
(x: 1, y: [2 3], z: [4 5 6]).multiChannelExpand = [(x: 1, y: 2, z: 4), (x: 1, y: 3, z: 5), (x: 1, y: 2, z: 6)]
```

## Nil -- extensions
```
```

## Number -- extensions
```
1:3.coin.isBoolean (* probability may be a fraction *)
| c = 0.5.coin.if { 't' } { 'f' }; | c = 't' | { c = 'f' }
(0 .. 14).collect { :each | each.degreeToKey([0, 2, 4, 5, 7, 9, 11], 12) } = [0, 2, 4, 5, 7, 9, 11, 12, 14, 16, 17, 19, 21, 23, 24]
(-3 .. 13).collect { :each | each.foldOnce(1, 9) } = [5, 4, 3, 2, 1, 2, 3, 4, 5, 6, 7, 8, 9, 8, 7, 6, 5]
(-3 .. 13).collect { :each | each.fold(1, 9) } = [5, 4, 3, 2, 1, 2, 3, 4, 5, 6, 7, 8, 9, 8, 7, 6, 5]
(-3 .. 13).collect { :each | each.foldOnce(4, 7) } = [11, 10, 9, 8, 7, 6, 5, 4, 5, 6, 7, 6, 5, 4, 3, 2, 1]
(-3 .. 13).collect { :each | each.fold(4, 7) } = [5, 4, 5, 6, 7, 6, 5, 4, 5, 6, 7, 6, 5, 4, 5, 6, 7]
```

## Object -- extensions
```
```

## SequenceableCollection -- extensions
```
[1, 2, 3] * 4 = [4, 8, 12]
[-2 .. 2].max(0) = [0, 0, 0, 1, 2]
[-2 .. 2].max(0) = 0.max([-2 .. 2])
[-2 .. 2].min(0) = [-2, -1, 0, 0, 0]
0.min([-2 .. 2]) = [-2 .. 2].min(0)
[-3 .. 3].roundTo(2) = [-2, -2, -0, 0, 2, 2, 4]
[9, 25, 81].collect(sqrt:/1) * [2, 3, 4] = [ 6, 15, 36 ]
[1, 2, 3, 4, 5] * [6, 7, 8, 9] = [6, 14, 24, 36, 30]
[1, 2, 3].cos.rounded = [1, -0, -1]
[1, 2, 3].cubed = [1, 8, 27]
[1 .. 5].stutter(2) = [1, 1, 2, 2, 3, 3, 4, 4, 5, 5]
1.to(9).collect(squared:/1) * 2 = [2, 8, 18, 32, 50,72, 98, 128, 162]
1.to(9).collect(squared:/1) / 2 = [0.5, 2, 4.5, 8, 12.5, 18,24.5, 32, 40.5]
2 * 1.to(9).collect(squared:/1) / 2 = [1, 4, 9, 16, 25,36, 49, 64, 81]
2 * 1.to(9).collect(squared:/1) / 2 * 9 / 9 = [1, 4, 9, 16, 25,36, 49, 64, 81]
[1, 2].extendTo(5) = [1, 2, 1, 2, 1]
[[1, 2], [3, 4, 5]].extendToBeOfEqualSize = [[1, 2, 1], [3, 4, 5]]
[[1, 2], [3, 4, 5], 6].extendToBeOfEqualSize = [[1, 2, 1], [3, 4, 5], [6, 6, 6]]
[[1, 2], [3, 4, 5]].flop = [[1, 3], [2, 4], [1, 5]]
[0, [1, 2], [3, 4, 5]].flop = [[0, 1, 3], [0, 2, 4], [0, 1, 5]]
[1 2; 3 4 5].flop = [1 3; 2 4; 1 5]
[1 2; 3 4 5; 6].flop = [1 3 6; 2 4 6; 1 5 6]
[[1, 2], [3, 4]].allTuples = [[1, 3], [1, 4], [2, 3], [2, 4]]
[[1, 2], [3, 4], [4, 5], [6, 7, 8, 9]].allTuples.size = 32
[10, 20, 30, 40, 50].withCrossedCollect([1, 2, 3], plus:/2) = [11, 12, 13, 21, 22, 23, 31, 32, 33, 41, 42, 43, 51, 52, 53]
var x = [4, 4.5], y = [2, 3, 5, 6], z = [x, y]; z.withTableCollect(z, times:/2) = [x * [x, y], y * [x, y]]
var x = [4, 4.5], y = [2, 3, 5, 6]; [x * [x, y], y * [x, y]] = [[[16, 18], [9, 13.5, 22.5, 27]], [[8, 9], [6, 9, 15, 18], [20, 22.5], [12, 18, 30, 36]]]
[10, 20, 30, 40, 50].crossedMultiply([1, 2, 3]) = [10, 20, 30, 20, 40, 60, 30, 60, 90, 40, 80, 120, 50, 100, 150]
[10, 20, 30, 40, 50].crossedMultiply([1, 2, 3]) = [10, 20, 30, 40, 50].withCrossedCollect([1, 2, 3], times:/2)
1.atExtending(-1) = 1 (* atWrap but answering self for scalar values *)
[1].atExtending(-1) = 1 (* atWrap but answering self for scalar values *)
1.sizeForExtending = 1 (* size but answering one for scalar values *)
[1].sizeForExtending = 1 (* size but answering one for scalar values *)
[1 .. 9].blendAt(4.5) = 4.5 (* linear interpolating indexing *)
[1 .. 9].blendAtAll([3, 4.5, 5]) = [3, 4.5, 5] (* linear interpolating indexing *)
[1 .. 3].blendAtAll([1, 1.5 .. 3]) = [1, 1.5 .. 3]
[1, 3 .. 9].resamp1(9) = [1 .. 9] (* linear interpolating resampler *)
[1 .. 4].resamp1(12).roundTo(0.01) = [1 1.27 1.55 1.82 2.09 2.36 2.64 2.91 3.18 3.45 3.73 4]
[2 3 5 6].indexInBetween(5.2) = 3.2 (* interpolated index for value (collection must be sorted) *)
[2 3 5 6].blendAt(3.2) = 5.2 (* interpolated value between indices *)
[0 1 2 3 4 4 3 2].integrate = [0 1 3 6 10 14 17 19] (* cummulative sum *)
([0 1 2 3 4 4 3 2].asRandomTable * 100).rounded = [0 23 35 44 53 61 72 88]
([0, 1, 2, 3, 2].asRandomTable * 100).round = [0, 30, 47, 60, 80]
([0 1 2 3 4 4 3 2].integrate.normalize(1, 8) * 100).rounded = [100 137 211 321 468 616 726 800]
```

## String -- extensions
```
'x' ++? 'y' = 'xy' (* optional (non-nil) append *)
'x' ++? { 'y' } = 'xy' (* optional (non-nil) append *)
'x' ++? nil = 'x' (* optional (non-nil) append *)
```

## Ugen -- sound type
```
SinOsc(440, 0).isUgen = true
'g'.encodeUgen(SinOsc(440, 0) * 0.1).isByteArray = true
23.isOutputSignal = false
```

## SoundFile
```
SfAcquire('piano-c5', 2, [1, 2]) = -1
```

## System -- extensions
```
system.scSynth.typeOf = 'ScSynth'
system.scSynth.isScSynth
```
