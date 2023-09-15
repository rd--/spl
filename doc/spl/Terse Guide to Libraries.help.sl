# Terse Guide to Libraries

## Benchmarks
```
| r t | t := { r := 26.benchFib }.millisecondsToRun; r = 392835 & { t < 500 }
| r t | t := { r := 10.benchmark }.millisecondsToRun; r = 1028 & { t < 500 } (* c.f tinyBenchmarks *)
| t = { 23.benchFib }.millisecondsToRun; | t > 1 & { t < 1000 }
| [c, t] = { 23.benchFib }.benchForMilliseconds(100); | c >= 1 & { t >= 100 }
```

## Blob
```
[1 .. 9].ByteArray.Blob.size = 9 (* size of Blob *)
[65 .. 69].ByteArray.Blob.text.then { :answer | (answer = 'ABCDE').postLine }; true (* Blob text *)
```

## Compatibility
```
| n = 0; | (x: 1, y: 2, z: 3).keysAndValuesDo { :key :value | n := n + value }; n = 6 (* iterate over keys and values *)
```

## Cons -- collection type
```
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
```

## Implicit Dictionary
```
::x := 4; ::x * ::x = 16
::a := 'x' -> 1; [::a.key, ::a.value] = ['x', 1]
```

## String -- markdown
```
'# A Heading'.markdownToHtml.lines[1] = '<h1>A Heading</h1>'
```

## SmallHours
```
workspace::smallHours.helpFind('Collection')
```

## Cli
```
'/home/rohan/sw/spl/doc/spl/Terse Guide.help.sl'.asFileUrl.terseGuideSummary
'/home/rohan/sw/spl/doc/spl/Terse Guide to Sound.help.sl'.asFileUrl.terseGuideSummary
'http://rohandrape.net/sw/spl/doc/spl/Terse Guide.help.sl'.asUrl.terseGuideSummary
'http://localhost:8000/lib/spl/doc/spl/Terse Guide.help.sl'.asUrl.terseGuideSummary
```
