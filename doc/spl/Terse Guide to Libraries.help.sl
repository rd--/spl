# Terse Guide to Libraries

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

## Pair -- collection type
```
Pair('x', 'y').typeOf = 'Pair'
Pair('x', 'y').isPair = true
Pair('x', 'y').first = 'x'
Pair('x', 'y')[1] = 'x'
var p = Pair('x', 'y'); p[1] := 'z'; p.first = 'z'
var p = Pair('x', 'y'); p.swapInPlace; p[1] = 'y'
Pair('x', 'y').swapped = Pair('y', 'x')
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
'/home/rohan/sw/spl/doc/spl/Terse Guide.help.sl'.fileUrl.terseGuideSummary
'/home/rohan/sw/spl/doc/spl/Terse Guide to Graphics.help.sl'.fileUrl.terseGuideSummary
'/home/rohan/sw/spl/doc/spl/Terse Guide to Sound.help.sl'.fileUrl.terseGuideSummary
```
