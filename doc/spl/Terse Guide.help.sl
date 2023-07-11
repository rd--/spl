# Terse Guide

## Arithmetic expressions
```
6 + 3 = 9 (* addition *)
6.plus(3) = 9 (* addition *)
6 - 3 = 3 (* subtraction *)
6.minus(3) = 3 (* subtraction *)
6 * 3 = 18 (* multiplication *)
6.times(3) = 18 (* multiplication *)
9 / 3 = 3 (* division *)
9.dividedBy(3) = 3 (* division *)
9 // 3 = 3 (* integer division *)
9.dividedByDividedBy(3) = 3 (* division *)
1 + 2 * 3 = 9 (* evaluation always left to right, operators equal precedence *)
1 + 2 * 3 = ((1 + 2) * 3) (* equals predicate is also left to right *)
3 = 3 (* equals *)
3.equals(3) (* equals *)
2 ~= 3 (* not equals *)
2.tildeEquals(3) (* not equals *)
3 == 3 (* identical *)
3.equalsEquals(3) (* identity *)
1 + (2 * 3) = 7 (* parentheses group sub-expressions *)
(5 / 3).isInteger.not (* division with fractional result *)
5 / 2 = 2.5 (* division with float result *)
5 // 3 = 1 (* integer divide *)
5 % 3 = 2 (* modulo *)
5.modulo(3) = 2 (* modulo *)
[10 % 5, -4 % 3, 4 % -3, -4 % -3] = [0, 2, -2, -1] (* modulo, negative operands *)
13 % 7 % 4 = 2 (* left assocative *)
13 + 1 % 7 = 0 (* equal precedence *)
-5 = 5.negated (* unary minus *)
5.sign = 1 (* numeric sign, positive->1 *)
[-9, 0, 9].collect(sign:/1) = [-1, 0, 1] (* numeric sign (-1 or 0 or 1) *)
5.negated = -5 (* negate receiver, unary minus *)
1.25.truncated = 1 (* integer part of number *)
1.25.fractionPart = 0.25 (* fractional part *)
5.reciprocal = (1/5) (* reciprocal function *)
6 * 3.1 = 18.6 (* auto convert to float *)
5.squared = 25 (* square function *)
25.sqrt = 5 (* square root *)
-1.sqrt.isNaN (* square root of a negative number is not a number *)
4.sqrt = 2 & { 1000000.sqrt = 1000 & { 1.sqrt = 1 } & { 0.sqrt = 0 } }
2.sqrt = 1.4142135623730951
2.sqrt.squared.closeTo(2) (* floating point errors *)
2.sqrt.squared ~ 2 (* almost equal to, or similar to *)
2.sqrt.squared <~ 2 (* less than or similar to *)
2.sqrt.squared >~ 2 (* greater than or similar to *)
2 !~ 3 (* not almost equal to *)
2.sqrt.squared.veryCloseTo(2) (* floating point errors *)
5.0 ** 2.0 = 25.0 (* power function *)
5 ** 2 = 25 (* power function with integer *)
5.timesTimes(2) = 25 (* power function with integer *)
1.exp.veryCloseTo(2.718281828459) (* exponential *)
-5.abs = 5 (* absolute value *)
0.abs = 0 & { 5.abs = 5 } (* absolute value of zero and positive numbers *)
-0 = 0 (* negative zero is equal to zero *)
3.99.rounded = 4 (* round ; c.f. rounded *)
3.99.truncated = 3 (* truncate *)
3.99.roundTo(1) = 4.0 (* round to specified decimal places ; c.f. roundTo: *)
3.99.truncateTo(1) = 3.0 (* truncate to specified decimal places *)
12345.truncateTo(600) = 12000 (* truncate to integer *)
3.99.floor = 3 (* round down *)
3.99.ceiling = 4 (* round up *)
5.factorial = 120 (* factorial *)
28.gcd(12) = 4 (* greatest common denominator *)
28.lcm(12) = 84 (* least common multiple *)
1.exp.log = 1 (* natural logarithm *)
3.log = 1.0986122886681096 (* natural logarithm *)
100.log = 4.605170185988092 (* natural logarithm *)
-1.log.isNaN (* natural logarithm *)
100.log10 = 2.0 (* base 10 logarithm *)
1024.log2 = 10 (* base 2 logarithm *)
2048.log2 = 11 (* base 2 logarithm *)
100.log2 = 6.643856189774724 (* base 2 logarithm *)
-1.log2.isNaN (* base 2 logarithm *)
180.degreesToRadians = pi (* convert degrees to radians *)
pi.radiansToDegrees = 180 (* convert radians to degrees *)
(pi / 2).sin = 1.0 (* sine *)
0.0.cos = 1.0 (* cosine *)
0.cos = 1 (* cosine *)
pi.cos = -1 (* cosine *)
(2 * pi).cos = 1 (* cosine *)
(pi / 2).cos.veryCloseTo(0) (* cosine *)
0.0.tan = 0.0 (* tangent *)
10.max(20) = 20 (* get maximum of two numbers *)
10.min(20) = 10 (* get minimum of two numbers *)
pi.veryCloseTo(3.141592653589793) (* pi = 3.141592653589793 *)
1.exp.veryCloseTo(2.718281828459) (* e = 2.718281828459 *)
| n = 100.randomFloat; | (n >= 0) & { n < 100 } (* random number in (0, self-1) *)
4 + 5 * 6 = 54 (* operators are evaluated left to right *)
0.arcCos = (pi / 2) (* arc cosine *)
1.arcCos = 0 (* arc cosine *)
-1.arcCos = pi (* arc cosine *)
0.arcSin = 0 (* arc sine *)
1.arcSin =(pi / 2) (* arc sine *)
-1.arcSin = (pi / 2).negated (* arc sine *)
0.atan2(0) = 0 (* arc tangent *)
0.atan2(1) = 0
1.atan2(0) = (pi / 2)
{ 1.atan2(nil) }.ifError { :err | true } (* operand not adaptable to number *)
8.cubeRoot = 2 (* nthRoot 3 *)
1000000.cubeRoot = 100 (* cube root *)
1.cubeRoot = 1 (* cube root *)
-0.cubeRoot = -0 (* cube root *)
0.cubeRoot = 0 (* cube root *)
-2.cubeRoot = -1.2599210498948732 (* cube root *)
3 / 0 = inf (* division by zero is infinity *)
-3 / 0 = inf.negated (* negative division by zero is negative infinity *)
(0 / 0).isNaN (* division of zero by zero is NaN *)
1.isNaN.not (* one is a number *)
4 / [0 .. 3] = [inf, 4, 2, 4/3] (* divide by zero is infinity *)
9.primesArray = [2, 3, 5, 7, 11, 13, 17, 19, 23] (* first elements of prime number sequence *)
5.nthPrime = 11 (* the nth entry in the sequence of prime numbers *)
23.nthPrime = 83 (* the nth entry in the sequence of prime numbers *)
3579.nthPrime = 33413 (* the nth entry in the sequence of prime numbers *)
```

## Array -- collection type
```
[].typeOf = 'Array' (* type of Array *)
[].species = Array:/1 (* species of Array *)
[].species.new = [] (* new empty array *)
[].species.new(3) = [nil, nil, nil] (* new array of indicated size *)
[].species.ofSize(3) = [nil, nil, nil] (* new array of indicated size *)
[].species.newFrom([1 .. 9].Set) = [1 .. 9] (* new array from collection *)
[].species.newFrom([].Set) = [] (* new array from empty collection *)
[].species.newFrom([]) = [] (* new array from empty array *)
[].isArray = true (* the empty Array is an Array *)
[].isCollection = true (* arrays are collections *)
[].isIndexable = true (* arrays are indexable *)
[].isSequenceable = true (* arrays are sequenceable *)
[].isEmpty = true (* the empty array is empty *)
[].copy = [] (* copy empty array *)
Array() = [] (* Void constructor makes the empty Array *)
Array(0) = [] (* SmallFloat constructor makes an initialised sized Array *)
Array(3).size = 3 (* new array of indicated size *)
Array(5) = [nil, nil, nil, nil, nil] (* array slots are initialised to nil *)
Array([]) = [] (* Array constructor, empty array *)
| a = [1 .. 9]; | a.Array ~~ a (* Array makes a copy of an array *)
| a = [1 .. 9]; | a.asArray == a (* asArray answers the receiver if it is an array *)
1.toArray = [1].toArray (* enclose a non-collection in an array *)
| a = [1]; | a.toArray == a (* an array is already an array *)
[1, 2, 3] = [1, 2, 3] = true (* Array equality *)
[1, 2, 3] ~= [1, 2, 4] (* Array inequality, differ by value *)
[1, 2, 3] = [1, 2, 4] = false (* Array inequality *)
[1, 2] ~= [1, 2, 3, 4] (* Array inequality, differ by size *)
[1, 2] = [1, 2, 3, 4] = false (* Array inequality *)
[1, 2, 3, 4, 5, 6] ~= 7 (* Array inequality, differ by type *)
[1, 2, 3, 4, 5, 6] = 7 = false (* Array inequality *)
[1, 2, 3] == [1, 2, 3] = false (* Arrays are not identical, even if equal *)
| a = [1, 2, 3]; | a == a = true (* Array self identity *)
[1, 2, 3].isArray = true (* Array predicate *)
[1, 2.3, '4'].atRandom.isArray.not (* Array predicate *)
4 * [1, 2, 3] = [4, 8, 12] (* scalar Array math *)
[1, 3, 5, 7].reversed = [7, 5, 3, 1] (* reversed answers new array *)
| a = [1, 3, 5, 7]; | a.reversed ~= a (* reversed answers new array *)
| a = [1, 3, 5, 7]; | a.reverse = a (* reverse mutates array in place *)
| a = [1, 3, 5, 7]; | a.reverse; a = [7, 5, 3, 1] (* array reverse (in place) *)
[1, 2, 3, 5, 7, 9].sum = 27 (* sum of elements *)
[1, 2, 3].reduce { :a :b | a + b } = 6 (* reduce by plus is sum *)
[1, 2, 3, 5, 7, 9].reduce(plus:/2) = 27 (* reduce by plus is sum *)
[1, 4, 2, 3, 5].reduce(min:/2) = 1 (* reduce by min is min *)
[1, 4, 2, 3, 5].reduce(max:/2) = 5 (* reduce my max is max *)
{ [].reduce { :a :b | a + b } }.ifError { :err | true } (* cannot reduce empty collection *)
[1].reduce { :a :b | nil } = 1 (* reduce one-element collection *)
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
[].noneSatisfy(odd:/1) = true
[1, 3, 5, 7, 9].noneSatisfy(even:/1) = true
[1, 2, 3, 4, 5].noneSatisfy(odd:/1) = false
[1, 2, 3] ++ [4, 5, 6] = [1, 2, 3, 4, 5, 6]
plusPlus([1, 2, 3], [4, 5, 6]) = [1, 2, 3, 4, 5, 6]
[[1, 2, 3], [4, 5, 6], [7, 8, 9]].concatenation = [1, 2, 3, 4, 5, 6, 7, 8, 9]
[[1, 2, 3], [4, 5], [6]].concatenation = [1, 2, 3, 4, 5, 6]
| a = [1, 2, 3]; | a[2] = a.at(2)
[1 .. 5].atIfPresent(3) { :x | x * x } = 9 (* clause if index is valid *)
[1 .. 5].atIfPresent(9) { :x | false } = nil (* ifAbsent clause answers nil *)
[1 .. 5].atIfAbsent(9) { true } (* exception clause if index is invalid *)
[1 .. 5].atIfPresentIfAbsent(9) { :x | false } { true } (* ifPresent and ifAbsent clauses *)
[1 .. 5].atIfPresentIfAbsent(3) { :x | x * x } { false } = 9 (* ifPresent and ifAbsent clauses *)
| a = [1, 2, 3]; | a.atPut(2, 'two'); a = [1, 'two', 3]
| a = [1, 2, 3]; | a[2] := 'two'; a = [1, 'two', 3]
[5, 4, 3, 2, 1].detect { :each | each % 2 = 0 } = 4
{ [5, 4, 3, 2, 1].detect { :each | each % 7 = 0 } }.ifError { :err | true }
[5, 4, 3, 2, 1].findFirst { :each | each * 2 <= 4 } = 2
[5, 4, 3, 2, 1].findFirst { :each | each % 7 = 0 } = nil
[5, 4, 3, 2, 1].findFirstIndex { :each | each % 3 = 0 } = 3
[[1, 2, 3, 4], [5, 6, 7, 8]].transpose = [[1, 5], [2, 6], [3, 7], [4, 8]]
1.toAsCollect(9, Array:/1) { :each | each * each } = [1, 4, 9, 16, 25, 36, 49, 64, 81]
[1 .. 9].copy == [1 .. 9] = false
[1 .. 9].shuffled ~= [1 .. 9]
[1 .. 9].shuffled ~= [1 .. 9]
[1 .. 9].shuffled.sorted = [1 .. 9]
[].shuffled = []
13.fibonacciArray = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233]
'3'.replicate(3) = ['3', '3', '3']
[1, 2, 3, 4, 3, 2, 1].detectMax(identity:/1) = 4
[(1 .. 3), (1 .. 6), (1 .. 9)].detectMax(size:/1) = (1 .. 9)
[(1 .. 3), (1 .. 6), (1 .. 9)].detectMin(size:/1) = (1 .. 3)
[9 .. 1].indexOf(3) = 7
[9 .. 1].includes(3) = true (* predicate to decide if a collection includes an element *)
[1 .. 9].includes(9) (* array includes last element *)
[9 .. 1].anySatisfy { :each | each = 3 } = true
[].includes(3) = false (* the empty collection does not include any element *)
[9 .. 1].includesAllOf([3 .. 7]) = true
[5 .. 3].includesAllOf([3 .. 7]) = false
[].includesAllOf([3 .. 7]) = false
Array(5).fillFromWith([1 .. 5], negated:/1) = [-1 .. -5]
| a = Array(5); | a.fillFromWith([1, 3, 5, 7, 9], squared:/1); a = [1, 9, 25, 49, 81]
| a = Array(4); | [1, 3, 5, 7].collectInto({ :each | each * each}, a); a = [1, 9, 25, 49]
[1, 2, 3, 4, 3, 2, 1].occurrencesOf(3) = 2
| a = [1, 2], [x, y] = a; | [y, x] = [2, 1]
| i = (1 .. 9), [x, y, z] = i; | [z, y, x] = [3 .. 1]
| [x, y] = { | n = system.randomFloat; | [n, n] }.value; | x = y
[1, 3 .. 9] = [1, 3, 5, 7, 9]
[9, 7 .. 1] = [9, 7, 5, 3, 1]
[1 .. 3].printString = '[1, 2, 3]' (* array print string *)
[1, 2, 3].printString = '[1, 2, 3]' (* array print string *)
[1 .. 9].allButFirst = [2 .. 9] (* all but first element of Array *)
[1 .. 9].allButFirst(7) = [8, 9] (* all but first n elements of Array *)
{ [].allButFirst }.ifError { :err | true } (* too few elements *)
[1 .. 9].allButLast = [1 .. 8]
[1 .. 9].allButLast(7) = [1, 2]
{ [].allButLast }.ifError { :err | true }
{ | a = Array(1); | a.at(3) }.ifError { :err | true } (* out of bound indexing is an error *)
| a = Array(1); | a[1].isNil = true (* array slots are initialised to nil *)
| a = Array(1); | a.unsafeAt(3).isNil = true (* unsafe indexing, out of bounds indexes answer nil *)
{ | a = Array(1); | a.atPut(3, 'x') }.ifError { :err | true } (* out of bound mutation is an error *)
| a = Array(1); | a.unsafeAtPut(3, 'x') = 'x' & { a.size = 3 } (* unsafe mutation, out of bounds indices extend array *)
Array:/1.newFrom(Interval(1, 5, 2)) = [1, 3, 5]
[1 .. 9].count(even:/1) = 4
[nil, true, false, 3.141, 23, 'str'].json = '[null,true,false,3.141,23,"str"]'
'[null,true,false,3.141,23,"str"]'.parseJson = [nil, true, false, 3.141, 23, 'str']
[1, 2, 3].select { :x | x > 1 } = [2, 3] (* select items in collection *)
[1 .. 9].select { :x | true } = [1 .. 9] (* select everything *)
[1 .. 9].select { :x | false } = [] (* select nothing *)
[1, 2, 3].reject { :x | x > 1 } = [1]
[1 .. 9].reject { :x | true } = [] (* reject everything *)
(1 .. 9).collect{ :x | x * x }.last = 81
(1 .. 9).collect{ :x | x * x }.collect{ :x | x * x }.last = 6561
[1 .. 9].last(5) = [5 .. 9]
{ [1 .. 3].last(5) }.ifError { :err | true }
[1 .. 9].anyOne = 1 (* any element, chooses first *)
{ [].anyOne }.ifError { :err | true } (* there are not any elements in an empty collection *)
[1 .. 9].any(3) = [1 .. 3] (* any three elements, chooses first *)
{ [1 .. 9].any(11) }.ifError { :err | true } (* it is an error if there are not enough elements *)
[1 .. 9].take(11) = [1 .. 9]
[1, 2]. take(5).size = 2
{ [1, 2].take(-1) }.ifError { :err | true }
[1 .. 5].beginsWith([1 .. 3]) = true
[1 .. 5].beginsWithAnyOf([[5], [4], [3], [2]])= false
[1 .. 5].groupBy(even:/1).keys = [false, true] (* answer a Map grouping elements according to a predicate *)
[1 .. 5].groupBy(even:/1)[true] = [2, 4]
| c = Map(); | [1, 'fred', 2, 'charlie', 3, 'elmer'].pairsDo { :p :q | c.add(q -> p) }; c['elmer'] = 3
[1 .. 9].indexOfSubCollection([3 .. 5]) = 3
[1 .. 9].indexOfSubCollectionStartingAt([3 .. 5], 9) = 0
[1 .. 9].indexOfSubCollectionStartingAt([9], 9) = 9
| c = []; | [1 .. 9].splitByDo([3 .. 5]) { :each | c.add(each) }; c = [[1, 2], [6, 7, 8, 9]]
['a', 'b', '', 'c', '', 'd', '', 'e', 'f'].indicesOfSubCollection(['']) = [3, 5, 7]
['a', 'b', '', 'c', '', 'd', '', 'e', 'f'].splitBy(['']) = [['a', 'b'], ['c'], ['d'], ['e', 'f']]
['a', 'b', '', 'c', '', 'd', '', 'e', 'f', ''].splitBy(['']) = [['a', 'b'], ['c'], ['d'], ['e', 'f'], []]
[5, 6, 3, -3, 2, 1, 0, 4].minMax = [-3, 6]
[2834.83, -293482.28, 99283, 23, 959323].minMax = [-293482.28, 959323]
['x'].detect { :each | each.isString } = 'x' (* detect element in collection *)
{ ['x'].detect { :each | each.isNumber } }.ifError { :err | true } (* if no element is detected, an error is raised *)
['x'].detectIfFound { :each | each.isString } { :x | 42 } = 42 (* process detected element before answering *)
['x'].detectIfFound { :each | each.isNumber } { :x | 'x' } = nil (* if not found answer nil *)
['x'].detectIfFoundIfNone { :each | each.isNumber } { :x | 'x' } { 'x' } = 'x' (* ifFound and ifNone clauses *)
['x'].detectIfNone { :each | each.isString } { 42 } = 'x'
['x'].detectIfNone { :each | each.isNumber } { 42 } = 42
Array(9).atAllPut('x').last = 'x'
[1 .. 9].collect { :each | 10 - each } = [9 .. 1]
[1, 2, 3] ++ [4, 5, 6] = [ 1, 2, 3, 4, 5, 6 ]
[1 .. 5].reversed = [5 .. 1]
| c = [1 .. 5]; | { c[1.5] }.ifError { :err | true } (* index not an integer *)
| c = [1 .. 5]; | { c['1'] }.ifError { :err | true } (* index not an integer *)
{ [1 .. 5].not }.ifError { :err | true } (* cannot be negated *)
| a = [1, 2, 4]; | a.insertAt(3, 3); a = [1 .. 4] (* insert value at index *)
| a = [1, 2, 4]; | a.addAfter(3, 2); a = [1 .. 4] (* insert value after existing value *)
| a = [1, 2, 4]; | a.addBefore(3, 4); a = [1 .. 4] (* insert value before existing value *)
[2, 7, 5, 0, 1, -2].collect { :index | [5, 6, 8].atWrap(index) } = [6, 5, 6, 8, 5, 5] (* index with wrap-around *)
| a = [1, nil, 3]; | a.atWrapPut(5, 2); a = [1, 2, 3]
[1 .. 9].difference([3 .. 7]) = [1, 2, 8, 9] (* set theoretic difference of two collections *)
[1 .. 9].difference([]) = [1 .. 9] (* set theoretic difference of two collections *)
| a = [1 .. 9]; | a.reject { :each | a.includes(each) } = [] (* reject all *)
[1 .. 9].difference([1 .. 9]) = [] (* set theoretic difference of two collections *)
[1, 3 .. 9].intersection([2, 4 .. 8]) = [] (* set theoretic intersection *)
[1 .. 5].intersection([5 .. 9]) = [5] (* set theoretic intersection *)
| a = []; | [1 .. 3].doSeparatedBy { :each | a.add(each) } { a.add(0) }; a = [1, 0, 2, 0, 3]
[1, 2, 3].intersperse(0) = [1, 0, 2, 0, 3]
| a = []; | [1 .. 3].doWithout({ :each | a.add(each) }, 2); a = [1, 3]
[1 .. 9].selectThenCollect(even:/1) { :each | each * 3 } = [6, 12, 18, 24]
| a = []; | [1 .. 9].selectThenDo(even:/1) { :each | a.add(each * 3) }; a = [6, 12, 18, 24]
[1, 3 .. 9].union([3 .. 7]) = [1, 3, 4, 5, 6, 7, 9].Set (* set theoretic union *)
| a = [1 .. 9]; | a.removeAllSuchThat(even:/1); a = [1, 3 .. 9] (* remove elements selected by predicate *)
| a = [1 .. 9]; | a.removeAllFoundIn([1, 3 .. 9]); a = [2, 4 .. 8] (* remove elements found in a collection *)
5.arithmeticSeries(1, 2) = [1, 3 .. 9] (* arithmetic series (size from by) *)
5.geometricSeries(1, 2) = [1, 2, 4, 8, 16] (* geometric series (size from by) *)
Array(3).size = 3
Array:/1.ofSize(3) = [nil, nil, nil]
| l = []; | l.addFirst(1); l.addFirst(2); l = [2, 1] (* add item to start of array *)
[1].addFirst(2) = 2 (* answer is argument *)
| l = []; | l.addLast(1); l.addLast(2); l = [1, 2] (* add item to end of array *)
[1].addLast(2) = 2 (* answer is argument *)
| l = []; | 5.do { :each | l.add(each) }; l = [1 .. 5] (* alias for addLast *)
| l = [1 .. 9]; | l.removeFirst = 1 & { l.size = 8 } (* remove first object from array *)
| l = [1 .. 9]; | l.removeLast = 9 & { l.size = 8 } (* remove last object from array *)
| l = [4, 5]; | l.addAllFirst(1.to(3)); l = [1 .. 5] (* add all elements to start of array *)
[1].addAllFirst([2, 3]) = [2, 3] (* answer is argument *)
| l = [1, 2, 3]; | l.addAllLast(4.to(5)); l = [1 .. 5] (* add all elements to end of array *)
[1].addAllLast([2, 3]) = [2, 3] (* answer is argument *)
| l = [1]; | l.addAll([2, 3]); l.addAll([]); l.addAll([4 .. 6]); l = [1 .. 6] (* alias for addAllLast *)
| i = (1 .. 9), a = []; | a.addAll(i); a.size = 9 (* add elements from Interval to end of Array *)
| s = 'string', a = []; | a.addAll(s); a.size = 6 (* add elements from String to end of Array *)
| s = 'string', a = []; | a.addAll(s.ascii); a.size = 6 (* add elements from ByteArray to end of Array *)
13.fibonacciSequence = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233]
| c = [1 .. 5]; | [c.removeAt(1), c] = [1, [2, 3, 4, 5]]
| c = [1 .. 5]; | [c.removeAt(3), c] = [3, [1, 2, 4, 5]]
| c = [1 .. 5]; | [c.removeFirst(3), c] = [[1, 2, 3], [4, 5]] (* remove first three objects from array *)
| c = [1 .. 5]; | [c.removeLast(3), c] = [[3, 4, 5], [1, 2]] (* remove last three objects from array *)
| c = [1 .. 5]; | c.removeAll; c = [] (* remove all objects from array *)
| c = [1 .. 5]; | [c.remove(3), c] = [3, [1, 2, 4, 5]] (* remove object from array *)
| c = [1 .. 5]; | c.removeIfAbsent(9) { true } & { c = [1 .. 5] } (* remove object from array, handle absence *)
```

## Assignment
```
| a = 'a', b = 'b', c = 'c'; | a := b := c; [a, b, c] = ['c', 'c', 'c'] (* assignment is right-associative *)
```

## Association -- collection type
```
('x' -> 1).typeOf = 'Association'
Association('x', 1) = ('x' -> 1)
'x'.minusGreaterThan(1) = ('x' -> 1)
| a = 'x' -> 1; | [a.key, a.value] = ['x', 1]
('x' -> 1).Array = ['x', 1]
['x' -> 1, 'y' -> 2].collect(Array:/1) = [['x', 1], ['y', 2]]
(23 -> 3.141).printString = '23 -> 3.141'
(23 -> 3.141).storeString = 'Association(23, 3.141)'
(1 -> '1').key = (1 -> 'one').key
(1 -> '1').value ~= (1 -> 'one').value
(1 -> '1') ~= (1 -> 'one')
(1 -> 2) = (1 -> 2).storeString.evaluate
(false -> true) = (false -> true).storeString.evaluate
('+' -> 'plus') = ('+' -> 'plus').storeString.evaluate
```

## Bag -- collection type
```
Bag().isBag = true
Bag().typeOf = 'Bag'
Bag().isCollection
Bag().isIndexable = false
Bag().isSequenceable = false
| b = Bag(); | b.add('x'); b.add('x'); b.size = 2 (* number of objects in bag *)
| b = Bag(); | b.add('x'); b.add('y'); b.add('x'); b.size = 3 (* add element to bag *)
| b = Bag(); | b.addAll(['x', 'y', 'y', 'z', 'z', 'z']); b.size = 6 (* add all elements of argument to bag *)
| c = 'xyyzzz', r = Bag(); | r.addAll(c); r.size = 6 (* add all elements of a String to a Bag *)
| c = 'xyyzzz'.split, r = Bag(); | r.addAll(c); r.size = 6 (* add all characters of a String to a Bag *)
[2, 3, 3, 5, 5, 5, 7, 7, 7, 7].Bag.size = 10
[2, 3, 5, 7, 3, 5, 7, 5, 7, 7].Bag.sortedCounts = [4 -> 7, 3 -> 5, 2 -> 3, 1 -> 2]
[2, 3, 5, 7, 3, 5, 7, 5, 7, 7].Bag.sortedElements = [2 -> 1, 3 -> 2, 5 -> 3, 7 -> 4]
| b = Bag(), o = ['1' -> 10, '2' -> 1, '3' -> 5]; | o.collect { :a | b.addWithOccurrences(a.key, a.value) }; b.sortedElements = o
[1, 3, 5, 1, 3, 1].Bag.sorted = [1, 1, 1, 3, 3, 5]
[1, 3, 5, 1, 5, 1].Bag.sorted = [1, 1, 1, 3, 5, 5]
[1, 3, 5, 1, 3, 1].Bag.sortedCounts = [3 -> 1, 2 -> 3, 1 -> 5]
[1, 3, 5, 1, 5, 1].Bag.sortedCounts = [3 -> 1, 2 -> 5, 1 -> 3]
[1, 3, 5, 1, 3, 1].Bag.sortedElements = [1 -> 3, 3 -> 2, 5 -> 1]
[1, 3, 5, 1, 5, 1].Bag.sortedElements = [1 -> 3, 3 -> 1, 5 -> 2]
| c1 = [2, 3, 3, 4, 4, 4].Bag, c2 = c1.copy, s2 = c2.size; | c1.removeAll; c1.size = 0 & { c2.size = s2 }
| c = Bag(), x = 'x'; | c.add(x); c.remove(x); c.size = 0
| c = ['x', 'x'].Bag; | c.remove('x'); c.remove('x'); c.size = 0
| c = Bag(); | { c.remove('x') }.ifError { :err | true }
[2, 3, 3, 4, 4, 4].Bag.occurrencesOf(3) = 2
[2, 3, 3, 4, 4, 4].Bag.occurrencesOf(4) = 3
[2, 3, 3, 4, 4, 4].Bag.occurrencesOf(5) = 0
[2, 3, 3, 4, 4, 4].Bag.occurrencesOf(nil) = 0
[nil].Bag.occurrencesOf(nil) = 1
| c = [2, 3, 3, 4, 4, 4].Bag; | c.copy = c (* copy *)
| c = Bag(); | c.addWithOccurrences('x', 4); c.occurrencesOf('x') = 4
[2, 3, 3, 4, 4, 4].Bag.Set.size = 3 (* number of unique elements *)
[2, 3, 3, 4, 4, 4].Bag.Set.occurrencesOf(3) = 1
| s = Bag(); | 250.timesRepeat { s.add([1 .. 4].shuffled.asString) }; s.Set.size = 24
```

## Benchmarks
```
| r t | t := { r := 26.benchFib }.millisecondsToRun; r = 392835 & { t < 500 }
| r t | t := { r := 10.benchmark }.millisecondsToRun; r = 1028 & { t < 500 }
```

## Binary -- numeric trait
```
16 << 3 = 128 (* left shift *)
23 << 7 = 2944 (* left shift *)
7 << 23 = 58720256 (* left shift *)
16 >> 3 = 2 (* right shift *)
```

## Bitwise Manipulation
```
2.bitAnd(3) = 2 (* and bits *)
2.bitOr(3) = 3 (* or bits *)
2.bitXor(3) = 1 (* xor bits *)
3.bitNot = -4 (* invert bits *)
2.bitShiftLeft(3) = 16 (* left shift *)
16.bitShiftRight(3) = 2 (* right shift *)
(1 .. 4).select { :bit | 6.bitTest(bit) } = [2, 3] (* bit at position (0|1) [!Squeak] *)
2 << 3 = 16 (* left shift operator *)
16 >> 3 = 2 (* right shift operator *)
{ 1.bitAnd(nil) }.ifError { :err | true } (* operand not adaptable to number *)
{ 1 << nil }.ifError { :err | true } (* operand not adaptable to number *)
0.bitAnd(0) = 0 (* and bits *)
```

## Blob -- system type
```
[].Blob.typeOf = 'Blob' (* type of Blob *)
[].Blob.size = 0 (* empty Blob has size zero *)
[].Blob.isEmpty (* empty Blob is empty *)
[1 .. 9].ByteArray.Blob.size = 9 (* size of Blob *)
[65 .. 69].ByteArray.Blob.text.then { :answer | (answer = 'ABCDE').postLine }; true (* Blob text *)
```

## Boolean -- logic type
```
true = true (* true constant *)
false = false (* false constant *)
true ~= false (* true is not false *)
false ~= true (* false is not true *)
true == true (* true is identical to true *)
false == false (* false is identical to false *)
1 = 1 = true (* equality predicate (operator) *)
1 ~= 2 = true (* inequality predicate (operator) *)
(1 == 1) = true (* identical *)
(1 ~~ 2) = true (* not identical *)
true.and { true } (* logical and *)
true & { true } (* logical and (operator) *)
true.and { false } = false (* logical and *)
true & { false } = false (* logical and (operator) *)
true.or { false } = true (* logical or *)
true | { false } = true (* logical or (operator) *)
true.ifTrue { 'T' } = 'T' (* if then, c.f. conditional statements *)
false.if { 'T' } { 'F' } = 'F' (* if then else (do) *)
true.if { 'T' } { 'F' } = 'T' (* if then else (value) *)
true.not = false (* not true is false *)
false.not = true (* not false is true *)
true.not.not = true (* not of not is the identity *)
1.isNumber = true (* test if object is a number *)
1.isInteger = true (* test if object is an integer *)
1.respondsTo(sqrt:/1) = true (* test if object responds to message *)
nil.isNil = true (* test if object is nil *)
0.positive = (0 >= 0) (* test if number is non-negative *)
0.strictlyPositive = (0 > 0) (* test if number is greater than zero *)
-1.negative = true (* test if number is negative *)
2.even = true (* test if number is even *)
1.even = false (* one is not even *)
1.odd = true (* test if number is odd *)
2.odd = false (* two is not odd *)
'A'.isUppercase = true (* test if upper case character *)
'a'.isLowercase = true (* test if lower case character *)
false.asBit = 0 (* boolean as bit, false is zero *)
true.asBit = 1 (* boolean as bit, true is one *)
true.asInteger > false.asInteger (* boolean as integer, false is zero, true is one *)
true.printString = 'true' (* true print string *)
false.printString = 'false' (* false print string *)
true.typeOf = 'Boolean' (* type of true is Boolean *)
false.typeOf = 'Boolean' (* type of false is Boolean *)
true.isInteger.not (* true is not an integer *)
true.isBoolean (* true is a Boolean *)
false.isBoolean (* false is a Boolean *)
true & { false } = false (* logical and operator *)
true.and { false } = false (* logical and procedure *)
false & { 'false &'.postLine; false } = false
true | { 'true |'.postLine; true } = true
false | { true } = true (* logical or operator *)
false.or { true } = true (* logical or procedure *)
true.printString = 'true' (* true print string *)
{ true & false }.ifError { :err | true } (* & applies the rhs, which must be a procedure *)
true && true = true (* && applies value to the rhs *)
{ false | false }.ifError { :err | true } (* | applies the rhs, which must be a procedure *)
false || true = true (* || applies value to the rhs *)
[true.json, false.json] = ['true', 'false']
['true', 'false'].collect(parseJson:/1) = [true, false]
true.ifTrue { true }
false.ifFalse { true }
```

## Boolean -- equality
```
true = true & { false = false }
true ~= false & { false ~= true }
true == true & { false == false }
true ~~ false & { false ~~ true }
true ~= 1
false ~= 0
true ~= 'true'
false ~= 'false'
false ~= ''
false ~= nil
(true ~= true) = false
(false ~= false) = false
```

## ByteArray -- collection type
```
ByteArray(0).typeOf = 'ByteArray'
ByteArray(0).species = ByteArray:/1
ByteArray(0).isArray = false
ByteArray(0).isByteArray
ByteArray(0).isIndexable
ByteArray(0).isSequenceable
ByteArray(0).size = 0
ByteArray(8).size = 8
ByteArray(8).at(1) = 0
ByteArray(8).atPut(1, 179) = 179
| a = ByteArray(8); | a.atPut(1, 179); a.at(1) = 179
[1 .. 9].ByteArray.isByteArray = true
[1 .. 9].ByteArray.reversed = [9 .. 1].ByteArray
[1 .. 3].ByteArray.printString = '[1, 2, 3].ByteArray'
ByteArray(4).hex = '00000000'
'text'.ascii[1] = 116 (* ByteArray subscript *)
| b = ByteArray(4); | b[1] := 15; b[3] := 240; b.hex = '0f00f000'
| b = ByteArray(4); | b[2] := 15; b[4] := 240; b.hex = '000f00f0'
[1 .. 4].ByteArray.hex = '01020304'
'string'.ascii.hex = '737472696e67' (* hexadecimal string of ByteArray *)
'737472696e67'.parseHexString.ascii = 'string' (* ByteArray of hexadecimal string *)
| b = ByteArray(4); | b.atAllPut(15); b.hex = '0f0f0f0f'
'string'.ascii.Array = [115, 116, 114, 105, 110, 103] (* Array from ByteArray *)
'0f00f010'.parseHexString = [15, 0, 240, 16].ByteArray
{ [1, 2, 3].ByteArray.add(4) }.ifError { :err | true } (* ByteArrays are not @OrderedCollections *)
[1 .. 9].ByteArray.select { :each | false } = [].ByteArray (* select nothing *)
```

## Character -- text type
```
'𠮷'.Character.isCharacter
'𠮷'.Character.string = '𠮷'
'𠮷'.Character.codePoint = 134071
134071.Character.string = '𠮷'
'䶰䶱䶲䶳䶴䶵'.characterArray.collect(codePoint:/1) = [19888 .. 19893]
'x'.Character = 120.Character (* characters are comparable *)
'x'.Character.asInteger = 120
'x'.Character.printString = 'x'
'x'.Character == 120.Character (* characters are identical *)
'𠮷'.Character == '𠮷'.Character (* characters are identical *)
```

## Collection -- collection trait
```
[].isEmpty = true (* is collection empty *)
[].isCollection = true
[].size = 0 (* the empty array has no elements *)
[1, 2, 3] = [1, 2, 3] (* are collections equal *)
[9, 4, 5, 7, 8, 6].size = 6 (* size of collection *)
[9, 4, 5, 7, 8, 6].max = 9 (* maximum item in collection *)
[9, 4, 5, 7, 8, 6].min = 4 (* minimum item in collection *)
[9, 4, 5, 7, 8, 6].sum = 39 (* sum of collection *)
[9, 4, 5, 7, 8, 6].mean = 6.5 (* sum of collection divided by size *)
[1 .. 9].mean = 5 (* sum of collection divided by size *)
| c = [1 .. 9]; | c.sum / c.size = 5
[9, 4, 5, 7, 8, 6].product = 60480 (* product of collection *)
[9, 4, 5, 7, 8, 6].injectInto(0) { :z :e | e + z } = 39 (* sum of collection *)
[9, 4, 5, 7, 8, 6].injectInto(1) { :z :e | e * z } = 60480 (* product of collection *)
[9, 4, 5, 7, 8, 6].includes(7) = true (* is element in collection, i.e. contains *)
[9, 4, 5, 7, 8, 6].includes(3) = false (* is element in collection *)
[9, 4, 5, 7, 8, 6].count { :item | item.even } = 3 (* count elements that satisfy predicate *)
[9, 4, 5, 7, 8, 6].anySatisfy { :item | item.even } = true (* do any elements satisfy predicate *)
[].anySatisfy { :item | true } = false
[9, 4, 5, 7, 8, 6].allSatisfy { :item | item.even } = false (* do all elements satisfy predicate *)
[].allSatisfy { :item | false } = true
[9, 4, 5, 7, 8, 6].occurrencesOf(7) = 1 (* count elements that are equal to object *)
[1, 2, 3, 4, 5].atRandom <= 5 (* random element of collection *)
[1 .. 9].range = (9 - 1) (* maxima - minima *)
[-9, 0, 9].sign = [-1, 0, 1] (* signs of elements *)
[1, 3, 5].select { :x | x > 1 } = [3, 5]
[1, 3, 5].Set.select { :x | x > 1 } = [3, 5].Set
[1, 3, 5].Bag.select { :x | x > 1 } = [3, 5].Bag
(x: 1, y: 3, z: 5).select { :x | x > 1 } = (y: 3, z: 5)
[].select { :each | 'select'.error } = []
[].species.newFrom(Set()) = []
Set().Array = []
[1 .. 9].includesAnyOf([0, 6]) (*includes any element of a collection *)
[2, 3, 4, 5, 5, 6].copyWithout(5) = [2, 3, 4, 6]
| a = [1, 2, 3, 4], b = a.copyWith(5); | a ~= b & { b = [1, 2, 3, 4, 5] }
{ [1, 2].take(-1) }.ifError { :err | true }
[].select { :each | each > 0 } = []
[1, 2, 2, 3, 3, 3].histogramOf { :each | each }.Array = [1, 2, 2, 3, 3, 3]
[1, 2, 2, 3, 3, 3].histogramOf { :each | each } = [1, 2, 2, 3, 3, 3].asBag
| c = [1, 2, 3, 1]; | c.Bag = c.histogramOf(identity:/1)
| c = [1, 2, 3, 1]; | c.Bag = c.histogramOf { :each | each }
[1, 2, 3, 1].Bag = ['x' -> 1, 'y' -> 2, 'y' -> 3, 'z' -> 1].histogramOf { :each | each.value }
['x', 'y', 'y', 'z'].Bag = ['x' -> 1, 'y' -> 2, 'y' -> 3, 'z' -> 1].histogramOf { :each | each.key }
(x: 1, y: 2, z: 1).histogramOf { :each | each } = [1, 2, 1].Bag
(x: 1, y: 2, z: 1).values.histogramOf { :each | each } = [1, 2, 1].Bag
(x: 1, y: 2, z: 1).keys.histogramOf { :each | each } = ['x', 'y', 'z'].Bag
[1.1, 2.1, 3.1, 1.9, 2.9, 1.1].histogramOf { :each | each.rounded } = [1, 2, 3, 2, 3, 1].asBag
[].ifEmpty { true } (* evaluate block if collection is empty *)
```

## Complex -- numeric type
```
Complex(0, 0).isComplex (* complex numbers *)
Complex(-1, 0).real = -1 (* real part of complex number *)
Complex(-1, 0).imaginary = 0 (* imaginary part of complex number *)
Complex(-1, 0) + 1 = Complex(0, 0) (* complex addition with scalar *)
1.i = Complex(0, 1) (* i makes an imaginary number *)
(5 - 6.i) + (-5 + 8.i) = (0 + 2.i)
5 * (5 - 6.i) = (25 - 30.i)
2 * [1 + 2.i, 3 + 4.i, 5 + 6.i] = [2 + 4.i, 6 + 8.i, 10 + 12.i]
5 + 5.i * [1 + 2.i, 3, 5 + 6.i] = [-5 + 15.i, 15 + 15.i, -5 + 55.i]
(5 = 5.i) = false
1 ~= 1.i
(6 - 6.i).abs = 72.sqrt
((1 + 2.i) + 1) = (2 + 2.i)
(1 + (1 + 2.i)) = (2 + 2.i)
((1 + 2.i) + 1) = (2 + 2.i)
(1 + (1 + 2.i)) = (2 + 2.i)
((1 + 2.i) + (2 / 3)).closeTo((5 / 3) + 2.i)
((2 / 3) + (1 + 2.i)).closeTo((5 / 3) + 2.i)
(0 + 5.i).arg = (pi / 2)
| c = (5 - 6.i); | (c * 1.i) = c.i
(2 + 5.i).negated = (-2 - 5.i)
(2 + 5.i).reciprocal = ((2 / 29) - (5 / 29).i)
(6 - 6.i).squared = -72.i
```

## Conditional Statements
```
true.ifTrue { 'T' } = 'T' (* if true then *)
true.ifFalse { 'F' } = nil (* if false then *)
true.if { 'T' } { 'F' } = 'T' (* if true then else if false then *)
```

## Constants
```
true (* true constant *)
false.not (* false constant *)
nil.isNil (* nil object constant *)
inf.isNumber (* Infinity constant *)
pi.isNumber (* pi constant *)
1.isNumber (* integer constants *)
3.14.isNumber (* float constants *)
-1.isNumber (* negative integer constants *)
-3.14.isNumber (* negative float constants *)
'Hello'.isString (* string constant *)
[3, 2, 1].isArray (* array constants *)
['one', 2, 3.141].isArray (* mixing of types allowed *)
```

## Date
Date(system).isDate
Date(0).iso8601 = '1970-01-01T00:00:00.000Z'
Date('1970-01-01T00:00:00.000Z').unixTimeInMilliseconds = 0
Date(0) = Date(0) (* dates are comparable *)
Date(0) ~= Date(system) (* dates are comparable *)
Date(0) < Date(system) (* dates are magnitudes *)
Date(system) > Date(0) (* dates are magnitudes *)
Date('2023-05-11').iso8601 = '2023-05-11T00:00:00.000Z'

## Dictionary -- collection trait
```
(x: 1, y: 2, z: 3).count(even:/1) = 1 (* count elements that match predicate *)
unicodeFractions().isDictionary = true
unicodeFractions().associations.isArray = true
(x: 1, y: 2).select { :each | false } = () (* select nothing *)
().at('x') = nil
().atIfAbsentPut('x') { 1 } = 1
| d = (); | d.atIfAbsentPut('x') { 1 } = 1 & { d::x = 1 }
```

## Duration -- temporal type
```
2.seconds.typeOf = 'Duration'
5.hours.isDuration = true
0.25.seconds = 250.milliseconds (* durations are comparable *)
3.hours.seconds = 10800
1.5.seconds.milliseconds = 1500
0.5.seconds + 750.milliseconds = 1.25.seconds
2.weeks - 12.days = 48.hours
0.25.seconds + 500.milliseconds = 750.milliseconds
500.milliseconds + 0.25.seconds = 0.75.seconds
| f = { :t0 | | t1 = 2.randomFloat.seconds; | f.evaluateAfterWith(t1, t1) }; | f(2.seconds).cancel = nil
2.minutes < 2.hours (* durations are magnitudes *)
2.hours > 2.minutes (* durations are magnitudes *)
```

## Error -- exception type
```
Error().isError = true
Error('Error message').isError = true
Error('Error message').name = 'Error'
Error('Error message').message = 'Error message'
Error('Error message').log = nil
{ Error('Error message').signal }.ifError { :err | true } (* signal an error *)
{ 'Error message'.error }.ifError { :err | true } (* generate and signal an error *)
```

## Float64Array -- collection type
```
Float64Array(0).typeOf = 'Float64Array'
Float64Array(0).species = Float64Array:/1
Float64Array(0).isFloat64Array
Float64Array(0).size = 0
Float64Array(8).size = 8
Float64Array(8).at(1) = 0
Float64Array(8).atPut(1, pi) = pi
| a = Float64Array(8); | a.atPut(1, pi); a.at(1) = pi
[1 .. 9].Float64Array.isFloat64Array = true
[1 .. 9].Float64Array.reversed = [9 .. 1].Float64Array
| a = [1 .. 9].Float64Array; | a.reverse; a = [9 .. 1].Float64Array
| a = [9 .. 1].Float64Array; | a.sort; a = [1 .. 9].Float64Array
{ Float64Array(1).atPut(3, 'x') }.ifError { :err | true }
| a = Float64Array(1); | a.unsafeAtPut(1, 'x'); a.at(1).isNaN = true
| a = Float64Array(1); | a.unsafeAtPut(3, 'x'); a.unsafeAt(3) = nil
[1 .. 3].Float64Array.printString = '[1, 2, 3].Float64Array'
```

## Floating point
```
1.0 * 3.0 > 3.0 = false (* integral floating point math *)
0.1 * 3.0 > 0.3 = true (* general floating point math *)
1.0 * 3.0 = 3.0 = true (* integral floating point math *)
0.1 * 3.0 = 0.3 = false (* general floating point math *)
1.0 + 1.0 + 1.0 = 3.0 = true (* integral floating point math *)
0.1 + 0.1 + 0.1 = 0.3 = false (* general floating point math *)
'-1.4'.asNumber = -1.4 (* parse float *)
```

## Fraction -- numeric type
```
Fraction(2, 3).isFraction (* fractional type *)
2:3 = Fraction(2, 3) (* literal syntax *)
Fraction(4, 6).reduced = 2:3 (* reduced fraction *)
Fraction(4, 6) ~= 2:3 (* non-reduced fraction *)
2:3 = 4:6 (* literals are reduced by construction *)
2 / 3:4 = 8:3 (* division *)
2:3 + 2:3 = 4:3 (* addition *)
2:3 + 1:2 = 7:6 (* reduction to common denominator *)
2:3 + 4:3 = 2 (* addition to integer *)
1:2 - 1:2 = 0 (* subtraction *)
3:4 - 1:2 = 1:4 (* subtraction *)
3:2.ceiling = 2 (* ceiling *)
-3:2.ceiling = -1 (* ceiling *)
4:3.denominator = 3 (* denominator *)
4:3.gcd(7:5) = 1:15 (* greatest common denominator *)
4:3.lcm(7:5) = 28 (* least common multiple *)
4:3.negated = -4:3 (* negation *)
4:3.negative.not (* is negative predicate *)
4:3.numerator = 4 (* numerator *)
2:3.raisedToInteger(5) = 32:243 (* fractions also can be exponentiated *)
2:3 ** 5 = 32:243 (* fractions also can be exponentiated using infix operator *)
{ 2:3 ** 3:4 }.ifError { :err | true } (* only integer exponents are implemented *)
9:5.reciprocal = 5:9 (* reciprocal *)
7:5.squared = 49:25 (* square of *)
3:2.truncated = 1 (* truncation *)
1:2 < 0.5 = false
1:3 > 0.25
0.5 < 1:2 = false
0.25 < 1:3
0.5 < 1:4 = false
0.5 < 1:2 = false
0.5 < 3:4
0.5 <= 1:4 = false
0.5 <= 1:2
0.5 <= 3:4
0.5 > 1:4
0.5 > 1:2 = false
0.5 > 3:4 = false
0.5 >= 1:4
0.5 >= 1:2
0.5 >= 3:4 = false
0.5 = 1:4 = false
0.5 - 1:2 = 0
0.5 = 3:4 = false
0.5 ~= 1:4
1:2 - 0.5 = 0
0.5 ~= 3:4
Fraction(6, 4).reduced = Fraction(3, 2)
Fraction(-6, 4).reduced = Fraction(-3, 2)
Fraction(6, -4).reduced = Fraction(-3, 2)
{ Fraction(6, 0) }.ifError { :err | true }
1:2 = 2:4 = true
1:2 * 2 = 1
2 * 1:2 = 1
23.isFraction = true
23.numerator = 23
23.denominator = 1
1:3 + 1:7 = 10:21
Fraction(3, 1) = 3:1
-3:2.negated = 3:2
-3:2.abs = 3:2
3:2.ceiling = 2
-3:2.ceiling = -1
3:2.floor = 1
-3:2.floor = -2
353:359.printString = '353:359' (* Fraction print string *)
59:61.printString = '59:61' (* Fraction print string *)
4 / (2:3) = 6
4 / (-2:3) = -6
-4 / (-2:3) = 6
-4 / (2:3) = -6
4 * (3:2) = 6
4 * (-3:2) = -6
-4 * (-3:2) = 6
-4 * (3:2) = -6
1:2.reciprocal = 2
3:4.reciprocal = 4:3
-1:3.reciprocal = -3
-3:5.reciprocal = -5:3
4:5.rounded = 1
6:5.rounded = 1
-4:5.rounded = -1
-6:5.rounded = -1
3:2.rounded = 2 (* in case of tie, round to upper magnitude *)
-3:2.rounded = -2
pi.roundUpTo(0.01) = 3.15
pi.roundUpTo(0.1) = 3.2
1923.roundUpTo(10) = 1930
pi.roundUpTo(0.005) = 3.145
pi.negated.roundUpTo(0.01) = -3.14
-3:2.numerator.negative
-3:2.denominator.positive
4:6.numerator = 2
4:6.denominator = 3
4:2 = 2
Fraction(4, 6).numerator = 4
Fraction(4, 6).denominator = 6
Fraction(4, 6).reduced.numerator = 2
Fraction(4, 6).reduced.denominator = 3
3:2.truncated = 1
-3:2.truncated = -1
2:3 - 5:3 = -1
3:2 / 3:4 = 2
3:2 / -3:4 = -2
-3:2 / -3:4 = 2
-3:2 / 3:4 = -2
3:2 * 4:3 = 2
3:2 * -4:3 = -2
-3:2 * -4:3 = 2
-3:2 * 4:3 = -2
5:3 + 1:3 = 2
3:2.asFloat = 1.5
0.5 < 2:3 = true
2:3 > 0.5 = true
1 < 3:2 = true
3:2 > 1 = true
3:4.unicode = '¾'
2:3.unicode = '⅔'
| n = unicodeFractions().associations.collect(value:/1); | n = n.sorted
'4:3'.parseFraction = 4:3
'4/3'.parseFraction('/') = 4:3
| x = Fraction(2 ** 55, 2); | x ~= (x - 1) = false (* fractions of large small floats behave strangely *)
| x = Fraction(2n ** 55n, 2); | x ~= (x - 1) (* fractions of large large integers behave ordinarily *)
2:3 ~= 3:4 (* unequal fractions *)
(2:3 == 2:3).not (* non-identical fractions *)
2:3 ~~ 2:3 (* non-identical fractions *)
2:3 ~~ 3:4 (* non-identical fractions *)
355:113.limitDenominator(77) = 223:71
223:71.limitDenominator(7) = 22:7
22:7.limitDenominator(5) = 16:5
355:113.limitDenominator(7) = 22:7
[1:2, 5:10, 10:20, 50:100, 500:1000].collect { :n | n.limitDenominator(5) } = [1:2, 1:2, 1:2, 1:2, 1:2]
[10, 100].collect { :n | 0.367879.asFraction(n) } = [3:8, 32:87]
(1 .. 5).collect { :n | pi.asFraction(10 ** n) } = [22:7, 311:99, 2862:911, 9563:3044, 313842:99899]
pi.asFraction = 311:99 (* with maximumDenominator set to one hundred *)
(1 / [2, 3, 5, 7, 11, 13, 17]).collect(asFraction:/1) = [1:2, 1:3, 1:5, 1:7, 1:11, 1:13, 1:17]
```

## Integral -- numeric trait
```
1.isInteger = true (* integer predicate *)
123.printString = '123' (* integer print string *)
-987654321.printString = '-987654321' (* negative integer print string *)
4 / 2 = 2 (* integer division with integer result *)
```

## Interval -- collection type
```
Interval(0, 12, 3).Array = [0, 3, 6, 9, 12] (* elements of interval as array *)
Interval(0, 12, 3).size = 5 (* number of elements in interval *)
2.toBy(14, 4).collect { :x | x * x } = [4, 36, 100, 196] (* toBy method at Integer *)
(2, 6 .. 14).collect { :x | x * x } = [4, 36, 100, 196] (* toBy syntax *)
Interval(-1, 1, 0.000001).size = 2000001 (* 2000001 places between -1 and 1 *)
Interval(-1, 1, 0.000001).at(1000001) = 0 (* access value at 1000001st place *)
Interval(5, 10, 1).isInterval (* create interval object *)
Interval(5, 10, 1) = 5.to(10) (* interval from 5 to 10 *)
Interval(5, 10, 2).last = 9 (* create interval object with specified increment *)
5.toBy(10, 2).last = 9 (* interval from 5 to 10 by 2 *)
(1 .. 5).isEmpty.not (* test if empty *)
(1 .. 5).size = 5 (* number of elements *)
(1 .. 9).includes(9) (* test if element is in collection, interval is inclusive *)
(1 .. 9).includes(11).not (* test if element is in collection *)
(1 .. 9).select { :item | item > 7 } = [8, 9] (* return elements that pass test *)
(1 .. 9).reject { :item | item < 7 } = [7, 8, 9] (* return elements that fail test *)
(1 .. 9).collect { :item | item + item }.last = 18 (* transform each element *)
(1 .. 9).detect { :item | item > 3 } = 4 (* detect first element that passes test *)
(9 .. 1).detect(even:/1) = 8 (* detect first element that passes test *)
{ (9, 7 .. 1).detect(even:/1) }.ifError { :err | true } (* if no element is detected, raise error *)
{ [].detect { :item | true } }.ifError { :err | true } (* detect at an empty collection raises an error *)
(1 .. 9).injectInto(0) { :sum :item | sum + item } = 45(* sum elements *)
(1 .. 9).Array = [1 .. 9] (* convert to array *)
(1 .. 9) = (1 .. 9) (* equality *)
(1 .. 9) ~= (9 .. 1) (* inequality *)
(1 .. 9) ~= [1 .. 9] (* intervals are not equal to arrays *)
10.toBy(90, 10).includes(30)
10.toBy(90, 10) = (10, 20 .. 90)
(0, 1:10 .. 1).size = 11
(0, 1:10 .. 1).last = 1
(9 .. 1).Array = [9 .. 1]
(5 .. 1).Array = [5 .. 1]
(5, 3 .. 1).Array = [5, 3 .. 1]
5.downTo(1).Array = [5, 4, 3, 2, 1]
5.toBy(1, -2).Array = [5, 3, 1]
(1.5 .. 4.5).Array = [1.5, 2.5, 3.5, 4.5] (* non-integer start and end *)
(1 .. 9).min = 1 & { (9 .. 1).min = 1 } (* minima *)
(1 .. 9).max = 9 & { (9 .. 1).max = 9 } (* maxima *)
(1 .. 9).species = Array:/1 (* species of Interval is Array *)
1.to(9).isInterval = true (* to generates an Interval *)
to(1, 9).size = 9 (* to generates an Interval *)
(1 .. 9) = 1.to(9)
Interval(-2, 2, 1).collect(even:/1) = [true, false, true, false, true]
(-2 .. 2).collect(odd:/1) = [false, true, false, true, false]
1 + 1.to(9).collect(squared:/1) = [2, 5, 10, 17, 26,37, 50, 65, 82]
2 * (1 .. 9).collect(squared:/1) = [2, 8, 18, 32, 50,72, 98, 128, 162]
1.to(9).Array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
(1 .. 9).Array.copyFromTo(3, 7) = [3, 4, 5, 6, 7]
| i = 1; | 1.to(9).do { :each | i := i + each }; i = 46
Interval(-1, 1, 1).storeString = 'Interval(-1, 1, 1)'
Interval(-1, 1, 1).printString = '(-1 .. 1)'
Interval(1, 9, 1) = (1 .. 9)
Interval(1, 10, 3).size = 4
Interval(1, 10, 3).Array = [1, 4, 7, 10]
1.to(6).reversed = (6 .. 1)
1.to(6).first = 1
(1 .. 6).second = 2
to(1, 6).last = 6
| i = (1 .. 9); | i.first = i[1] (* one-indexed *)
| i = (1 .. 9); | i.last = i[9] (* one-indexed *)
(1 .. 6).sum = 21
Interval(-1, 1, 1).Array = [-1, 0, 1]
1.to(99).asString = '(1 .. 99)'
(1 .. 99).asString = '(1 .. 99)'
downTo(1, -1).asString = 'Interval(1, -1, -1)'
1.to(99).sum = 4950
1.to(99).Array.sum = 4950
(1 .. 9).size = 9
(1 .. 9).sum = 45
(1 .. 9999).sum = 49995000
(1 .. 9999).Array.sum = 49995000
to(1, 9) = Interval(1, 9, 1)
to(9, 1) = Interval(9, 1, 1)
downTo(9, 1) = Interval(9, 1, -1)
1.thenTo(3, 9) = Interval(1, 9, 2)
(1 .. 9) = (1 .. 9)
[1 .. 9] = (1 .. 9).Array (* array interval syntax *)
[9 .. 1] = (9 .. 1).Array (* array interval syntax *)
[3 - 2 .. 7 + 2] = (3 - 2 .. 7 + 2).Array (* array interval syntax *)
| l = []; | Interval(9, 1, -1).do { :each | l.add(each) }; l = [9 .. 1]
collect(1.to(9)) { :each | each * each } = [1, 4, 9, 16, 25, 36, 49, 64, 81]
1.to(9).collect { :each | each * each } = [1, 4, 9, 16, 25, 36, 49, 64, 81]
Interval(1, 6, 2).Array = [1, 3, 5]
Interval(1, 6, 2).last = 5
(1 .. 9).reversed.Array = [9, 8, 7, 6, 5, 4, 3, 2, 1]
Interval(1, 6, 2).reversed.Array = [5, 3, 1]
1.to(9).step = 1
(1, 3 .. 9) = Interval(1, 9, 2)
(9, 7 .. 1) = Interval(9, 1, -2)
(3 .. 7).anyOne = 3 (* any element, chooses first *)
(3 .. 7).any(3) = [3 .. 5] (* any three elements, chooses first *)
(1 .. 9).max = 9
(1 .. 0).size = 2
1.upTo(0).size = 0
3.upTo(5) = (3 .. 5)
0.downTo(1).size = 0
5.downTo(3) = (5 .. 3)
3.upOrDownTo(5) = 5.upOrDownTo(3).reversed
| s = ''; | (1, 3 .. 9).reverseDo { :x | s := s ++ x }; s = '97531'
```

## Iteration
```
| n = 0; | 4.timesRepeat { n := n + 1 }; n = 4 (* times repeat loop (int) *)
| n = 0; | 4.do { :x | n := n + x }; n = 10 (* times repeat loop (int) *)
| n = 0; | 4.do { :x | n := n + x }; n = 10 (* for loop (int) *)
| s = ''; | 4.do { :x | s := s ++ x }; s = '1234' (* for loop (int) *)
| s = ''; | (1 .. 5).do { :x | s := s ++ x }; s = '12345' (* for loop (interval) *)
| s = ''; | 1.toDo(5) { :x | s := s ++ x }; s = '12345' (* for loop (start & end indices) *)
| s = ''; | 1.toDo(0) { :x | 'error'.error }; s = '' (* for loop (end less than start) *)
| s = ''; | (1 .. 3).reverseDo { :x | s := s ++ x }; s = '321' (* for loop (interval, reversed) *)
| s = ''; | [1, 3, 5].do { :x | s := s ++ x }; s = '135' (* for loop (collection) *)
| n = 9; | { n > 3 }.whileTrue { n := n - 1 }; n = 3 (* while true loop *)
| n = 9; | { n < 7 }.whileFalse { n := n - 1 }; n = 6 (* while false loop *)
```

## LargeInteger -- numeric type
```
23n.typeOf = 'LargeInteger'
(2 ** 54).LargeInteger.squared.printString = '324518553658426726783156020576256'
'324518553658426726783156020576256'.parseLargeInteger.isLargeInteger = true
2971215073.LargeInteger.isPrime = true
100n.factorial = 93326215443944152681699238856266700490715968264381621468592963895217599993229915608941463976156518286253697920827223758251185210916864000000000000000000000000n
[-1n, 0n, 1n].collect(sign:/1) = [-1n, 0n, 1n]
6n / 8n = Fraction(3n, 4n)
2 / 3n = Fraction(2n, 3n)
| x = (2n ** 54n); | x ~= (x - 1) (* large integers behave ordinarily *)
5n % 3n = 2n (* modulo *)
[10n % 5n, -4n % 3n, 4n % -3n, -4n % -3n] = [0n, 2n, -2n, -1n] (* modulo, negative operands *)
13n % 7n % 4n = 2n (* left assocative *)
13n + 1n % 7n = 0n (* equal precedence *)
```

## Magnitude -- numeric trait
```
1 < 3 = true (* less than *)
1.lessThan(3) = true
2 < 2 = false
3 < 1 = false
1 <= 3 = true (* less than or equal to *)
2 <= 2 = true
3 <= 1 = false
3 > 1 = true (* greater than *)
2 > 2 = false
1 > 3 = false
3 >= 1 = true (* greater than or equal to *)
2 >= 2 = true
1 >= 3 = false
2 = 2 = true (* equal to *)
[0, 4].collect { :i | [2, 3, 5].at(i.clamp(1, 3)) } = [2, 5] (* clamp index to valid range *)
4.clamp(0, 10) = 4
4.clamp(0, 1) = 1
2.clamp(0, 1) = 1
-1.clamp(0, 1) = 0
-1.clamp(-20, 0) = -1
1 <=> 3 = -1
2 <=> 2 = 0
3 <=> 1 = 1
```

## Map -- collection type
```
| r = Map(); | r.add('x' -> 1); r.size = 1 (* add Association to Dictionary *)
var d = Map(); d.add('x' -> 1); d.add('y' -> 2); d.size = 2 (* add two Associations to Dictionary *)
var d = ['x' -> 1, 'y' -> 2].Map; d.keys = ['x', 'y'] (* answer Array of keys at Dictionary *)
var d = ['x' -> 1, 'y' -> 2].Map; d.values = [1, 2] (* answer Array of values at Dictionary *)
var d = ['x' -> 1, 'y' -> 2].Map; d.at('x') = 1 (* answer value at key in Dictionary *)
var d = ['x' -> 1, 'y' -> 2].Map; d['x'] = 1 (* at (subscript) syntax *)
var d = Map(); d.add('x' -> 1); d.removeKey('x'); d.isEmpty = true (* remove Association from Dictionary given key *)
var d = Map(); d['x'] := 1; d['x'] = 1 (* atPut (subscript mutation) syntax *)
var d = Map(); d[1] := 'x'; d[1] = 'x'
var d = Map(); d['x'] := 1; d.removeKey('x'); d.isEmpty = true
::x := 4; ::x * ::x = 16
::a := 'x' -> 1; [::a.key, ::a.value] = ['x', 1]
var d = (f: { :i | i * i }); d::f.value(9) = 81
{ Map().removeKey('unknownKey') }.ifError { :err | true }
(x: 1, y: 1).withoutDuplicates = (x: 1)
var d = Map(); 100.do { :i | d[i] := i; (i > 10).ifTrue { d.removeKey(i - 10) } }; d.size = 10
var c = Map(); c[2] := 'two'; c[1] := 'one'; c.removeKey(2); c[1] := 'one'; c.removeKey(1); c.includesKey(1) = false
```

## Math
```
-3.abs = 3 (* absolute value *)
1.5.ceiling = 2 (* ceiling (round up) *)
0.cos = 1 (* cosine *)
180.degreesToRadians = pi (* degreesToRadians *)
2.even = true (* eveness predicate *)
1.exp.veryCloseTo(2.718281828459045) (* base e exponent function *)
1.5.floor = 1 (* floor (round down) *)
1.exp.log = 1 (* base e (natural) logarithm *)
1.2.isNumber = true (* is x a number *)
0.isInteger = true (* is x an integer *)
3.positive = true (* is x > 0 *)
1.max(2) = 2 (* maximum *)
1.min(2) = 1 (* minimum *)
3.negated = -3 (* negation *)
3.odd = true (* oddness predicate *)
pi.veryCloseTo(3.1415926535898) (* constant pi (Float pi) *)
inf.isNumber (* constant positive infinity (is a number) *)
2 ** 3 = 8 (* i to the power of j *)
5.reciprocal = 0.2 (* 1 / x *)
(pi / 2).sin = 1 (* sine *)
9.sqrt = 3 (* square root *)
3.squared = 9 (* x * x *)
pi.radiansToDegrees = 180 (* radiansToDegrees *)
{ 1 / nil }.ifError { :err | true } (* operand not apatable to number *)
0.9.rounded = 1
1.rounded = 1
1.1.rounded = 1
-1.9.rounded = -2
-2.rounded = -2
-2.1.rounded = -2
1.5.rounded = 2 (* in case of tie, round to +infinity *)
-1.5.rounded = -1
```

## Method
```
{ true + false }.ifError { :err | true } (* boolean does not implement + *)
var f = { :x :y | x + y }; { f(true, false) }.ifError { :err | true } (* boolean does not implement + *)
```

## Nil -- kernel type
```
nil.typeOf = 'Nil' (* type of nil is Nil *)
nil.isNil = true (* is nil predicate *)
nil = nil (* nil equality *)
nil == nil (* nil identity *)
nil.ifNil { true } = true (* nil conditional *)
nil.ifNil { true } { false } = true (* nil conditional *)
nil.ifNotNil { true } = nil (* nil conditional *)
false.ifNotNil { true } (* nil conditional *)
0.ifNil { false } = 0 (* nil conditional *)
0.ifNil { false } { true } (* nil conditional *)
ifNil(nil) { true } = true (* nil conditional *)
ifNil(0) { false } = 0 (* nil conditional *)
nil.printString = 'nil' (* nil print string *)
nil.json = 'null' (* nil has a Json representation *)
'null'.parseJson = nil (* nil has a Json representation *)
```

## Object -- kernel trait
```
[1, 3, 5].typeOf = 'Array' (* name of type of object *)
[1, 3, 5].species = Array:/1
[1, 3, 5].Set.species = Set:/0
[1, 3, 5].Bag.species = Bag:/0
(x: 1, y: 3, z: 5).species = Record:/0
'b'.caseOf(['a' -> 1, 'b' -> 2, 'c' -> 3]) = 2
{ 'd'.caseOf(['a' -> 1, 'b' -> 2, 'c' -> 3]) }.ifError { :err | true }
3:2.perform('numerator') = 3
(3 -> 2).perform('key') = 3
3.perform('plus', 4) = 7
4:3.slotNameArray = ['numerator', 'denominator']
4:3.slotArray = ['numerator' -> 4, 'denominator' -> 3]
4:3.numerator = 4:3['numerator']
4:3.denominator = 4:3::denominator
```

## PriorityQueue -- collection type
```
PriorityQueue().isPriorityQueue = true
PriorityQueue().isEmpty = true
var p = PriorityQueue(); p.push('a', 1); p.pop = 'a'
var p = PriorityQueue(); p.push('a', 1); p.push('b', 0); p.pop = 'b'
var p = PriorityQueue(); p.pushAll(['a' -> 3, 'b' -> 2, 'c' -> 1]); p.size = 3 & { p.pop = 'c' }
var p = PriorityQueue(); p.peekPriority = nil
```

## Procedure -- behaviour type
```
{ }.typeOf = 'Procedure'
var i = 1; whileTrue { i < 5 } { i := i + 1 }; i = 5
var i = 1; { i < 5 }.whileTrue { i := i + 1 }; i = 5
var i = 1; 1.toDo(3) { :each | i := i + each.squared } ; i = 15
var i = 1; 3.do { :each | i := i + each.squared } ; i = 15
{ }.numArgs = 0 (* procedure arity *)
{ :x | x }.numArgs = 1
{ :i :j | i }.numArgs = 2
{ :i :j :k | i }.numArgs = 3
{ :i :j :k :l | i }.numArgs = 4
collect:/2.numArgs = 2 (* method arity *)
{ { :i | i = nil }.value }.ifError { :err | true } (* too few arguments *)
{ { :x | 0 - x }.value(3, 4) = -3 }.ifError { :err | true } (* too many arguments *)
collect:/2.name = 'collect:/2'
var f = { :x | x * x }; [f(5), f.(5)] = [25, 25]
var f = { :x | x * x }; var d = (p: f); d::p.value(5) = 25
{ 0 }.cull(23) = 0 (* ignore one argument *)
{ 0 }.cull(23, 3.141) = 0 (* ignore two arguments *)
{ :x | x }.cull(23) = 23 (* recognise one argument *)
{ :x | x }.cull(23, 3.141) = 23 (* recognise one argument, ignore one argument *)
{ :x :y | x * y }.cull(23, 3.141) = 72.243 (* recognise two arguments *)
var f = { :x | x * x }; f(3) = 9
{ var f = { :x | x * x }; [3, 5, 7].collect(f) = [9, 25, 49] }.ifError { :err | true }
var f = { :x | x * x }; [3, 5, 7].collect(f:/1) = [9, 25, 49]
{ :x | x * x }.map([3, 5, 7]) = [9, 25, 49] (* map is flipped collect *)
typeOf:/1.typeOf = 'Procedure'
{ :x :y | x * y + y }.apply([3.141, 23]) = 95.243
{ { :x | x }.apply(0) }.ifError { :err | true }
{ { :x | x }.apply([]) }.ifError { :err | true }
var x = { }; x.isProcedure (* blocks are objects and may be assigned to a variable *)
{ nil; 1 }.value = 1 (* value is last expression evaluated *)
{ { 1 }.value }.value = 1 (* blocks may be nested *)
{ :x | var y = x; y }.value(1) = 1 (* specification { arguments localvars expressions } *)
{ 'x' }.value = 'x' (* simple block usage *)
{ :p1 :p2| p1 ++ ' & ' ++ p2 }.value('x', 'y') = 'x & y' (* block with argument passing *)
{ :x | x + 1 }.numArgs = 1 (* the number of arguments can be retrieved *)
{ :x | x := nil }.value(42).isNil (* arguments are mutable *)
{ } ~= { } (* inequality *)
({ } = { }).not (* inequality *)
{ 1 } ~= { 1 } (* inequality *)
{ 1 } ~= 1 (* inequality *)
{ } ~~ { } (* non-identity *)
var f = { }; f == f (* identity *)
{ }.printString = 'Procedure'
{ :x | x }.printString = 'Procedure'
{ }.typeOf = 'Procedure'
{ } . () = nil (* empty procedure evaluates to nil *)
{ | c a | c := [1]; a := { | a | a := 4; a }.value; { | a | a := 2; c.add(a); { | a | a := 3; c.add(a) }.value }.value; c.add(a); c }.value = [1, 2, 3, 4]
```

## Promise -- kernel type
```
{ Promise() }.ifError { :err | true }
var p = Promise { :t:/1 :f | t('t') }; p.then { :t | (t = 't').postLine }; p.isPromise
var p = Promise { :t :f:/1 | f('f') }; p.thenElse { :t | t.postLine } { :f | (f = 'f').postLine }; p.isPromise
var p = Promise { :t :f:/1 | f('f') }; p.then { :t | t.postLine }.catch { :f | (f = 'f').postLine }; p.isPromise
var p = Promise { :t :f:/1 | f('f') }; p.thenElse { :t | t.postLine } { :f | (f = 'f').postLine }.finally { 'true'.postLine }; p.isPromise
```

## Pseudo variables
```
false.isBoolean (* constant *)
false.isBoolean (* constant *)
nil.isNil (* constant *)
pi.isNumber (* constant *)
inf.isNumber (* constant (infinity) *)
```

## Random values
```
9.randomInteger.isInteger (* random integers (1 to self) *)
var s = Set(); 45.timesRepeat { s.add(9.randomInteger) }; s.minMax = [1, 9] (* check distribution *)
var s = Set(); 729.timesRepeat { s.add(9.randomInteger) }; s.Array.sorted = [1 .. 9] (* check distribution *)
9.randomFloat.isNumber (* random floating point number (0 to self) *)
var s = Set(); 81.timesRepeat { s.add(9.randomFloat.rounded) }; s.minMax = [0, 9] (* check distribution *)
3.randomInteger(9).isInteger (* random integer in range *)
3.randomFloat(9).isNumber (* random float in range *)
var b = Bag(); 5000.timesRepeat { b.add(5.atRandom) }; b.contents.values.allSatisfy { :each | (each / 5000 * 5 - 1).abs < 0.1}
{ [].atRandom }.ifError { :err | true } (* random element of empty collection *)
[1].atRandom = 1 (* random element of one-element collection *)
var c = [1 .. 5]; c.includes(c.atRandom) (* answer random element from a collection *)
var a = [1 .. 5].Set, b = Bag(); 250.timesRepeat { b.add(a.atRandom) }; a = b.Set (* random element of collection *)
```

## Record -- collection type
```
().typeOf = 'Record'
().isRecord
().species = Record:/0
Record().isRecord
Record().includesKey('x') = false
(x: 1).includesKey('x') = true
Record().at('x') = nil (* lookup for non-existing key answers nil *)
()['x'] = nil (* lookup for non-existing key answers nil *)
var d = Record(); d.atPut('x', 1); d.at('x') = 1
var d = Record(); d['x'] := 1; d['x'] = 1
var d = Record(); d['x'] := 1; d['y'] := 2; d.size = 2
var d = Record(); d::x := 1; d::y := 2; d.size = 2
['x' -> 1, 'y' -> 2].Record['y'] = 2
{ Record().atPut(1, 1) }.ifError { :err | true }
(x: 3.141, y: 23).Record.json = '{"x":3.141,"y":23}'
'{"x":3.141,"y":23}'.parseJson.Map = (x: 3.141, y: 23)
var d = (x: 1, y: 2), i = 9; d.associationsDo { :each | i := i - each.value } ; i = 6
var d = (x: 1, y: 2); d.collect { :each | each * 9 } = (x: 9, y: 18)
(x: 23, y: 3.141).isDictionary
(x: pi)::x = pi
(x : pi) :: x = pi
var d = (x: 23, y: 3.141); d::x = 23
var d = (x: 23, y: 3.141); d::x := 42; d = (x: 42, y: 3.141)
var d = (x: 23, y: 3.141); d.copy ~~ d
(x:1, y:2) ++ (z:3) = (x:1, y:2, z:3)
(x: 1, y: 2).associations = ['x' -> 1, 'y' -> 2]
(x: 1, y: 2).Array = [1, 2] (* values as Array *)
var d = (x:1, y:2, z:3), (x, z) = d; [x, z] = [1, 3]
var (x, y) = { var n = system.randomFloat; (x: n, y: n) }.value; x = y
(x:1, y:2, z:3).select(even:/1) = (y: 2)
(x:1, y:2, z:3).sum = 6
var d = (x: 9); d::x.sqrt = 3
size (x: 1, y: 2, z: 3) = 3
var c = (y: 2, z: 3), r = (x: 1); r.addAll(c); r = (x: 1, y: 2, z: 3) (* add all elements of a Dictionary to a Dictionary *)
var c = (y: 2, z: 3); (x: 1).addAll(c) = c (* answer is argument *)
(x: 'x', y: '.', z: 'z').associationsSelect { :each | each.key = each.value } = (x: 'x', z: 'z')
var d = (c: 3, parent: (b: 2, parent: (a: 1))); ['a', 'b', 'c'].collect { :each | d.atDelegateTo(each, 'parent') } = [1, 2, 3]
var d = (c: 3, parent: (b: 2, parent: (a: 1))); ['a', 'b', 'c'].collect { :each | d.messageSend(each, 'parent', []) } = [1, 2, 3]
var d = (x: 1, parent: (y: 2, parent: (z: 3))); d.atPutDelegateTo('z', -3, 'parent'); d.atDelegateTo('z', 'parent') = -3
var d = (c: 3, parent: (b: 2, parent: (a: 1))); [d:.a, d:.b, d:.c] = [1, 2, 3]
var d = (x: 1, parent: (y: 2, parent: (z: 3))); d:.z := -3; [d:.x, d:.y, d:.z] = [1, 2, -3]
var d = (length: { :self | (self::x.squared + self::y.squared).sqrt }); var p = (x: 3.141, y: 23, parent: d); p:.length = 23.213484895637706
var d = (x: 9, parent: (f: { :self :aNumber | self::x.sqrt * aNumber })); d:.f(7) = 21
(x: 1) = ('x': 1) (* records with quoted keys *)
('font-size': '11pt', 'font-style': 'italic').keys = ['font-size', 'font-style'] (* records with quoted keys that are not identifiers *)
(x: 1).Map.Record = (x: 1) (* record to map to record is identity *)
(x: true)::x = true (* true value answers true *)
(x: false).includesKey('x') = true (* includesKey at false value answers true *)
(x: false)::x = false (* at at key with false value answers false *)
(x: false)::x ~= nil (* at at key with false value does not answer nil *)
(x: nil)::x = nil (* at at key with nil value answers nil *)
```

## RegExp -- text type
```
RegExp('ab+c').isRegExp = true
var r = RegExp('ab*c'); [r.test('ac'), r.test('abc')] = [true, true]
var r = RegExp('ab*c', 'g'); 'ab abc ac'.allRegExpMatches(r) = ['abc', 'ac']
RegExp('x.x', 'g').stringLiteral = '/x.x/g'
RegExp('x.x', 'g').source = 'x.x'
RegExp('x.x', 'g').flags = 'g'
RegExp('x.x', 'g').printString.size = 18
'a-b:c'.splitRegExp(RegExp('-|:')) = ['a', 'b', 'c']
```

## Regular Expressions
```
'car'.matchesRegExp('c(a|d)+r')
'cdr'.matchesRegExp('c(a|d)+r')
'caar'.matchesRegExp('c(a|d)+r')
'cadr'.matchesRegExp('c(a|d)+r')
'caddar'.matchesRegExp('c(a|d)+r')
'aabbcc'.matchesRegExp('a+b+c+')
'aabbcc'.matchesRegExp('a+$').not
'aabbcc'.matchesRegExp('^b+c+').not
'aabbcc'.matchesRegExp('a+b+c+')
```

## SequenceableCollection -- collection trait
```
[1, 3, 2] ++ [4, 5] = [1, 3, 2, 4, 5] (* append sequences *)
[1, 3, 2, 4, 5].reversed = [5, 4, 2, 3, 1] (* reverse sequence (anwer new array) *)
[1, 3, 2, 4, 5].sorted = [1, 2, 3, 4, 5] (* sort using default comparison (answer new array) *)
[1, 3, 2, 4, 5].sorted { :i :j | i > j } = [5 .. 1] (* sort using provided comparison (answer new array) *)
[3, 3, 3, 2, 2, 1].sorted.size = 6 (* sort retains duplicates *)
var c = [3, 2, 1]; c.sort ; c = [1, 2, 3] (* sort is in place (mutating) *)
| a = [3, 2, 1]; | a.sort = a (* sort is in place (mutating) *)
| a = [3, 2, 1]; | a.sorted ~= a (* sorted answers a new array *)
var c = [3, 2, 1], r = c.sorted ; c ~= r (* sorted (answer a new array) *)
[1 .. 5].isSorted (* is sequence sorted *)
[1, 3 .. 11].isSorted (* is sequence sorted *)
[11, 9 .. 1].isSortedBy { :i :j | i > j } (* is sequence sorted by predicate *)
[1, 5, 3, 7, 9].isSorted.not (* is sequence sorted *)
[1, 3, 5, 7, 9].copyFromTo(3, 5) = [5, 7, 9] (* copy part of collection (one-indexed) *)
[1, 3, 5, 7, 9].indexOfSubCollection([5, 7, 9]) = 3 (* locate index of subsequence *)
[1, 3, 5, 7, 9].indexOf(5) = 3 (* index of element (compared using =) *)
[1, 3, 5, 7, 9].first = 1 (* first element of *)
[1 .. 9].first(5) = [1 .. 5] (* first n elements of *)
{ [1 .. 9].first(11) }.ifError { :err | true } (* too few elements *)
var a = (1 .. 9); a.first = a[1] (* one-indexed *)
[1, 3, 5, 7, 9].last = 9 (* last element of *)
[1 .. 9].last(5) = [5 .. 9] (* last n elements of *)
{ [1 .. 9].last(11) }.ifError { :err | true } (* too few elements *)
var a = (1 .. 9); a.last = a[9] (* one-indexed *)
[1, 3, 5, 7, 9].middle = 5 (* middle element of *)
[1 .. 4].beginsWith([1, 2]) = true (* is prefix of *)
[1 .. 4].beginsWith([]) = true (* empty prefix *)
var n = 0; [1 .. 4].permutationsDo { :each | n := n + 1}; n = 24 (* permutations *)
[1, 9, 2, 8, 3, 7, 4, 6].pairsCollect { :i :j | i + j } = [10, 10, 10, 10]
var s = ''; [1, 9, 2, 8, 3, 7, 4, 6].pairsDo { :i :j | s := s ++ (i + j).printString }; s = '10101010'
var s = ''; [1, 9, 2, 8, 3, 7, 4, 6].reverseDo { :i | s := s ++ i.printString }; s = '64738291'
[1, 2, 2, 3, 3, 3, 4, 4, 4, 4].withoutDuplicates = [1, 2, 3, 4] (* copy without duplicates, retain order *)
([1, 3 .. 9] ++ [1, 3 .. 9] ++ [2, 4 .. 10] ++ [2, 4 .. 10]).withoutDuplicates = [1, 3, 5, 7, 9, 2, 4, 6, 8, 10]
[1 .. 9].hasEqualElements((1 .. 9))
(1 .. 9).hasEqualElements([1 .. 9])
[1 .. 9] ~= (1 .. 9)
(1 .. 9) ~= [1 .. 9]
[1.5 .. 9.5].middle = 5.5 (* range start need not be an integer *)
var c = [1 .. 5]; c.swapWith(1, 4); c = [4, 2, 3, 1, 5]
{ [1 .. 5].swapWith(1, 9) }.ifError { :err | true }
[1, [2, [3, [4, [5], 6], 7], 8], 9].flatten = [1 .. 9]
[1 .. 9].rotateLeft(3) = ([4 .. 9] ++ [1 .. 3]) (* rotate left *)
[1 .. 9].rotateRight(3) = ([7 .. 9] ++ [1 .. 6]) (* rotate right *)
```

## Sequence arithmetic
```
[1, 3 .. 9] + 9 = [10, 12 .. 18] (* sequence + scalar *)
[1, 3 .. 9] - 9 = [-8, -6 .. 0] (* sequence - scalar *)
[1, 3 .. 9] * 9 = [9, 27 .. 81] (* sequence * scalar *)
[2, 4 .. 8] / 2 = [1 .. 4] (* sequence / scalar *)
9 + [1, 3 .. 9] = [10, 12 .. 18] (* scalar + sequence *)
9 - [1, 3 .. 9] = [8, 6 .. 0] (* scalar - sequence *)
9 * [1, 3 .. 9] = [9, 27 .. 81] (* scalar * sequence *)
72 / [2, 4 .. 8] = [36, 18, 12, 9] (* scalar / sequence *)
[1, 3 .. 9] + [1 .. 5] = [2, 5, 8, 11, 14] (* sequence + sequence *)
[1, 3 .. 9] - [1 .. 5] = [0 .. 4] (* sequence + sequence *)
[1, 3 .. 9] * [1 .. 5] = [1, 6, 15, 28, 45] (* sequence * sequence *)
[1, 6, 15, 28, 45] / [1 .. 5] = [1, 3 .. 9] (* sequence / sequence *)
{ [1 .. 5] + [6 .. 9] }.ifError { :err | true } (* sequences must be of equal size *)
[1 .. 5].squared = [1, 4, 9, 16, 25]
[1, 4, 9, 16, 25].sqrt = [1 .. 5]
```

## Set -- collection type
```
Set().isSet
Set().size = 0
[1, 1, 2, 1, 2, 3].Set.size = 3
[1, 3, 5, 3, 1].Set.isSet = true
[1, 3, 5, 3, 1].Set.size = 3
[1, 3, 5, 3, 1].Set.includes(3) = true
[1, 3, 5, 3, 1].Set.includes(7) = false
[1, 3, 5, 3, 1].Set.Array = [1, 3, 5]
| s = [1 .. 5].Set; | s ~~ s.Set (* A Set formed from a Set is not identical to the initial set *)
| s = [1 .. 5].Set; | s = s.Set (* A Set formed from a Set is equal to the initial set *)
var s = [1, 3, 5, 3, 1].Set; s.remove(3); s.Array = [1, 5]
[1 .. 9].Set.atRandom.betweenAnd(1, 9) (* inclusive *)
var s = Set(); s.add(5); s.includes(5) = true (* add element to Set *)
var s = ['x', 5].Set; var t = s.copy; t.add(5); s = t
var s = [1 .. 4].Set; s.includes(s.atRandom) = true
var s = (1 .. 10).Set; var t = s.collect { :each | (each >= 1).if { each } { 'no' } }; s = t
var s = (1 .. 10).Set.collect { :each | (each >= 5).if { each } { 'no' } }; s = [5, 6, 7, 8, 9, 10, 'no'].Set
var s = (1 .. 10).Set; s.size = s.copy.size
var s = (1 .. 10).Set; var t = s.copy; s.select { :each | t.includes(each).not }.isEmpty
var s = (1 .. 10).Set; var t = s.copy; t.select { :each | s.includes(each).not }.isEmpty
var s = (1 .. 10).Set; var t = s.copyWithout(3); s.size - 1 = t.size
var s = (1 .. 10).Set; s.copyWithout(3).includes(3) = false
var s = (1 .. 10).Set; var t = s.copyWithout(3); s.select { :each | t.includes(each).not } = [3].Set
var s = (1 .. 5).Set; var n = 0; s.do { :each | n := n + each }; n = 15
var s = [].Set; s.addAll(['x', 'y', 'y', 'z', 'z', 'z']); s.size = 3 (* add all elements of an Array to a Set *)
| c = 'xyyzzz'.split, r = Set(); | r.addAll(c); r.size = 3 (* add all characters of a String to a Set *)
| c = 'xyyzzz', r = Set(); | r.addAll(c); r.size = 3 (* add all elements of a String to a Set *)
var s = [].Set; s.addAll([1 .. 99]); s.size = 99
var s = ['x', 5].Set; ['x', 5, 3].collect { :each | s.includes(each) } = [true, true, false]
var s = (1 .. 5).Set; var n = 0; s.do { :each | n := n + each }; n = 15
var s = (1 .. 9).Set; s.intersection(s) = s
(1 .. 4).Set.intersection((5 .. 9).Set) = [].Set
(1 .. 5).Set.intersection((4 .. 9).Set) = [4, 5].Set
var s = (1 .. 9).Set; s.remove(5); [s.includes(5), s.includes(9)] = [false, true]
var s = (1 .. 9).Set; var t = s.copy; var n = t.size; s.removeAll; [s.size = 0, t.size = n] = [true, true]
(1 .. 4).Set.union((5 .. 9)) = (1 .. 9).Set
| s = (1 .. 4).Set, t = (5 .. 9), u = s.union(t); | u.size = (s.size + t.size) (* union is not mutating *)
(1 .. 5).Set.ifAbsentAdd(3) = false
[1 .. 9].Set.select { :each | false } = [].Set (* select nothing *)
```

## SmallFloat -- numeric type
```
3.141.typeOf = 'SmallFloat'
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
3.max(7) = 7.max(3)
7.min(3) = 3
3.min(7) = 7.min(3)
12345.truncateTo(600) = 12000
23.isPrime = true
2971215073.isPrime = true
2971215073.nextPrime = 2971215083 & { 2971215083.isPrime }
100.primesUpTo = [2, 3, 5, 7,11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]
35.isCoprime(64)
1173.isCoprime(1547).not
13.betweenAnd(11, 14) = true
9.atRandom.isInteger = true
9.randomInteger.isInteger = true
9.randomFloat.isInteger = false
pi.randomFloat.isInteger = false
[3.141.json, 23.json] = ['3.141', '23']
['3.141', '23'].collect(parseJson:/1) = [3.141, 23]
| r | 5.do { :each | r := each }; r = 5
| r | 0.do { :each | r := each }; r = nil
1.toDo(0) { :each | 'toDo'.error }; true (* end less than start *)
'3.141'.parseNumber = 3.141
'23'.parseInteger(10) = 23
-1.5.ceiling = -1
-9.quotient(4) = -2
-0.9.quotient(0.4) = -2
9.remainder(4) = 1
-9.remainder(4) = -1
0.9.remainder(0.5) = 0.4
(1 .. 99).select(isPrime:/1) = [2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97]
(1 .. 999).select(isPrime:/1).size = 168
(1 .. 9999).select(isPrime:/1).size = 1229
315.primeFactors = [3, 3, 5, 7]
2588.primeFactors = [2, 2, 647]
(2 .. 30).select { :each | each.primeFactors.max <= 5 } = [2, 3, 4, 5, 6, 8, 9, 10, 12, 15, 16, 18, 20, 24, 25, 27, 30]
(2 .. 15).select { :each | each.primeLimit <= 5 } = [2, 3, 4, 5, 6, 8, 9, 10, 12, 15]
60.divisors = [1, 2, 3, 4, 5, 6, 10, 12, 15, 20, 30, 60]
1729.divisors = [1, 7, 13, 19, 91, 133, 247, 1729]
e() = 1.exp
epsilon() < (10 ** -15)
epsilon() > (10 ** -16)
inf.isFinite = false
pi.isFinite = true
{ nil.isFinite }.ifError { :err | true }
5.closeTo(5) = true
5.closeTo('5') = false
5.closeTo(3) = false
(5/3).closeTo(5/3) = true
(1/3).closeTo(0.3333) = true
(1/3).closeTo(0.333) = false
[-1000000000000000, -100, -5, -3, -2, -1, 0, 1].select(isPrime:/1).isEmpty
[17, 78901, 104729, 15485863, 2038074743].allSatisfy(isPrime:/1)
[561, 2821, 6601, 10585, 15841, 256, 29996224275831].noneSatisfy(isPrime:/1)
1.00001.reduce = 1 (* round if number is closeTo an integer *)
1.5.reduce = 1.5 (* identity if number is not closeTo an integer *)
| x = (2 ** 54); | x ~= (x - 1) = false (* large numbers behave strangely *)
| x = (2.0 ** 54.0); | x ~= (x - 1.0) = false (* large numbers behave strangely *)
```

## SortedArray -- collection type
```
SortedArray().isSortedArray (* sorted array *)
SortedArray().species = SortedArray:/0 (* species is sorted array *)
SortedArray().size = 0 (* query size *)
var a = SortedArray(); a.add(3); a.add(1); a.add(2); a.contents = [1 .. 3] (* add inserts items into sequence *)
var a = [3, 1].SortedArray; a.add(2); a.contents = [1 .. 3] (* sorted array from array *)
var a = [7, 5 .. 1].SortedArray; a.addAll([8, 6 .. 2]); a.contents = [1 .. 8] (* add all elements of collection into sequence *)
var a = [9 .. 1].SortedArray; a.collect { :x | 9 - x }; a.contents = [1 .. 9] (* collect into ordered collection *)
var a = [1 .. 9].SortedArray(greaterThan:/2); a.contents = [9 .. 1] (* sorted array with specified sort procedure *)
var a = [5 .. 9].SortedArray(greaterThan:/2); a.addAll([1 .. 4]); a.contents = [9 .. 1]
```

## String -- text type
```
'quoted string'.isString (* quoted string *)
'x' ++ 'y' = 'xy' (* append (catenation) *)
'string'.isAscii = true (* does string contain only ascii characters *)
'string'.ascii = [115, 116, 114, 105, 110, 103].ByteArray (* String to ByteArray of Ascii encoding *)
{ 'Mačiūnas'.ascii }.ifError { :err | true } (* non-ascii characters *)
'3.4'.asNumber = 3.4 (* parse float *)
'3'.asInteger = 3 (* parse integer *)
'string'.at(4) = 'i'.Character (* one-indexing *)
'string'[4] = 'i'.Character (* one-indexing (bracket notation) *)
''.isEmpty = true (* empty string predicate *)
'string'.isEmpty = false (* is empty string *)
'string'.size = 6 (* length *)
['m', 'ss', 'ss', 'pp', ''].join = 'msssspp' (* join *)
[].join = '' (* join of empty sequence is the empty string *)
['m', 'ss', 'ss', 'pp', ''].joinSeparatedBy('i') = 'mississippi' (* join using string *)
'mississippi'.splitBy('i') = ['m', 'ss', 'ss', 'pp', ''] (* split at string *)
'str ing'.splitBy(' ') = ['str', 'ing'] (* split at char *)
'a b=2'.splitBy(' ').collect { :e | e.splitBy('=') }[2][2] = '2' (* split as parser *)
'string'.splitBy('ing') = ['str', '']
'string'.splitBy('trin') = ['s', 'g']
'string'.splitBy('absent') = ['string']
'string'.splitBy('') = ['s', 't', 'r', 'i', 'n', 'g']
'mississippi'.split.join = 'mississippi' (* join is the inverse of split *)
'mississippi'.splitBy('i').joinSeparatedBy('i') = 'mississippi' (* joinSeparatedBy is the inverse of splitBy *)
'a' < 'b' = true (* string comparison *)
'text'.copyFromTo(2, 3) = 'ex' (* substring, one indexed *)
'text'.copyFromTo(3 ,3) = 'x' (* substring (single character) *)
{ 'string'.add('!') }.ifError { :err | 'oh oh...' } = 'oh oh...' (* strings are immutable *)
'quoted string with \'escaped\' quote characters'.words[4].copyFromTo(2, 8) = 'escaped'
'string'.utf8 = 'string'.ascii (* Utf-8 is a superset of ascii *)
'øéஃî'.utf8 = [195, 184, 195, 169, 224, 174, 131, 195, 174].ByteArray (* unicode *)
'Mačiūnas'.utf8 = [77, 97, 196, 141, 105, 197, 171, 110, 97, 115].ByteArray (* Utf-8 encoding *)
'Mačiūnas'.size = 8
'Mačiūnas'.utf8.size = 10
'Mačiūnas'.utf16 = [77, 97, 269, 105, 363, 110, 97, 115] (* Utf-16 encoding *)
'Mačiūnas'.utf16.size = 8
'string'.allButFirst = 'tring' (* all but first character of a String *)
'string'.allButFirst(4) = 'ng' (* all but first n characters of a String *)
''.typeOf = 'String' (* type of String *)
''.size = 0 (* the empty String has size zero *)
'x'.asString = 'x' (* asString at String is identity *)
'x'.asString.size = 1
'x'.printString.size = 3
1.asString = '1'
'ascii'.ascii = [97, 115, 99, 105, 105].ByteArray
'€'.utf8 = [226, 130, 172].ByteArray (* Utf-8 encoding of String as ByteArray *)
[226, 130, 172].ByteArray.utf8 = '€' (* String from Utf-8 encoded ByteArray *)
'€'.utf8.utf8 = '€' (* decode and encode Utf-8 *)
'ascii'.ascii = 'ascii'.utf8
'ascii'.ascii.ascii = 'ascii' (* decode and encode Ascii *)
{ '€'.ascii }.ifError { :err | true }
'the quick brown fox jumps'.includesSubstring('') = true
'the quick brown fox jumps'.includesSubstring('fox') = true
'the quick brown fox jumps'.includesSubstring('fix') = false
'the quick brown fox jumps'.findString('fox') = 17 (* index of sub-string *)
'the quick brown fox jumps'.findString('rat') = 0 (* index of sub-string, zero indicates absence *)
'the quick brown fox jumps'.findStringStartingAt('fox', 1) = 17
'the quick brown fox jumps'.copyFromTo(17, 19) = 'fox'
['the', 'quick', 'brown', 'fox'].joinSeparatedBy(' ') = 'the quick brown fox'
['the', 'quick', 'brown', 'fox'].join = 'thequickbrownfox'
'the quick brown fox jumps'.splitBy(' ') = ['the', 'quick', 'brown', 'fox', 'jumps']
'string'.splitBy('') = ['s', 't', 'r', 'i', 'n', 'g']
'once at end'.occurrencesOf('d') = 1
'abracadabra'.occurrencesOf('a') = 5
'once at end'.indicesOf('d') = [11]
'abracadabra'.indicesOf('a') = [1, 4, 6, 8, 11]
'turramurra'.occurrencesOf('urra') = 2
'turramurra'.indicesOf('urra') = [2, 7]
'sum:/1'.splitBy(':/') = ['sum', '1']
'ascii'.toUppercase = 'ASCII'
'ASCII'.toLowercase = 'ascii'
`x` = 'x' (* backtick quotes *)
`"x"` = '"x"'
`x` = 'x'.parseBacktickQuotedString
"x" = 'x' (* double quotes *)
"x" = 'x'.parseDoubleQuotedString
'string'[3] = 'r'.Character (* string indexing *)
{ 'string'[3] := nil }.ifError { :err | true } (* strings are immutable *)
'{"x": 3.141, "y": 23}'.parseJson = (x: 3.141, y: 23)
{ '_'.parseJson }.ifError { :err | true }
'a text string'.json = '"a text string"'
'"a text string"'.parseJson = 'a text string'
'string'.first = 's'.Character
'string'.last = 'g'.Character
var x = ['a', 'bc', 'def']; x.unlines.lines = x
'3 + 4'.evaluate = 7
'a short string'.replace('short', 'longer') = 'a longer string'
'x x x'.replace('x', 'y') = 'y x x'
'x x x'.replaceAll('x', 'y') = 'y y y'
'A Bc Def'.replaceAll(' ', '') = 'ABcDef'
'x y z'.replaceRegExp(RegExp('x|z', 'g'), '-') = '- y -'
'Word'.asLowercase = 'word'
'Word'.asUppercase = 'WORD'
'word'.capitalized = 'Word'
'testAt'.beginsWith('test') = true
'testAt'.beginsWith('At') = false
{ 'testAt'.beginsWith(nil) }.ifError { :err | true }
'testAt'.endsWith('test') = false
'testAt'.endsWith('At') = true
{ 'testAt'.endsWith(nil) }.ifError { :err | true }
['a','b','','c'].unlines.paragraphs.collect(lines:/1) = [['a', 'b'], ['c']]
'string'.at(3) = 'r'.Character (* string indexing *)
var s = 'string'; [s[2], s[4], s[5]].joinCharacters = 'tin' (* string subscripting *)
' x '.withBlanksTrimmed = 'x'
' x '.withoutLeadingBlanks = 'x '
' x '.withoutTrailingBlanks = ' x'
| a = []; | 'string'.do { :each | a.add(each) }; a.joinCharacters = 'string'
'𠮷'.countCharacters = 1
'𠮷'.countUtf16CodeUnits = 2
'𠮷'.size = 2
'𠮷'.isSingleCharacter = true
'𠮷'.characterArray = ['𠮷'.Character]
'𠮷'.codePointAt(1) = 134071
'𠮷'.codePointAt(2) = 57271
'𠮷'.codePointArray = [134071]
'𠮷'.isInBasicMultilingualPlane = false
'𠮷'.isWellFormed = true
{ '𠮷'.ascii }.ifError { :err | true } (* non-ascii character *)
'𠮷'[1] = '𠮷'.Character
{ '𠮷'[2] }.ifError { :err | true } (* lone surrogate *)
```

## Syntax -- array assignment syntax
```
| [x, y, z] = [1, 2, 3]; | [z, y, x] = [3, 2, 1] (* temporaries array initialisation syntax *)
| [x, y, z] = [1 * 2, 3 * 4, 5 * 6]; | [z, y, x] = [30, 12, 2] (* temporaries array initialisation syntax *)
var [x, y, z] = [1, 2, 3]; [z, y, x] = [3, 2, 1] (* temporaries var array initialisation syntax *)
| x y z | [x, y, z] := [1, 2, 3]; [z, y, x] = [3, 2, 1] (* variables array assignment syntax *)
| x y z | [x, y, z] := [1 * 2, 3 * 4, 5 * 6]; [z, y, x] = [30, 12, 2](* variables array assignment syntax *)
| x = 1, y = 2; | x := y + 1; y := x * 2; [x, y] = [3, 6] (* in sequential assignment evaluation and assignment are interleaved *)
| [x, y] = [1, 2]; | [x, y] := [y + 1, x * 2]; [x, y] = [3, 2] (* in array assignment the rhs expression is evaluated before any assignments *)
| x = 1, y = 2, xTmp = nil; | xTmp := y + 1; y := x * 2; x := xTmp; [x, y] = [3, 2]
| [x, y, z] = [1, 2, 3]; | [x, y, z] := [x * y + z, x + y * z, x + y + z]; [x, y, z] = [5, 9, 6]
| x = 1, y = 2, z = 3, x1 = nil, y1 = nil, z1 = nil; | x1 := x * y + z; y1 := x + y * z; z1 := x + y + z; x := x1; y := y1; z := z1; [x, y, z] = [5, 9, 6]
| x = 1, y = 2, z = 3; | x := x * y + z; y := x + y * z; z := x + y + z; [x, y, z] = [5, 21, 29]
```

## Syntax -- collection access and mutation
```
'text'[3] = 'x'.Character (* c[k] is syntax for c.at(k) *)
var x = [1 .. 5]; x[3] := '3'; x[3] = '3' (* c[k] := v is syntax for c.atPut(k, v) *)
```

## Syntax -- dictionary literals
```
(x: 1, y: 2) = ['x' -> 1, 'y' -> 2].Record (* (x: 1, ...) is dictionary syntax *)
() = [].Record (* empty dictionary *)
(x: 1, y: 2).printString = '(x: 1, y: 2)' (* Record print string *)
```

## Syntax -- temporaries
```
| x | x = nil (* | x | decalares the temporary x *)
var x = 1, y = 2; [x, y] = [1, 2] (* var x, y; == | x y | *)
var x = 1; var y = 2, z = 3; [x, y, z] = [1, 2, 3] (* there can be multiple var sequences *)
```

## Syntax -- trailing procedures
```
1.to(9).collect { :x | x * x }.last = 81
(1 .. 9).collect { :x | x * x }.last = 81
(1 .. 9).collect { :x | x * x }.collect { :x | x * x }.last = 6561
[1, 3, 5].withCollect([1, 3, 5]) { :p :q | p -> q } = [1 -> 1, 3 -> 3, 5 -> 5]
[1, 3, 5].reversed.withCollect([1, 3, 5]) { :p :q | p -> q } = [5 -> 1, 3 -> 3, 1 -> 5]
```

## Syntax -- type field mutation
```
var a = 'one' -> 1; a.key := 9; a.key = 9 (* p.x := y is syntax for p.x(y) *)
```

## Syntax -- whitespace
```
{:x|x+1}.(1)=2 (* no white space *)
{ :x | x + 1 } . ( 1 ) = 2 (* white space (space) *)
{	:x	|	x	+	1	}	.	(	1	)	=	2 (* white space (tab) *)
```

## Temporaries
```
| x | x = nil (* uninitialised variables are nil *)
| x y | x = y (* uninitialised variables are nil *)
| x = 1, y = 2; | x < y (* initialisers are written as name = value *)
```

## TimeStamp -- temporal type
```
1676784053576.TimeStamp.printString = 'TimeStamp(1676784053576)'
1676784053576.TimeStamp.iso8601 = '2023-02-19T05:20:53.576Z'
system.unixTime.isTimeStamp = true
system.unixTime.iso8601.size = 24
var t = system.unixTime; t - 0.seconds = t
{ system.unixTime.postLine }.evaluateAfter(0.5.seconds).cancel = nil
{ system.unixTime.postLine }.evaluateAt(system.unixTime + 0.5.seconds).cancel = nil
{ system.unixTime.postLine }.evaluateEvery(3.seconds).cancel = nil
```

## System -- system type
```
system.typeOf = 'System'
system.typeDictionary.keys.includes('System') = true
system.randomFloat < 1
system.uniqueId ~= system.uniqueId
'!'.isOperatorName = true
'*'.operatorMethodName = 'times'
'!^'.operatorMethodName = 'bangHat'
```

## System -- categoryDictionary
```
system.categoryDictionary.isDictionary = true
system.categorizeAll('accessing', ['at', 'atPut', 'first', 'key', 'last', 'value']) = nil
system.isCategoryName('accessing') = true
system.category('accessing').isSet = true
system.categoriesOf('at').includes('accessing') = true
system.categoriesOf('notInCategorySystem') = []
system.isCategorized('at') = true
system.isCategorized('notInCategorySystem') = false
system.categorizeAll('Collections/Abstract', ['ArrayedCollection', 'Collection', 'SequenceableCollection']) = nil
'Collections/Abstract'.categoryNameParts = ['Collections', 'Abstract']
system.categoryOf('at') = 'accessing'
system.categoryOf('notInCategorySystem') = '*Uncategorized*'
```

## System -- methodDictionary
```
system.methodDictionary.isDictionary = true
system.methodDictionary::collect.isDictionary = true
system.methodDictionary::collect[2].isDictionary = true
system.methodDictionary::collect[2]::Array.isMethod = true
system.methodDictionary.includesKey('collect') = true
system.allMethods.collect { :each | each.signature }.includes('@Collection>>sum:/1') = true
'@Collection>>sum:/1'.parseMethodSignature = ['@Collection', 'sum:/1']
'@Collection'.parseQualifiedTraitName = 'Collection'
system.methodLookupAtType('collect', 2, 'Array').isMethod = true
system.methodImplementations('sum').collect { :each | each.origin.name }.includes('Interval') = true
system.methodSignatures('add').includes('Map>>add:/2') = true
system.methodLookupAtSignature('@Collection>>sum:/1').isMethod = true
system.methodLookupAtType('sum', 1, 'Array').sourceCode = '{ :self |\n\t\tself.reduce(plus:/2)\n\t}'
system.methodTypes('last:/1').includes('Interval') = true
system.multipleArityMethodList.includes('randomFloat') = true
system.onlyZeroArityMethodList.includes('PriorityQueue') = true
system.doesTraitImplementMethod('Collection', 'select') = true
system.doesTypeImplementMethod('Array', 'adaptToNumberAndApply') = true
[1, 2, 3].respondsTo(select:/2) = true
system.methodPrintString('add').size >= 3
system.methodLookupAtType('collect', 2, 'Array').isMethod = true
system.methodLookupAtType('collect', 2, 'Array').origin.name = 'ArrayedCollection'
system.methodLookupAtType('collect', 2, 'Array').procedure . ([3, 4, 5], { :x | x * x }) = collect([3, 4, 5], { :x | x * x })
system.methodLookupAtType('sum', 1, 'Array') == system.methodLookupAtType('sum', 1, 'Set')
'sum:/1'.parseQualifiedMethodName = ['sum', 1]
```

## System -- time
```
system.systemTimeInMilliseconds > 0 = true
system.unixTimeInMilliseconds > 1671935015392 = true
```

## System -- traitDictionary
```
system.traitDictionary.isDictionary = true
system.traitDictionary.includesKey('Collection') = true
system.traitTypes('Collection').includes('Array') = true
system.typeTraits('Array').includes('ArrayedCollection') = true
system.methodTraits('atRandom:/1').includesAllOf(['Collection', 'SequenceableCollection']) = true
system.methodTraits('sum:/1') = ['Collection']
system.traitTypes('Object').includes('SmallFloat') = true
system.traitLookup('Object').methodDictionary.includesKey('respondsTo:/2') = true
system.traitLookup('Collection').isTrait = true
system.traitLookup('Collection').name = 'Collection'
system.traitLookup('Collection').methodDictionary.includesKey('sum:/1') = true
system.traitLookup('Collection').methodDictionary::sum:/1.isMethod = true
system.traitTypes('Collection').includes('Array') = true
system.traitTypes('Dictionary').includes('Map') = true
system.traitDictionary['Dictionary'].isTrait = true
```

## System -- typeDictionary
```
system.typeDictionary.isDictionary = true
system.typeDictionary.keys.includes('Array') = true
system.typeDictionary.includesKey('Array') = true
system.typeDictionary::Array.isType = true
system.typeDictionary::Array.traitNameArray.includes('Collection') = true
system.typeDictionary::Association.slotNameArray = ['key', 'value']
system.typeDictionary::Association.methodDictionary.keys.includes('equals:/2')
system.typeDictionary::Association.methodDictionary.includesKey('key:/1') = true
system.typeDictionary::Nil.methodDictionary.includesKey('ifNil:/2') = true
system.typeMethods('Association').select { :each | each.name = 'copy' }.size = 1
system.typeMethods('Association').collect(name:/1).includes('copy') = true
system.typeLookup('Array').isType = true
system.typeLookup('Array').name = 'Array'
system.typeLookup('Array').methodDictionary.includesKey('copy:/1') = true
system.typeLookup('Array').methodDictionary::copy:/1.isMethod = true
system.typeMethodSet('Array').collect(name:/1).includes('select') = true
system.typeLookup('String').isType = true
system.typeLookup('String').methodDictionary.includesKey('includesSubstring:/2') = true
system.typeLookup(4:3.typeOf).slotNameArray = ['numerator', 'denominator']
```

## System -- URL
```
'http://cern.ch/'.URL.isURL = true
'http://cern.ch/'.URL.hostname = 'cern.ch'
'http://cern.ch/'.URL.port = ''
'http://cern.ch/'.URL.protocol = 'http:'
```

## System -- URLSearchParams
```
'x=3.141&y=23'.URLSearchParams.has('x') = true
'x=3.141&y=23'.URLSearchParams.get('y') = '23'
```
