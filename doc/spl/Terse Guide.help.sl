# Terse Guide

## Arithmetic expressions
```
6 + 3 = 9 (* addition *)
6.plus(3) = 9 (* addition *)
[0 + 0, 1 + 0, 0 + 1, 1 + 1, -1 + 1, -1 + 2] = [0, 1, 1, 2, 0, 1] (* addition *)
6 - 3 = 3 (* subtraction *)
6.minus(3) = 3 (* subtraction *)
[1 - 0, 0 - 1, 2 - 1] = [1, -1, 1] (* subtraction *)
6 * 3 = 18 (* multiplication, unicode = × *)
6.times(3) = 18 (* multiplication *)
[1 * 0, -1 * 1, 5 * -5, -3 * -4] = [0, -1, -25, 12] (* multiplication *)
9 / 3 = 3 (* division, unicode = ÷ *)
9.dividedBy(3) = 3 (* division *)
[36 / 6, -10 / 2, 20 / -5, -5 / -5] = [6, -5, -4, 1] (* division *)
9 // 3 = 3 (* integer division *)
9.dividedByDividedBy(3) = 3 (* integer division *)
[1 // 1, 3 // 2, 4 // -2, -6 // 3, -12 // -4] = [1, 1, -2, -2, 3] (* integer division *)
1 + 2 * 3 = 9 (* evaluation always left to right, operators equal precedence *)
3 * 2 + 1 = 7 (* evaluation always left to right, operators equal precedence *)
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
[10 % 3, 10 % -3, -10 % 3, -10 % -3, 10 % 5] = [1, -2, 2, -1, 0] (* modulo *)
(0 .. 9).collect { :i | i % 5 } = [0, 1, 2, 3, 4, 0, 1, 2, 3, 4]
[10 % 5, -4 % 3, 4 % -3, -4 % -3] = [0, 2, -2, -1] (* modulo, negative operands *)
13 % 7 % 4 = 2 (* left assocative *)
13 + 1 % 7 = 0 (* equal precedence *)
-5 = 5.negated (* unary minus *)
5.sign = 1 (* numeric sign, positive->1 *)
[-9, 0, 9].collect(sign:/1) = [-1, 0, 1] (* numeric sign, -1 or 0 or 1 *)
[-9, 0, 9].collect(signBit:/1) = [1, 0, 0] (* numeric sign, 1 for negative else 0 *)
5.sign(-1) = -5 (* answer number with sign of argument *)
-1.copySignTo(5) = -5 (* answer argument with sign of number *)
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
2.sqrt.squared ~ 2 (* almost equal to, or similar to, unicode = ≈ *)
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
3.1479.roundDownTo(0.01) = 3.14 (* round down to *)
3.1479.roundDownTo(0.1) = 3.1
1923.roundDownTo(10) = 1920
3.1479.roundDownTo(0.005) = 3.145
-3.1479.roundDownTo(0.01) = -3.15
[-4, -3, -2.9, -2, -1, -0.9, 0, 0.9, 1, 2, 2.9, 3, 4].collect { :each | each.roundDownTo(2) } = [-4, -4, -4, -2, -2, -2, 0, 0, 0, 2, 2, 2, 4]
3.99.floor = 3 (* round down *)
3.99.ceiling = 4 (* round up *)
5.factorial = 120 (* factorial of SmallFloat *)
18.factorial = 6402373705728000 (* large small integer factorial *)
20.factorial = 2432902008176640000 (* large small float factorial *)
20.factorial.isSmallInteger = false (* 20! is not a small integer *)
20n.factorial = 2432902008176640000n (* large integer factorial *)
(0 .. 9).collect(factorial:/1) = [1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880]
{ -1.factorial }.ifError { true } (* factorial is not defined for negative integers *)
9.factorial = (1 .. 9).product (* factorial is product of interval *)
12.factorial.log2.floor = 28 (* bit-depth of factorial *)
[12, 18, 20, 100, 170].collect { :each | each.factorial.log2.floor } = [28, 52, 61, 524, 1019]
9.doubleFactorial = 945 (* double factorial *)
[12, 18, 20].collect { :n | n.doubleFactorial } = [46080, 185794560, 3715891200]
[12, 18, 20].collect { :n | n.doubleFactorial.log2.floor } = [15, 27, 31]
(0, 2 .. 14).collect(doubleFactorial:/1) = [1, 2, 8, 48, 384, 3840, 46080, 645120]
(1, 3 .. 13).collect(doubleFactorial:/1) = [1, 3, 15, 105, 945, 10395, 135135]
14.doubleFactorial = (2, 4 .. 14).product (* double factorial is product of equal parity interval *)
13.doubleFactorial = (1, 3 .. 13).product (* double factorial is product of equal parity interval *)
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
[0, 45, 90, 180].collect(degreeSin:/1) = [0, 0.7071067811865475, 1, 0] (* sine given angle in degree *)
[0, 45, 90, 180].collect(degreeCos:/1) = [1, 0.7071067811865475, 0, -1] (* cosine given angle in degree *)
2.sqrt / 2 = 0.7071067811865476
2.sqrt / 2 = 0.5.sqrt
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
{ 1.atan2(nil) }.ifError { true } (* operand not adaptable to number *)
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
inf.sign = 1
inf.positive = true
(0 - inf).sign = -1
(0 - inf).negative = true
8.isPowerOfTwo (* is the receiver a power of two *)
(1 .. 999).select(isPowerOfTwo:/1) = [1, 2, 4, 8, 16, 32, 64, 128, 256, 512]
(2 ** 30).isPowerOfTwo = true (* this is only reliable for numbers that can be represented in 32-bits *)
(2 ** 30 - 1).isPowerOfTwo = false
127.asLargerPowerOfTwo = 128 (* next power of two that is not less than the receiver *)
[1, 2, 4, 8, 16, 32, 64, 128, 256].collect { :each | (each + 1).asLargerPowerOfTwo } = [2, 4, 8, 16, 32, 64, 128, 256, 512]
129.asSmallerPowerOfTwo = 128 (* next power of two that is not greater than the receiver *)
[2, 4, 8, 16, 32, 64, 128, 256, 512].collect { :each | (each - 1).asSmallerPowerOfTwo } = [1, 2, 4, 8, 16, 32, 64, 128, 256]
300.asPowerOfTwo = 256 (* next smaller power of two *)
25.sqrt = 5 (* integer sqrt *)
(2 / 4) * 2 = 1 (* integer division *)
2 * (2 / 4) = 1 (* integer division *)
| x = 10 ** -7, nearest = 10 ** -8, furthest = 0; | (x - nearest).abs < (x - furthest).abs & { (x ~ furthest) ==> { (x ~ nearest) } }
-1 !~ 1 (* negative one is not close to one *)
1 !~ inf (* one is not close to inifinity *)
inf ~ inf (* being equal, infinty is also close to itself *)
1:3 ~ (1 / 3) (* a fraction is close to it's floating point representation *)
0 ~ epsilon & { epsilon ~ 0 } & { 1 + epsilon ~ 1 } (* ε is ≈ zero ∧ ≈ is a symmetric operator ∧ one plus ε is ≈ one *)
| n = 10 ** -9; | 0 ~ n & { n ~ 0 } & { 1 + n ~ 1 }
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
Array(5, 0) = [0, 0, 0, 0, 0] (* array can have slots initialised to a value *)
Array([]) = [] (* Array constructor, empty array *)
| a = [1 .. 9]; | a.copy ~~ a (* copy does not answer argument *)
| a = [1 .. 9]; | a.Array == a (* Array answers the receiver if it is an array *)
1.toArray = [1].toArray (* enclose a non-collection in an array *)
(1 .. 3).toArray = [1 .. 3] (* at collections behaves as Array *)
| a = [1 .. 3]; | a.toArray == a (* an array is already an array *)
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
[1, 2, 3, 5, 7, 9].sum = 27 (* sum of elements, unicode = Σ *)
[1, 2, 3, 5, 7, 9].reduce { :a :b | a + b } = 27 (* reduce by plus is sum *)
[1 .. 4].reduce { :sum :each | sum + each } = 10 (* sum is first argument, element is second *)
[1, 2, 3, 5, 7, 9].reduce(plus:/2) = 27 (* reduce by plus is sum *)
[1, 4, 2, 3, 5].reduce(min:/2) = 1 (* reduce by min is min *)
[1, 4, 2, 3, 5].reduce(max:/2) = 5 (* reduce my max is max *)
{ [].reduce { :a :b | a + b } }.ifError { true } (* cannot reduce empty collection *)
{ [].reduce { :sum :each | sum + each } }.ifError { true } (* error if the collection is empty *)
[1].reduce { :a :b | nil } = 1 (* reduce one-element collection *)
[1, 2, 3, 5, 7, 9].injectInto(0, plus:/2) = 27
[1, 2, 3, 5, 7, 9].product = 1890 (* product, unicode = Π *)
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
[].noneSatisfy(odd:/1) = true (* empty collection answers true *)
[1, 3, 5, 7, 9].noneSatisfy(even:/1) = true (* no odd number is even *)
[1, 2, 3, 4, 5].noneSatisfy(odd:/1) = false (* one is odd *)
[1, 2, 3] ++ [4, 5, 6] = [1 .. 6] (* addAllLast, answering new like collection, unicode = ⧺ *)
| a = [1, 2, 3]; | a.addAllLast([4, 5, 6]); a = [1 .. 6]
| a = [1, 2, 3], b = a ++ [4, 5, 6]; | a ~~ b & { a = [1 .. 3] } & { b = [1 .. 6] }
{ [1, 2, 3] ++ 4 }.ifError { true } (* right hand side must be a collection *)
plusPlus([1, 2, 3], [4, 5, 6]) = [1, 2, 3, 4, 5, 6] (* ++ equals plusPlus *)
[[1, 2, 3], [4, 5, 6], [7, 8, 9]].concatenation = [1 .. 9] (* concatenation, unicode = ⧻ *)
[[1, 2, 3], [4, 5], [6]].concatenation = [1, 2, 3, 4, 5, 6]
| a = [1, 2, 3]; | a[2] = a.at(2)
[1 .. 5].includesIndex(3) (* is valid index *)
[1 .. 5].atIfPresent(3) { :x | x * x } = 9 (* clause if index is valid *)
[1 .. 5].atIfPresent(9) { :x | false } = nil (* ifAbsent clause answers nil *)
[1 .. 5].atIfAbsent(9) { true } (* exception clause if index is invalid *)
[1 .. 5].atIfPresentIfAbsent(9) { :x | false } { true } (* ifPresent and ifAbsent clauses *)
[1 .. 5].atIfPresentIfAbsent(3) { :x | x * x } { false } = 9 (* ifPresent and ifAbsent clauses *)
| a = [1, 2, 3]; | a.atPut(2, 'two') = 'two' & { a = [1, 'two', 3] } (* atPut answers value put *)
| a = [1, 2, 3]; | (a[2] := 'two') = 'two' & { a = [1, 'two', 3] }
| a = [1, 2, 3]; | a.atModify(2, squared:/1) = 4 & { a = [1, 4, 3] } (* modify value at index *)
[5, 4, 3, 2, 1].detect { :each | each % 2 = 0 } = 4
{ [5, 4, 3, 2, 1].detect { :each | each % 7 = 0 } }.ifError { true }
[5, 4, 3, 2, 1].detect { :each | each * 2 <= 4 } = 2 (* find first element matching predicate *)
[5, 4, 3, 2, 1].detectIfNone { :each | each % 7 = 0 } { nil } = nil (* nil if no element is found *)
[5, 4, 3, 2, 1].findFirst { :each | each % 3 = 0 } = 3 (* answer index of first element matching predicate *)
[5, 4, 3, 2, 1].findFirst { :each | each % 7 = 0 } = 0 (* zero if no element is found *)
[[1, 2, 3, 4], [5, 6, 7, 8]].transpose = [[1, 5], [2, 6], [3, 7], [4, 8]]
1.toAsCollect(9, Array:/1) { :each | each * each } = [1, 4, 9, 16, 25, 36, 49, 64, 81]
| a = [1 .. 9]; | a.shuffle; a ~= [1 .. 9] (* shuffle in place, using system Random *)
| a = [1 .. 9], r = Random(13579); | a.shuffleBy(r); a = [9, 8, 2, 3, 5, 7, 1, 4, 6] (* shuffle in place, using given Random *)
| a = [1 .. 9]; | a.shuffled ~= a & { a = [1 .. 9] } (* answer shuffled copy *)
[1 .. 9].shuffled.sorted = [1 .. 9] (* resort after shuffle *)
[].shuffled = []
13.fibonacciArray = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233]
'3'.replicate(3) = ['3', '3', '3']
[1, 2, 3, 4, 3, 2, 1].detectMax(identity:/1) = 4
[(1 .. 3), (1 .. 6), (1 .. 9)].detectMax(size:/1) = (1 .. 9)
[(1 .. 3), (1 .. 6), (1 .. 9)].detectMin(size:/1) = (1 .. 3)
['1', '2', '3', '4', '5'].indexOf('3') = 3 (* index of first occurrence of element in sequence *)
[9 .. 1].indexOf(3) = 7 (* index of first occurrence of element in sequence *)
[1, 2, 3, 2, 3].indexOf(3) = 3 (* first of multiple occurrences *)
[1, 2, 3, 2, 3].indexOf(4) = 0 (* or zero *)
[1, 2, 3, 2, 3].indexOfIfAbsent(4) { true }
[1, 2, 3, 2, 3].lastIndexOf(3) = 5 (* index of last occurrence of element in sequence *)
[1, 2, 3, 2, 3].lastIndexOf(4) = 0 (* or zero *)
[1, 2, 3, 2, 3].lastIndexOfIfAbsent(4) { true }
[9 .. 1].includes(3) = true (* decide if a collection includes an element, unicode = ∋ *)
[1 .. 9].includes(9) (* an array includes its last element *)
[1 .. 7].doesNotInclude(9) (* decide if a collection does not include an element, unicode = ∌ *)
[9 .. 1].anySatisfy { :each | each = 3 } = true
[].includes(3) = false (* the empty collection does not include any element *)
[9 .. 1].includesAllOf([3 .. 7]) = true
[5 .. 3].includesAllOf([3 .. 7]) = false
[].includesAllOf([3 .. 7]) = false
Array(5).fillWith(negated:/1) = [-1 .. -5] (* fill array with answers of a block applied to each index *)
| r = Random(12345); | Array(5).fillWith { r.randomInteger(9) } = [8, 5, 9, 9, 4] (* block is applied using cull *)
| r = Random(12345), f = { r.randomInteger(9) }; | Array(5).fillWith(f:/0) = [8, 5, 9, 9, 4] (* block is applied using cull *)
Array(5).fillFromWith([1 .. 5], negated:/1) = [-1 .. -5]
| a = Array(5); | a.fillFromWith([1, 3, 5, 7, 9], squared:/1); a = [1, 9, 25, 49, 81]
| a = Array(4); | [1, 3, 5, 7].collectInto({ :each | each * each}, a); a = [1, 9, 25, 49]
[1, 2, 3, 4, 3, 2, 1].occurrencesOf(3) = 2 (* number of occurrences of element in collection *)
| a = [1, 2], [x, y] = a; | [y, x] = [2, 1]
| i = (1 .. 9), [x, y, z] = i; | [z, y, x] = [3 .. 1]
| [x, y] = { | n = system.randomFloat; | [n, n] }.value; | x = y
[1, 3 .. 9] = [1, 3, 5, 7, 9]
[9, 7 .. 1] = [9, 7, 5, 3, 1]
[1 .. 3].printString = '[1, 2, 3]' (* array print string *)
[1 .. 3].storeString = '[1, 2, 3]' (* array store string *)
[-1, 2.0, 3.141].printString = '[-1, 2, 3.141]' (* array print string *)
[-1, 2.0, 3.141].storeString = '[-1, 2, 3.141]' (* array store string *)
[1 .. 9].allButFirst = [2 .. 9] (* all but first element of Array *)
[1 .. 9].allButFirst(7) = [8, 9] (* all but first n elements of Array *)
{ [].allButFirst }.ifError { true } (* too few elements *)
[1 .. 9].allButLast = [1 .. 8]
[1 .. 9].allButLast(7) = [1, 2]
{ [].allButLast }.ifError { true }
{ | a = Array(1); | a.at(3) }.ifError { true } (* out of bound indexing is an error *)
{ | a = [1]; | a[3] }.ifError { true } (* out of bound indexing is an error *)
| a = Array(1); | a[1].isNil = true (* array slots are initialised to nil *)
| a = Array(1); | a.basicAt(3).isNil = true (* basic (unsafe) indexing, out of bounds indexes answer nil *)
{ | a = Array(1); | a.atPut(3, 'x') }.ifError { true } (* out of bound mutation is an error *)
{ | a = [1]; | a[3] := 'x' }.ifError { true } (* out of bound mutation is an error *)
| a = Array(1); | a.basicAtPut(3, 'x') = 'x' & { a.size = 3 } (* basic (unsafe) mutation, out of bounds indices extend array *)
Array:/1.newFrom(Interval(1, 5, 2)) = [1, 3, 5]
[1 .. 9].count(even:/1) = 4
[nil, true, false, 3.141, 23, 'str'].json = '[null,true,false,3.141,23,"str"]' (* json encodings *)
'[null,true,false,3.141,23,"str"]'.parseJson = [nil, true, false, 3.141, 23, 'str'] (* json parsing *)
[1, 2, 3].select { :x | x > 1 } = [2, 3] (* select items in collection *)
[1 .. 9].select { :x | true } = [1 .. 9] (* select everything *)
[1 .. 9].select { :x | false } = [] (* select nothing *)
[].select { :x | true } = [] & { [].select { :x | false } = [] } (* select from empty collection *)
[1, 2, 3].reject { :x | x > 1 } = [1]
[1 .. 9].reject { :x | true } = [] (* reject everything *)
[1 .. 9].reject { :x | false } = [1 .. 9] (* reject nothing *)
[].reject { :x | true } = [] & { [].reject { :x | false } = [] } (* reject from empty collection *)
(1 .. 9).collect{ :x | x * x }.last = 81
(1 .. 9).collect{ :x | x * x }.collect{ :x | x * x }.last = 6561
[1 .. 9].last(5) = [5 .. 9]
{ [1 .. 3].last(5) }.ifError { true }
[1 .. 9].anyOne = 1 (* any element, chooses first *)
{ [].anyOne }.ifError { true } (* there are not any elements in an empty collection *)
[1 .. 9].any(3) = [1 .. 3] (* any three elements, chooses first *)
{ [1 .. 9].any(11) }.ifError { true } (* it is an error if there are not enough elements *)
[1 .. 9].take(11) = [1 .. 9] (* taking more elements than there are answers a copy *)
[1, 2].take(5).size = 2 (* taking more elements than there are answers a copy *)
{ [1, 2].take(-1) }.ifError { true }
[1 .. 5].beginsWith([1 .. 3]) = true
[1 .. 5].beginsWithAnyOf([[5], [4], [3], [2]])= false
[1 .. 5].groupBy(even:/1).keys = [false, true] (* answer a Map grouping elements according to a predicate *)
[1 .. 5].groupBy(even:/1)[true] = [2, 4]
| a = []; | [1, 'x', 2, 'y', 3, 'x'].pairsDo { :p :q | a.add(q -> p) }; a = ['x' -> 1, 'y' -> 2, 'x' -> 3] (* iterate adjacent pairs *)
| r = (); | [1, 'fred', 2, 'charlie', 3, 'elmer'].pairsDo { :p :q | r.add(q -> p) }; r::elmer = 3 (* iterate adjacent pairs *)
[1 .. 9].indexOfSubCollection([3 .. 5]) = 3
[1 .. 9].indexOfSubCollectionStartingAt([3 .. 5], 9) = 0
[1 .. 9].indexOfSubCollectionStartingAt([9], 9) = 9
| c = []; | [1 .. 9].splitByDo([3 .. 5]) { :each | c.add(each) }; c = [[1, 2], [6, 7, 8, 9]]
['a', 'b', '', 'c', '', 'd', '', 'e', 'f'].indicesOfSubCollection(['']) = [3, 5, 7]
['a', 'b', '', 'c', '', 'd', '', 'e', 'f'].splitBy(['']) = [['a', 'b'], ['c'], ['d'], ['e', 'f']]
['a', 'b', '', 'c', '', 'd', '', 'e', 'f', ''].splitBy(['']) = [['a', 'b'], ['c'], ['d'], ['e', 'f'], []]
[5, 6, 3, -3, 2, 1, 0, 4].minMax = [-3, 6] (* integer minMax *)
[2834.83, -293482.28, 99283, 23, 959323].minMax = [-293482.28, 959323] (* float minMax *)
'fgaguzst'.characterArray.minMax = ['a'.Character, 'z'.Character] (* character minMax *)
{ ['x'].detect { :each | each.isNumber } }.ifError { true } (* if no element is detected, an error is raised *)
['x'].detectIfFound { :each | each.isString } { :x | 42 } = 42 (* process detected element before answering *)
['x'].detectIfFound { :each | each.isNumber } { :x | 'x' } = nil (* if not found answer nil *)
['x'].detectIfFoundIfNone { :each | each.isNumber } { :x | 'x' } { 'x' } = 'x' (* ifFound and ifNone clauses *)
['x'].detectIfNone { :each | each.isString } { 42 } = 'x'
['x'].detectIfNone { :each | each.isNumber } { 42 } = 42
| a = Array(9); | a.atAllPut('x'); a.allSatisfy { :each | each = 'x' } (* set all entries to the same value *)
| a = Array(9); | a.atAllPut('x') = 'x' & { a.atRandom = 'x' } (* answers object put *)
[1 .. 9].collect { :each | 10 - each } = [9 .. 1]
[1, 2, 3] ++ [4, 5, 6] = [1, 2, 3, 4, 5, 6]
[1 .. 5].reversed = [5 .. 1]
| c = [1 .. 5]; | { c[1.5] }.ifError { true } (* index not an integer *)
| c = [1 .. 5]; | { c['1'] }.ifError { true } (* index not an integer *)
{ [1 .. 5].not }.ifError { true } (* cannot be negated *)
| a = [1, 2, 4]; | a.insertAt(3, 3); a = [1 .. 4] (* insert value at index *)
| a = [1, 2, 4]; | a.addAfter(3, 2); a = [1 .. 4] (* insert value after existing value *)
| a = [1, 2, 4]; | a.addBefore(3, 4); a = [1 .. 4] (* insert value before existing value *)
[-1 .. 5].collect { :index | [1 .. 3].atPin(index) } = [1, 1, 1, 2, 3, 3, 3] (* index answering bound if out of bounds *)
[2, 7, 5, 0, 1, -2].collect { :index | [5, 6, 8].atWrap(index) } = [6, 5, 6, 8, 5, 5] (* index with wrap-around *)
| a = [1, nil, 3]; | a.atWrapPut(5, 2); a = [1, 2, 3]
[1 .. 9].difference([3 .. 7]) = [1, 2, 8, 9] (* set theoretic difference of two collections *)
[1 .. 9].difference([]) = [1 .. 9] (* set theoretic difference of two collections *)
| a = [1 .. 9]; | a.reject { :each | a.includes(each) } = [] (* reject all *)
[1 .. 9].difference([1 .. 9]) = [] (* set theoretic difference of two collections *)
[1, 3 .. 9].intersection([2, 4 .. 8]) = [] (* set theoretic intersection, unicode = ∩ *)
[1 .. 5].intersection([5 .. 9]) = [5] (* set theoretic intersection *)
| a = []; | [1 .. 3].doSeparatedBy { :each | a.add(each) } { a.add(0) }; a = [1, 0, 2, 0, 3]
[1, 2, 3].intersperse(0) = [1, 0, 2, 0, 3]
| a = []; | [1 .. 3].doWithout({ :each | a.add(each) }, 2); a = [1, 3]
[1 .. 9].selectThenCollect(even:/1) { :each | each * 3 } = [6, 12, 18, 24] (* avoid intermediate collection *)
[1 .. 9].collectThenSelect(squared:/1) { :each | each > 36 } = [49, 64, 81] (* avoid intermediate collection *)
[1, 3 .. 9].union([3 .. 7]) = [1, 3, 4, 5, 6, 7, 9].Set (* set theoretic union, unicode = ∪ *)
| a = [1 .. 9]; | a.removeAllSuchThat(even:/1); a = [1, 3 .. 9] (* remove elements selected by predicate *)
| a = [1 .. 9]; | a.removeAllFoundIn([1, 3 .. 9]); a = [2, 4 .. 8] (* remove elements found in a collection *)
5.arithmeticSeries(1, 2) = [1, 3 .. 9] (* arithmetic series (size from by) *)
5.geometricSeries(1, 2) = [1, 2, 4, 8, 16] (* geometric series (size from by) *)
Array(3).size = 3
Array:/1.ofSize(3) = [nil, nil, nil]
| l = []; | l.addFirst(2); l.addFirst(1); l = [1, 2] (* add item to start of array *)
| l = [2]; | l.addFirst(1) = 1 & { l = [1, 2] } (* answer is argument *)
| l = []; | l.addLast(1); l.addLast(2); l = [1, 2] (* add item to end of array *)
| l = [1]; | l.addLast(2) = 2 & { l = [1, 2] } (* answer is argument *)
| l = []; | (1 .. 5).do { :each | l.add(each) }; l = [1 .. 5] (* alias for addLast *)
| l = [1 .. 9]; | l.removeFirst = 1 & { l.size = 8 } (* remove first object from array *)
| l = [1 .. 9]; | l.removeLast = 9 & { l.size = 8 } (* remove last object from array *)
| l = [4, 5]; | l.addAllFirst(1.to(3)); l = [1 .. 5] (* add all elements to start of array *)
[1].addAllFirst([2, 3]) = [2, 3] (* answer is argument *)
| l = [1, 2, 3]; | l.addAllLast(4.to(5)); l = [1 .. 5] (* add all elements to end of array *)
[1].addAllLast([2, 3]) = [2, 3] (* answer is argument *)
| l = [1]; | l.addAll([2, 3]); l.addAll([]); l.addAll([4 .. 6]); l = [1 .. 6] (* alias for addAllLast *)
| i = (1 .. 9), a = []; | a.addAll(i); a.size = 9 (* add elements from Interval to end of Array *)
| s = 'string', a = []; | a.addAll(s); a.size = 6 (* add elements from String to end of Array *)
| s = 'string', a = []; | a.addAll(s.asciiByteArray); a.size = 6 (* add elements from ByteArray to end of Array *)
13.fibonacciSequence = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233]
| c = [1 .. 5]; | [c.removeAt(1), c] = [1, [2, 3, 4, 5]] (* removeAt answers the removed element *)
| c = [1 .. 5]; | [c.removeAt(3), c] = [3, [1, 2, 4, 5]]
| c = [1 .. 5]; | [c.removeFirst(3), c] = [[1, 2, 3], [4, 5]] (* remove first three objects from array *)
| c = [1 .. 5]; | [c.removeLast(3), c] = [[3, 4, 5], [1, 2]] (* remove last three objects from array *)
| c = [1 .. 5]; | c.removeAll; c = [] (* remove all objects from array *)
| c = [1 .. 5]; | [c.remove(3), c] = [3, [1, 2, 4, 5]] (* remove object from array *)
| c = [1, 2, 3, 2, 1]; | [c.remove(2), c] = [2, [1, 3, 2, 1]] (* remove only one matching element *)
| c = [1 .. 5]; | c.removeIfAbsent(9) { true } & { c = [1 .. 5] } (* remove object from array, handle absence *)
[1, 2, 3].ofSize(4) = [1, 2, 3, nil] (* extend to be of size, new slots are nil *)
| a = [1, 2, 3]; | a.ofSize(2) = a (* if requested size is smaller, do nothing *)
| a = [1, 2, 3]; | a.ofSize(2) == a (* if requested size is smaller, answer the array itself *)
[1, 3 .. 9].indices = (1 .. 5) (* indices of array (an interval) *)
| a = [1, [2, 3]], c = a.copy; | c[2][1] := -2; c = a & { a = [1, [-2, 3]] } (* copy is a shallow copy *)
| a = [1, [2, 3]], c = a.deepCopy; | c[2][1] := -2; c ~= a & { a = [1, [2, 3]] } (* deepCopy is a deep copy *)
| a = [nil, true, false, 3.141, 23, 'str']; | a.deepCopy = a (* deepCopy of shallow array *)
```

## ArrayedCollection -- collection trait
```
[3, 5, 7].basicAt(1) = 3 (* unchecked lookup *)
[3, 5, 7].basicAt(7) = nil (* unchecked lookup, nil on invalid index *)
```

## Assignment
```
| a = 'a', b = 'b', c = 'c'; | a := b := c; [a, b, c] = ['c', 'c', 'c'] (* assignment is right-associative *)
| a = nil; | (a := 1) = 1 (* assignment answers assigned value *)
| a b | a := (b := 2 + 2) + 3 = 7 & { b = 4 } (* assignment answers assigned value *)
| a = 1, b = 2, c = 3; | [a, b, c] := [b, c, a]; [a, b, c] = [2, 3, 1] (* permutation using array assignment syntax *)
```

## Association -- collection type
```
('x' -> 1).typeOf = 'Association' (* arrow (->) constructor, unicode = → *)
('x' -> 1).isAssociation (* type predicate *)
Association('x', 1) = ('x' -> 1)
'x'.minusGreaterThan(1) = ('x' -> 1) (* spelled out arrow method *)
| a = 'x' -> 1; | [a.key, a.value] = ['x', 1] (* key and value accessors *)
('x' -> 1).Array = ['x', 1] (* two element [key, value] array *)
['x' -> 1, 'y' -> 2].collect(Array:/1) = [['x', 1], ['y', 2]]
(23 -> 3.141).printString = '23 -> 3.141'
(23 -> 3.141).storeString = 'Association(23, 3.141)'
(1 -> '1').key = (1 -> 'one').key
(1 -> '1').value ~= (1 -> 'one').value
(1 -> '1') ~= (1 -> 'one')
(1 -> 2) = (1 -> 2).storeString.evaluate
(false -> true) = (false -> true).storeString.evaluate
('+' -> 'plus') = ('+' -> 'plus').storeString.evaluate
(0 -> 1) ~= (0 -> 2) (* equality considers both key and value, unlike in Smalltalk-80 *)
('x' -> 1) ~= ('y' -> 1) (* equality considers both key and value, unlike in Smalltalk-80 *)
('x' -> 1) ~= (x: 1) (* an association is not equal to a record *)
| a = 'x' -> 1; | a.keyValue('y', 2); a = ('y' -> 2) (* set key and value *)
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
[1, 3, 5, 1, 3, 1].Bag.sorted = [1, 1, 1, 3, 3, 5] (* array of elements, sorted *)
[1, 3, 5, 1, 5, 1].Bag.sorted = [1, 1, 1, 3, 5, 5] (* array of elements, sorted *)
[1, 3, 5, 1, 3, 1].Bag.sortedCounts = [3 -> 1, 2 -> 3, 1 -> 5]
[1, 3, 5, 1, 5, 1].Bag.sortedCounts = [3 -> 1, 2 -> 5, 1 -> 3]
[1, 3, 5, 1, 3, 1].Bag.sortedElements = [1 -> 3, 3 -> 2, 5 -> 1]
[1, 3, 5, 1, 5, 1].Bag.sortedElements = [1 -> 3, 3 -> 1, 5 -> 2]
| c1 = [2, 3, 3, 4, 4, 4].Bag, c2 = c1.copy, s2 = c2.size; | c1.removeAll; c1.size = 0 & { c2.size = s2 }
| c = Bag(), x = 'x'; | c.add(x); c.remove(x); c.size = 0
| c = ['x', 'x'].Bag; | c.remove('x'); c.remove('x'); c.size = 0
| c = Bag(); | { c.remove('x') }.ifError { true }
[2, 3, 3, 4, 4, 4].Bag.occurrencesOf(3) = 2 (* number of occurrences of element in collection *)
[2, 3, 3, 4, 4, 4].Bag.occurrencesOf(4) = 3
[2, 3, 3, 4, 4, 4].Bag.occurrencesOf(5) = 0
[2, 3, 3, 4, 4, 4].Bag.occurrencesOf(nil) = 0
[nil].Bag.occurrencesOf(nil) = 1 (* count occurrences of nil *)
| c = [2, 3, 3, 4, 4, 4].Bag; | c.copy = c (* copy answers new equal Bag *)
| c = [2, 3, 3, 4, 4, 4].Bag; | c.copy ~~ c (* copy does not answer argument *)
| c = Bag(); | c.addWithOccurrences('x', 4); c.occurrencesOf('x') = 4
[2, 3, 3, 4, 4, 4].Bag.Set.size = 3 (* number of unique elements *)
[2, 3, 3, 4, 4, 4].Bag.Set.occurrencesOf(3) = 1
| s = Bag(); | 250.timesRepeat { s.add([1 .. 4].shuffled.asString) }; s.Set.size = 24
[1, 2, 3, 1, 4].Bag.isIndexable = false (* bags are not indexable *)
[1, 2, 3, 1, 4].Bag.indices = nil (* sets are not indexable *)
| a = [1, 1, 2, 1, 2, 3, 1, 1, 2, 3, 4]; | a.sum = a.Bag.sum (* sum may be optimised *)
[1, 2, 3, 1, 3, 4].Bag.valuesAndCounts = [1 -> 2, 2 -> 1, 3 -> 2, 4 -> 1].Map (* contents *)
[1, 1, 1, 1, 1, 2, 2, 2, 2, 3].Bag.cumulativeCounts = [50 -> 1, 90 -> 2, 100 -> 3]
```

## Benchmarks
```
| r t | t := { r := 26.benchFib }.millisecondsToRun; r = 392835 & { t < 500 }
| r t | t := { r := 10.benchmark }.millisecondsToRun; r = 1028 & { t < 500 } (* c.f tinyBenchmarks *)
```

## Binary -- numeric trait
```
16 << 3 = 128 (* left shift small float *)
23 << 7 = 2944 (* left shift small float *)
7 << 23 = 58720256 (* left shift small float *)
16 >> 3 = 2 (* right shift small float *)
7n << 23 = 58720256n (* left shift large integer *)
7n << 71 = 16528282690043758247936n (* left shift large integer *)
16n >> 3 = 2n (* right shift large integer *)
2r0.bitCount = 0 (* count number of bits set *)
2r1.bitCount = 1
2r101.bitCount = 2
2r101001000100101.bitCount = 6
{ -2.bitCount }.ifError { true } (* negative integers have an infinite number of leading ones *)
2r1111.bitAnd(2r1001) = 2r1001 (* bitwise and *)
(2 ** 30).bitAnd(2 ** 30 - 1) = 0 (* bitwise and of a power of two and one less is zero *)
2r1111.bitOr(2r1001) = 2r1111 (* bitwise or *)
2r1111.bitXor(2r1001) = 2r0110 (* bitwise exclusive or *)
(1 .. 8).collect { :each | 2r10010110.bitAt(each) } = [0, 1, 1, 0, 1, 0, 0, 1] (* bit at index *)
32.highBit = 6 (* high bit, the number of bits required to represent an integer *)
32 = 2r00100000 & { 2r00100000.highBit = 6 } (* high bit *)
2r00101000.highBit = 6 (* high bit *)
{ 2r00101000.negated.highBit }.ifError { true } (* high bit is not defined for negative integers *)
2r00101000.lowBit = 4 (* low bit *)
2r00101000.negated.lowBit = 4 (* low bit *)
0.lowBit = 0 & { 0.highBit = 0 } (* the low and high bits of zero are zero *)
```

## Bitset -- collection type
```
Bitset(64).isBitset (* a bitset is a bitset *)
Bitset(64).size = 0 (* a new bitset is empty *)
Bitset(64).capacity = 64 (* the capacity of a bitset is set when initialized *)
Bitset(64).isEmpty (* a new bitset is empty *)
Bitset(64).bytes.allSatisfy  { :each | each = 0 } (* all bytes at the empty bitset are zero *)
[1, 3, 9].Bitset.capacity = 16 (* bitset from array, capacity is rounded up to nearest byte *)
| b = Bitset(64); | b.add(1); b.add(3); b.add(9); b.size = 3 (* add three integers to bitset *)
| b = Bitset(64); | b.add(5); b.add(5); b.add(5); b.size = 1 (* adding the same integer over again *)
| b = [1, 3, 9].Bitset; | b.includes(3) (* does bitset include element *)
| b = [1, 3, 9].Bitset; | [1, 3 .. 9].collect { :each | b.includes(each) } = [true, true, false, false, true]
| b = Bitset(64); | b[1] := 1; b[3] := 1; b[9] := 1; b.size = 3 (* a three element bitset *)
| b = Bitset(64); | b[1] := 1; b[3] := 1; b[9] := 1; [1, 3 .. 9].collect { :each | b[each] } = [1, 1, 0, 0, 1]
| a = [], b = Bitset(64), c = [1, 3, 9, 27]; | b.addAll(c); b.do { :each | a.add(each) }; a = c
| b = [1, 3].Bitset, c = b.copy; | c.add(7); b ~= c & { c = [1, 3, 7].Bitset } (* copy bitset *)
```

## Bitwise Manipulation
```
2.bitAnd(3) = 2 (* and bits *)
2.bitOr(3) = 3 (* or bits *)
2.bitXor(3) = 1 (* xor bits *)
3.bitNot = -4 (* invert bits *)
2.bitShiftLeft(3) = 16 (* left shift (higher) *)
16.bitShiftRight(3) = 2 (* right shift (lower) *)
2.bitShift(3) = 16 (* left shift (higher) *)
16.bitShift(-3) = 2 (* right shift (lower) *)
(1 .. 4).select { :bit | 6.bitTest(bit) } = [2, 3] (* bit at position (0|1) [!Squeak] *)
2 << 3 = 16 (* left shift operator *)
16 >> 3 = 2 (* right shift operator *)
{ 1.bitAnd(nil) }.ifError { true } (* operand not adaptable to number *)
{ 1 << nil }.ifError { true } (* operand not adaptable to number *)
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
true = true (* true constant, unicode = ⊤ *)
false = false (* false constant, unicode = ⊥ *)
true ~= false (* true is not false, unicode = ≠ *)
false ~= true (* false is not true *)
true == true (* true is identical to true, unicode = ≡ *)
false == false (* false is identical to false *)
1 = 1 = true (* equality predicate (operator) *)
1 ~= 2 = true (* inequality predicate (operator) *)
(1 == 1) = true (* identical *)
(1 ~~ 2) = true (* not identical, unicode = ≢ *)
true.and { true } (* logical and *)
true & { true } (* logical and (operator) *)
false & { '&'.error } = false (* & is equal to and and is not strict (unlike in Smalltalk) *)
true.and { false } = false (* logical and, unicode = ∧ *)
true & { false } = false (* logical and (operator) *)
true.or { false } = true (* logical or, unicode = ∨ *)
true | { false } = true (* logical or (operator) *)
false | { true } = true (* logical or (operator) *)
true | { '|'.error } = true (* | is equal to or and is not strict (unlike in Smalltalk) *)
true.ifTrue { 'T' } = 'T' (* if then, c.f. conditional statements *)
true.ifTrue { 1.toDo(2) { :unused | nil } } = 1 (* conditional iteration *)
false.if { 'T' } { 'F' } = 'F' (* if then else (do) *)
true.if { 'T' } { 'F' } = 'T' (* if then else (value) *)
true.not = false (* not true is false, unicode = ¬ *)
false.not = true (* not false is true *)
true.not.not = true (* not of not is the identity *)
1.isNumber = true (* test if object is a number *)
1.isInteger = true (* test if object is an integer *)
1.respondsTo(sqrt:/1) = true (* test if object responds to message *)
23.respondsTo(plus:/2) (* test if object responds to message *)
nil.isNil = true (* test if object is nil *)
0.positive = (0 >= 0) (* test if number is non-negative *)
0.strictlyPositive = (0 > 0) (* test if number is greater than zero *)
-1.negative = true (* test if number is negative *)
2.even = true (* test if number is even *)
1.even = false (* one is not even *)
1073741825.even = false (* a large odd number is not even *)
1073741824.even = true (* a large even number is even *)
1.odd = true (* test if number is odd *)
2.odd = false (* two is not odd *)
'A'.isUppercase = true (* test if upper case character *)
'a'.isLowercase = true (* test if lower case character *)
false.asBit = 0 (* boolean as bit, false is zero *)
true.asBit = 1 (* boolean as bit, true is one *)
true.asInteger > false.asInteger (* boolean as integer, c.f. asBit *)
true.asNumber > false.asNumber (* boolean as number, c.f. asBit *)
true.printString = 'true' (* true print string *)
true.storeString = 'true' (* true store string *)
false.printString = 'false' (* false print string *)
false.storeString = 'false' (* false store string *)
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
{ true & false }.ifError { true } (* & applies the rhs, which must be a procedure *)
true && true = true (* non-evaluating form of & (requires boolean operand) *)
{ true && 'true' }.ifError { true } (* it is an error if operand is not a boolean *)
{ false | false }.ifError { true } (* | applies the rhs, which must be a procedure *)
false || true = true (* non-evaluating form of | (requires boolean operand) *)
{ false || 'true' }.ifError { true } (* it is an error if operand is not a boolean *)
[true.json, false.json] = ['true', 'false'] (* booleans have json encodings *)
['true', 'false'].collect(parseJson:/1) = [true, false] (* parse json booleans *)
true.ifTrue { true }
false.ifFalse { true }
(4.factorial > 20).if { 'bigger' } { 'smaller' } = 'bigger'
true.copy == true (* copy is identity *)
false.xor(true) = true (* exclusive or *)
true.xor(false) = true (* exclusive or *)
false.xor(false) = false
true.xor(true) = false
false.xor { true } = true
false.xor { false } = false
{ false.xor(1) }.ifError { true }
{ false.xor { 1 } }.ifError { true }
true ==> { true } = true (* material implication *)
true ==> { false } = false (* material implication *)
false ==> { true } = true (* material implication *)
false ==> { false } = true (* material implication *)
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
ByteArray(0).typeOf = 'ByteArray' (* byte array type name *)
ByteArray(0).species = ByteArray:/1 (* byte array species *)
ByteArray(0).isArray = false (* byte arrays are arrays *)
ByteArray(0).isByteArray (* byte array predicate *)
ByteArray(0).isIndexable (* byte arrays are indexable *)
ByteArray(0).isSequenceable (* byte arrays are sequenceable *)
ByteArray(0).size = 0 (* size of byte array (number of elements) *)
ByteArray(8).size = 8
ByteArray(8).at(1) = 0 (* lookup element at index *)
ByteArray(8).atPut(1, 179) = 179 (* set element at index, answer element *)
| a = ByteArray(8); | a.atPut(1, 179) = 179 & { a.at(1) = 179 }
[1 .. 9].ByteArray.isByteArray = true (* array of numbers in 0-255 to byte array *)
{ [-1].ByteArray }.ifError { true } (* out of range element error *)
{ ['1'].ByteArray }.ifError { true } (* not a number element error *)
[1 .. 9].ByteArray.reversed = [9 .. 1].ByteArray
[1 .. 3].ByteArray.printString = '[1, 2, 3].ByteArray'
[1 .. 3].ByteArray.storeString = '[1, 2, 3].ByteArray'
ByteArray(4).hex = '00000000'
'text'.asciiByteArray[1] = 116 (* ByteArray subscript *)
| b = ByteArray(4); | b[1] := 15; b[3] := 240; b.hex = '0f00f000'
| b = ByteArray(4); | b[2] := 15; b[4] := 240; b.hex = '000f00f0'
[1 .. 4].ByteArray.hex = '01020304'
'string'.asciiByteArray.hex = '737472696e67' (* hexadecimal string of ByteArray *)
'737472696e67'.parseHexString.asciiString = 'string' (* ByteArray of hexadecimal string *)
| b = ByteArray(4); | b.atAllPut(15); b.hex = '0f0f0f0f'
'string'.asciiByteArray.Array = [115, 116, 114, 105, 110, 103] (* Array from ByteArray *)
'0f00f010'.parseHexString = [15, 0, 240, 16].ByteArray
{ [1, 2, 3].ByteArray.add(4) }.ifError { true } (* ByteArrays are not Extensible *)
[1 .. 9].ByteArray.select { :each | false } = [].ByteArray (* select nothing *)
[1 .. 9].ByteArray ~= [1 .. 9] (* ByteArray and Array of equal elements are not equal *)
[1 .. 9].ByteArray.hasEqualElements([1 .. 9]) (* ByteArray and Array of equal elements *)
[1, 13 .. 253].ByteArray.base64Encoded = 'AQ0ZJTE9SVVhbXmFkZ2ptcHN2eXx/Q==' (* base 64 encoding *)
'AQ0ZJTE9SVVhbXmFkZ2ptcHN2eXx/Q=='.base64Decoded = [1, 13 .. 253].ByteArray (* base 64 decoding *)
[1, 3 .. 9].ByteArray.indices = (1 .. 5) (* indices of byte array (an interval) *)
| b = [1, 3 .. 9].ByteArray; | b.copy = b & { b.copy ~~ b } (* copies are equal & not identical *)
| b = [1 .. 9].ByteArray, c = b.copy; | c[1] := 9; c[1] = 9 & { b[1] = 1 } (* copies are distinct *)
[115, 116, 114, 105, 110, 103].ByteArray.crc16 = 58909 (* 16 bit cyclic redundancy check, crc-16/arc *)
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
'x'.Character.printString = '$x'
'x'.Character.storeString = 'Character(120)'
'x'.Character == 120.Character (* characters are identical *)
'𠮷'.Character == '𠮷'.Character (* characters are identical *)
'x'.Character.asciiValue = 120 (* ascii code point of character *)
{ '𠮷'.Character.asciiValue }.ifError { true } (* it is an error is the character is not ascii *)
'xyz'.Array = ['x'.Character, 'y'.Character, 'z'.Character]
'xyz'.Array.collect(codePoint:/1) = [120, 121, 122]
32.Character.string = ' ' (* 32 is space *)
' '.Character.codePoint = 32 (* space is 32 *)
97.Character.string = 'a' (* 92 is a *)
'a'.Character.printString = '$a' (* print using smalltalk notation, despite not being a literal *)
'a'.Character.asString = 'a' (* single element string of Character *)
{ 'xy'.Character }.ifError { true } (* it is an error is the string is not a single Character *)
| c = '𠮷'.Character; | c = c.copy & { c ~~ c.copy } (* copy is equal but not identical *)
92.Character.string = '\\' (* escaped character *)
'0123456789abcdef'.characterArray.collect(digitValue:/1) = [0 .. 15] (* digit value of character *)
[0 .. 15].collect(digitValue:/1).join = '0123456789ABCDEF' (* character of given digit value *)
{ 36.digitValue }.ifError { true } (* error if integer is out of range *)
'x'.Character.asUppercase = 'X'.Character (* to upper case *)
'X'.Character.asLowercase = 'x'.Character (* to lower case *)
```

## Collection -- collection trait
```
[].isEmpty = true (* is collection empty *)
[].isCollection = true (* collection predicate *)
[].size = 0 (* the empty array has no elements *)
[1, 2, 3] = [1, 2, 3] (* are collections equal *)
[9, 4, 5, 7, 8, 6].size = 6 (* size of collection *)
[9, 4, 5, 7, 8, 6].max = 9 (* maximum item in collection *)
[9, 4, 5, 7, 8, 6].min = 4 (* minimum item in collection *)
[9, 4, 5, 7, 8, 6].sum = 39 (* sum of collection *)
[9, 4, 5, 7, 8, 6].mean = 6.5 (* sum of collection divided by size *)
[1 .. 9].mean = 5 (* sum of collection divided by size *)
| c = [1 .. 9]; | c.sum / c.size = 5 (* sum of collection divided by size *)
[9, 4, 5, 7, 8, 6].product = 60480 (* product of collection, unicode = Π *)
[9, 4, 5, 7, 8, 6].injectInto(0) { :z :e | e + z } = 39 (* sum of collection *)
[9, 4, 5, 7, 8, 6].injectInto(1) { :z :e | e * z } = 60480 (* product of collection *)
[9, 4, 5, 7, 8, 6].includes(7) = true (* is element in collection, i.e. contains *)
[9, 4, 5, 7, 8, 6].includes(3) = false (* is element in collection *)
[9, 4, 5, 7, 8, 6].count { :item | item.even } = 3 (* count elements that satisfy predicate *)
[9, 4, 5, 7, 8, 6].anySatisfy { :item | item.even } = true (* do any elements satisfy predicate *)
[].anySatisfy { :item | true } = false (* anySatisfy is false for empty collections *)
[9, 4, 5, 7, 8, 6].allSatisfy { :item | item.even } = false (* do all elements satisfy predicate *)
[].allSatisfy { :item | false } = true (* allSatisfy is true for empty collections *)
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
[4 .. 6].copyWithout(5) = [4, 6] (* copy without element *)
[2, 3, 4, 5, 5, 6].copyWithout(5) = [2, 3, 4, 6] (* copy without element, removes multiples *)
[2, 3, 4, 5, 5, 6].copyWithoutAll([3, 5]) = [2, 4, 6] (* copy without element, removes multiples *)
| a = [1 .. 4], c = a.copyWith(5); | a ~= c & { c = [1 .. 5] } (* copy with new (last) element *)
| s = [1 .. 4].Set, c = s.copyWith(5); | s ~= c & { c = [1 .. 5].Set } (* copy with new element *)
{ [1, 2].take(-1) }.ifError { true }
[].select { :each | each > 0 } = []
[1, 2, 2, 3, 3, 3].histogramOf { :each | each }.Array = [1, 2, 2, 3, 3, 3]
[1, 2, 2, 3, 3, 3].histogramOf { :each | each } = [1, 2, 2, 3, 3, 3].Bag
| c = [1, 2, 3, 1]; | c.Bag = c.histogramOf(identity:/1)
| c = [1, 2, 3, 1]; | c.Bag = c.histogramOf { :each | each }
[1, 2, 3, 1].Bag = ['x' -> 1, 'y' -> 2, 'y' -> 3, 'z' -> 1].histogramOf { :each | each.value }
['x', 'y', 'y', 'z'].Bag = ['x' -> 1, 'y' -> 2, 'y' -> 3, 'z' -> 1].histogramOf { :each | each.key }
(x: 1, y: 2, z: 1).histogramOf { :each | each } = [1, 2, 1].Bag
(x: 1, y: 2, z: 1).values.histogramOf { :each | each } = [1, 2, 1].Bag
(x: 1, y: 2, z: 1).keys.histogramOf { :each | each } = ['x', 'y', 'z'].Bag
[1.1, 2.1, 3.1, 1.9, 2.9, 1.1].histogramOf { :each | each.rounded } = [1, 2, 3, 2, 3, 1].Bag
[].ifEmpty { true } (* evaluate block if collection is empty *)
[].ifEmpty { true } { false } (* evaluate emptyBlock if collection is empty *)
[1].ifEmpty { false } { true } (* evaluate notEmptyBlock if collection is not empty *)
[1].ifEmpty { false } { :c | c = [1] } (* evaluate notEmptyBlock with collection if not empty *)
(1 .. 9).detectSum(squared:/1) = 285 (* apply procedure to each element and sum *)
(1 .. 9).collect(squared:/1).sum = 285
| a = [1 .. 9]; | a.removeAll([3 .. 7]); a = [1, 2, 8, 9] (* remove all indicated elements *)
| a = [1, 2, 3, 2, 1]; | [a.removeAll([1, 2, 3]), a] = [[1, 2, 3], [2, 1]] (* answer items to remove, only remove first instance *)
| b = [1, 2, 3, 2, 1].Bag; | b.removeAll([1, 2, 3]); b = [2, 1].Bag (* only remove first instance *)
{ [1 .. 3].removeAll([7 .. 9]) }.ifError { true } (* it is an error if an element to be removed is not located *)
| a = [1 .. 3]; | a.removeAllFoundIn([7 .. 9]); a = [1 .. 3] (* unlike removeAll it is not an error if items are not found *)
| a = [1, 2, 3, 2, 1]; | a.removeAllFoundIn([2, 3]); a = [1, 2, 1] (* removes only first matching element *)
[1 .. 6].collect { :each | each * 2 } = [2, 4 .. 12] (* apply block at each element and answer like collection *)
(1 .. 6).collect { :each | each * 2 } = [2, 4 .. 12] (* interval species is array *)
[2, -3, 4, -35, 4, -11].collect { :each | each.abs } = [2, 3, 4, 35, 4, 11]
[2, -3, 4, -35, 4, -11].collect(abs:/1) = [2, 3, 4, 35, 4, 11]
(1 .. 100).injectInto(0) { :sum :each | sum + each } = 5050
| a = [1 .. 5]; | a.contents = a (* an array is it's contents *)
((1 .. 9) / 3).rounded = [0, 1, 1, 1, 2, 2, 2, 3, 3] (* unary math operator at collection *)
[].collectThenDo { :each | 'error'.error } { :each | 'error'.error }.isEmpty (* neither block is run for empty collections *)
| n = 0; | [3 .. 7].collectThenDo(squared:/1) { :each | n := n + each } = [9, 16, 25, 36, 49] & { n = 135 } (* collect then do *)
[].ifEmptyIfNotEmptyDo { true } { :aCollection | false } = true (* branch on isEmpty *)
[1 .. 9].ifEmptyIfNotEmptyDo { false } { :aCollection | aCollection.size = 9 } = true (* branch on isEmpty *)
[1 .. 9].ifNotEmptyDo { :aCollection | aCollection.size = 9 } = true (* branch on isEmpty *)
[1 .. 9].average = 5 (* mean, sum divided by size *)
[1 .. 9].average = (45 / 9) (* mean, sum divided by size *)
(x: (y: 1)).atPath(['x', 'y']) = 1 (* atPath of dictionaries, depth = 2 *)
(x: (y: (z: 1))).atPath(['x', 'y', 'z']) = 1 (* atPath of dictionaries, depth = 3 *)
(w: (x: (y: (z: 1)))).atPath(['w', 'x', 'y', 'z']) = 1  (* atPath of dictionaries, depth = 4 *)
(x: (y: 1))::x::y = 1 (* index sequence *)
(x: (y: 1))['x'; 'y'] = 1 (* atPath (matrix) syntax of dictionaries *)
(x: (y: (z: 1)))['x'; 'y'; 'z'] = 1 (* atPath (volume) syntax of dictionaries *)
(w: (x: (y: (z: 1))))['w'; 'x'; 'y'; 'z'] = 1 (* atPath syntax of dictionaries *)
[['w', 'x'], ['y', 'z']].atPath([1, 2]) = 'x' (* atPath of arrays *)
[['w', 'x'], ['y', 'z']][1][2] = 'x' (* index sequence *)
[['w', 'x'], ['y', 'z']][1; 2] = 'x' (* atPath syntax of arrays *)
```

## Colour -- graphics type
```
Colour(1, 0, 0, 0.5).over(Colour(0, 1, 0, 0.5)) = Colour(1 / 3, 2 / 3, 0, 3 / 4)
Colour(0, 0, 0).isBlack (* is colour black *)
Colour(1, 1, 1).isWhite (* is colour white *)
Colour(0.5, 0.5, 0.5).isGreyOf(0.5) (* is colour grey with particular value *)
Colour(0.5, 0.5, 0.5).isGrey (* is colour grey *)
Colour(1, 0.2, 0.2).isRed (* is colour "red" *)
Colour(0.2, 1, 0.2).isGreen (* is colour "green" *)
Colour(0.2, 0.2, 1).isBlue (* is colour "blue" *)
Colour(0.9, 0.75, 0).isYellow (* is colour "yellow" *)
Colour(0, 0.75, 0.9).isCyan (* is colour "cyan" *)
Colour(0.9, 0, 0.75).isMagenta (* is colour "magenta" *)
Hsv(0, 0, 0).isBlack & { Hsv(0, 0, 1).isWhite } (* hue (in degrees) & saturation & value (in 0-1) *)
Hsv(0, 1, 1).isRed & { Hsv(120, 1, 1).isGreen } & { Hsv(240, 1, 1).isBlue }
Hsv(60, 1, 1).isYellow & { Hsv(180, 1, 1).isCyan } & { Hsv(300, 1, 1).isMagenta }
Hsv(0, 0, 0.5).isGreyOf(0.5) & { Hsv(0, 0, 0.75).isGreyOf(0.75) }
Hsv(0, 1, 0.75).isRed & { Hsv(120, 1, 0.5).isGreen } & { Hsv(240, 1, 0.5).isBlue }
0.5.srgbFromLinear = 0.7353569830524495 (* transfer function from (linear) rgb to srgb *)
0.7353569830524495.srgbToLinear = 0.5 (* transfer function from srgb to (linear) rgb *)
| c = Colour(1, 0, 0, 0.5), z = c.copy; | z.green := 1; c ~= z & { z = Colour(1, 1, 0, 0.5) } (* copy colour *)
'#f97306'.parseHexColour = Colour(16rf9 / 255, 16r73 / 255, 16r06 / 255) (* parse hex colour, here orange *)
system.colourNameTable::orange = Colour(1, 0.6, 0) (* colour name table *)
system.colourNameTable::veryLightGray.isGrey (* colour name table *)
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
(1 + 2.i) = (1 + 2.i) = true (* equality = same value *)
(1 + 2.i) == (1 + 2.i) = false (* identity = different objects *)
(1 + 2.i) ~= (1 + 4.i) = true (* inequality *)
| c = 2.i, z = c.copy; | z.real := 3; z ~= c & { z = (3 + 2.i) } (* copy complex *)
(0.5 * (2 + 0.i).log).exp = (0.5 * 2.log).exp (* natural logarithm *)
(3 + 5.i) ** 0 = (1 + 0.i) (* exponent of zero answers one *)
(3 + 5.i) ** 1 = (3 + 5.i) (* exponent of one is identity *)
(3 + 5.i) ** 2 ~ (-16 + 30.i)
(1 + 2.i) * (2 - 3.i) = (8 + 1.i) (* complex number with complex exponent *)
(1 + 2.i) / (1 - 2.i) = (-0.6 + 0.8.i)
(1 + 2.i) + (1 - 2.i) = (2 + 0.i)
(-3 + 2.i) - (5 - 1.i) = (-8 + 3.i)
(-1 + 2.i) ** 2 ~ (-3 - 4.i)
(-1 + 2.i) ** 2.5 ~ (2.7296 - 6.9606.i)
(-1 + 2.i) ** (1 + 1.i) = (-0.27910381075826657 + 0.08708053414102428.i)
3 * (2 - 5.i) = (6 - 15.i)
3 * ((2 - 5.i) ** 2) ~ (-63 - 60.i)
3 * ((2 - 5.i) ** -1) ~ (0.2069 + 0.5172.i)
2 * (1 - 1.i) = (2 - 2.i)
(2 + 3.i) - 1 = (1 + 3.i)
(1 + 2.i) + 0.5 = (1.5 + 2.i)
(2 + 3.i) - 0.5.i = (2 + 2.5.i)
0.75 * (1 + 2.i) = (0.75 + 1.5.i)
(2 + 3.i) / 2 = (1 + 1.5.i)
(1 - 3.i) / (2 + 2.i) = (-0.5 - 1.i)
2 * (1.i ** 2) ~ (-2 + 0.i)
1 + (3 / 4.i) = (1 - 0.75.i)
| z = 1 + 2.i; | z.real = 1 & { z.imaginary = 2 }
| z = 1 + 2.i; | z.conjugated = (1 - 2.i) & { z.absSquared = 5 }
| z = 1 + 2.i; | z.abs ~ 2.2361 & { z.arg ~ 1.1071 } (* absolute value (modulus, magnitude) and argument (phase) *)
1.i.sqrt ~ (0.7071 + 0.7071.i)
(1 + 2.i).sqrt ~ (1.2720 + 0.7861.i)
(1 + 2.i).cos ~ (2.0327 - 3.0519.i)
(1 + 2.i).exp ~ (-1.1312 + 2.4717.i)
(1 + 2.i).sinh ~ (-0.4891 + 1.4031.i)
(-1 + 0.i).sqrt = (0 + 1.i) (* the square root of negative one is i *)
(2 + 3.i).zero = (0 + 0.i) (* zero of same type, i.e. complex *)
(2 + 3.i).one = (1 + 0.i) (* one of same type, i.e. complex *)
```

## Conditional Statements
```
true.ifTrue { 'T' } = 'T' (* if true then, answers answer of branch block or nil *)
true.ifFalse { 'F' } = nil (* if false then, answers answer of branch block or nil *)
true.if { 'T' } { 'F' } = 'T' (* if true then else if false then, answers answer of chose block *)
| x | true & { x := 1 }; x = 1 (* side effect on conditional and *)
| x | false & { x := 1 }; x = nil (* no side effect on conditional and *)
| x | true | { x := 1 }; x = nil (* no side effect on conditional or *)
| x | false | { x := 1 }; x = 1 (* side effect on conditional or *)
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

## Converting -- type conversion
```
[true, false].collect(asBit:/1) = [1, 0] (* boolean to bit (integer) *)
pi.SmallFloat = pi (* identity *)
3:4.SmallFloat = 0.75 (* fraction to small float *)
23.SmallFloat = 23.0 (* integral to small float *)
true.asInteger = 1 (* asBit *)
'~'.Character.asInteger = 126 (* codePoint *)
23.asInteger = 23 (* identity *)
pi.asInteger = 3 (* truncated *)
'23'.asInteger = 23 (* parseInteger *)
{ '3.141'.asInteger = 3 }.ifError { true } (* parseInteger, truncated or error *)
true.asNumber = 1 (* asBit *)
pi.asNumber = pi (* identity *)
23.asNumber = 23 (* identity *)
'3.141'.asNumber = 3.141 (* parse number, floating point *)
'-672.433244'.asNumber = -672.433244 (* parse number, negative floating point *)
'23'.asNumber = 23 (* parse number, integral *)
'22:7'.asNumber = 22:7 (* parse number, fraction *)
pi.asFraction = 311:99 (* asFraction(100) *)
pi.asFraction(10) = 22:7 (* with maximum denominator *)
22:7.asFraction = 22:7 (* identity *)
23.asFraction = 23 (* identity *)
0.asPoint = (0@0) (* number to point *)
(0@0).asPoint = (0@0) (* identity *)
1.asComplex = Complex(1, 0) (* number to complex *)
1.i = Complex(0, 1) (* number to complex *)
(2 + 3.i).asComplex = Complex(2, 3) (* identity *)
126.Character = '~'.Character (* integer to character *)
'~'.Character.isCharacter (* string to character *)
| c = '~'.Character; | c.Character == c (* identity *)
| c = 126.Character; | c.asString = '~' & { c.printString = '$~' } (* character to string *)
'~'.asString = '~' (* identity operation *)
'~'.asString == '~' (* identity operation *)
23.asString = '23' (* Object>>printString (integral to string) *)
15.asHexDigit = 'F'.Character (* integral to hex character *)
{ 16.asHexDigit }.ifError { true } (* error if out of range *)
```

## Converting -- unit conversion
```
180.degreesToRadians = pi (* convert degrees to radians *)
pi.radiansToDegrees = 180 (* convert radians to degrees *)
```

## Copying
```
| b = true; | b.copy == b (* copy boolean, identity *)
| n = 3.141; | n.copy == n (* copy small float, identity *)
| n = 23n; | n.copy == n (* copy large integer, identity *)
| s = 'string'; | s.copy == s (* copy string, identity *)
| a = ('x' -> 1), c = a.copy; | c.value := 2; c ~= a & { c = ('x' -> 2) } (* copy association *)
| p = (0 @ 0), c = p.copy; | c.x := 1; c ~= p & { c = (1 @ 0) } (* copy point *)
| f = 3:4, c = f.copy; | c.numerator := 1; c ~= f & { c = 1:4 } (* copy fraction *)
| c = 2.i, z = c.copy; | z.real := 3; z ~= c & { z = (3 + 2.i) } (* copy complex *)
| a = [1, [2]], c = a.shallowCopy; | c[2][1] := -2; c = a & { a = [1, [-2]] } (* shallowCopy array *)
| a = [1, [2]], c = a.deepCopy; | c[2][1] := -2; c ~= a & { a = [1, [2]] } (* deepCopy array *)
| a = [1, [2]], c = a.copy; | c[2][1] := -2; c = a (* copy of array is shallowCopy and postCopy *)
| b = [1, 2, 2].Bag, c = b.copy; | c.add(3); c ~= b & { c = [1, 2, 2, 3].Bag } (* copy bag *)
| b = [1, 2].Bitset, c = b.copy; | c.add(3); c ~= b & { c = [1, 2, 3].Bitset } (* copy bitset *)
| b = [1, 2].ByteArray, c = b.copy; | c[1] := 3; c[1] = 3 & { b[1] = 1 } (* copy byte array *)
```

## Date -- temporal type
```
Date(system).isDate (* get current date and time *)
Date(0).iso8601 = '1970-01-01T00:00:00.000Z' (* translate Date to ISO-8601 string *)
Date('1970-01-01T00:00:00.000Z').unixTimeInMilliseconds = 0 (* parse ISO-8601 string & convert to unix time *)
| d = Date(0); | [d.year, d.month, d.dayOfMonth] = [1970, 1, 1] (* month and day are one-indexed *)
| d = Date(0); | [d.hour + (d.offsetSeconds / 60 / 60), d.minute, d.second] = [0, 0, 0] (* hour is in local time *)
Date(0) = Date(0) (* dates are comparable *)
Date(0) ~= Date(system) (* dates are comparable *)
Date(0) < Date(system) (* dates are magnitudes *)
Date(system) > Date(0) (* dates are magnitudes *)
Date('2023-05-11').iso8601 = '2023-05-11T00:00:00.000Z'
```

## Dictionary -- collection trait
```
(x: 1, y: 2, z: 3).count(even:/1) = 1 (* count elements that match predicate *)
(x: 1, y: 2).select { :each | false } = () (* select nothing *)
{ ().at('x') }.ifError { true } (* indexing with an unknown key is an error *)
(x: nil).at('x') = nil (* as does indexing a field that is set to nil *)
(x: nil).size = 1 (* nil fields exist *)
(x: nil).keys = ['x'] (* nil fields exist *)
().atIfAbsentPut('x') { 1 } = 1 (* at or atPut followed by at *)
| d = (); | d.atIfAbsentPut('x') { 1 } = 1 & { d::x = 1 }
(x: 1, y: 2).includes(2) (* includes, testing values for equality *)
(x: 1, y: [2, 3]).includes([2, 3])
(x: 1, y: 2).includesIdentity(2) (* includes, testing for identity not equality *)
(x: 1, y: [2, 3]).includesIdentity([2, 3]) = false
(x: 1, y: 2).includesAssociation('y' -> 2) (* includes association, testing for equality *)
(x: 1, y: [2, 3]).includesAssociation('y' -> [2, 3])
(x: 1, y: 2).includesAssociation('x' -> 2) = false
| d = (x: 1), a = 'y' -> 2; | d.add(a) = a & { d = (x: 1, y: 2) } (* add association *)
{ (x: 1).add('y') }.ifError { true } (* only associations may be added *)
| d = (x: 1, y: 2); | d.addAll(y: 3, z: 4); d = (x: 1, y: 3, z: 4) (* addAll replaces existing entries *)
| p = (x: 1), q = (y: 2); | p.declareFrom('y', q); [p, q] = [(x: 1, y: 2), ()]
| p = (x: 1), q = (x: 2); | p.declareFrom('x', q); [p, q] = [(x: 1), (x: 2)]
| p = (), q = (x: 1); | p.declareFrom('x', q); [p, q] = [(x: 1), ()]
| p = (), q = (x: 1); | p.declareFrom('y', q); [p, q] = [(y: nil), (x: 1)]
(x: 1, y: 2, z: 3).collect(squared:/1) = (x: 1, y: 4, z: 9)
| d = (x: 1, y: 2, z: 3); | d.replace(squared:/1); d = (x: 1, y: 4, z: 9) (* replace value at each key, in place collect *)
{ (x: 1).remove }.ifError { true } (* should not implement, see removeKey *)
(x: 1, y: 2) ++ (x: 2, y: 1) = (x: 2, y: 1) (* appending two dictionaries is right-biased, unicode = ⧺ *)
(x: 1, y: 2) ++ ['z' -> 3] = (x: 1, y: 2, z: 3) (* append an array of associations to a dictionary *)
{ (x: 1, y: 2) ++ [3] }.ifError { true } (* right hand side must be associations *)
(x: 1, y: 2).anySatisfy(even:/1) (* collection predicates at dictionary consider values not associations *)
(x: 1, y: 2, z: 3).detect(even:/1) = 2 (* detect value *)
| n = 0; | (x: 1, y: 2, z: 3).do { :each | n := n + each }; n = 6 (* do iterates over values, not associations *)
| n = 0; | (x: 1, y: 2, z: 3).valuesDo { :each | n := n + each }; n = 6 (* iterate over values *)
| a = []; | (x: 1, y: 2, z: 3).keysDo { :each | a.add(each) }; a = ['x', 'y', 'z'] (* iterate over keys *)
| n = 0; | (x: 1, y: 2, z: 3).associationsDo { :each | n := n + each.value }; n = 6 (* iterate over associations *)
| n = 0; | (x: 1, y: 2, z: 3).keysAndValuesDo { :key :value | n := n + value }; n = 6 (* iterate over keys and values *)
(x: 'x', y: '.', z: 'z').associationsSelect { :each | each.key = each.value } = (x: 'x', z: 'z') (* select querying associations *)
(x: 1, y: 2, z: 3).indices = ['x', 'y', 'z'] (* indices of dictionary (an array) *)
| d = (a: 1, b: 2, c: 1); | d.indexOf(2) = 'b' (* lookup key (index) given value *)
| d = (a: 1, b: 2, c: 1), k = d.indexOf(1); | k = 'a' | { k = 'c' } (* many keys with value *)
{ (a: 1, b: 2, c: 1).indexOf(3) }.ifError { true } (* error if no such value *)
| d = (x: 1, y: 2, z: 3); | d.removeAllSuchThat { :each | each.key = 'y' | { each.value = 3 } }; d = (x: 1)
| d = (x: 1, y: 2, z: 3); | d.associationsRemove { :each | each.key = 'y' | { each.value = 3 } }; d = (x: 1)
| d = (x: 1, y: 2, z: 3); | d.keysAndValuesRemove { :key :value | key = 'y' | { value = 3 } }; d = (x: 1)
| d = (x: 1, y: 2, z: 3); | d.removeKey('y') = 'y' & { d = (x: 1, z: 3) }
{ (x: 1, y: 2, z: 3).removeKey('?') }.ifError { true }
| d = (x: 1, y: 2, z: 3); | d.removeAt('y') = 2 & { d = (x: 1, z: 3) }
{ (x: 1, y: 2, z: 3).removeAt('?') }.ifError { true }
| d = (x: 1, y: 2); | d.atAllPut(3) = 3 & { d = (x: 3, y: 3) } (* set all values to indicated object *)
(x: 1, y: 2, z: 3).associations = ['x' -> 1, 'y' -> 2, 'z' -> 3] (* array of associations *)
(x: 1, y: 2, z: 3).basicAt('x') = 1 (* unchecked lookup *)
(x: 1, y: 2, z: 3).basicAt('u') = nil (* unchecked lookup, nil on absent key *)
| a = Array(9); | a.indicesDo { :each | a[each] := 10 - each }; a = [9 .. 1] (* iterate indices *)
```

## Duration -- temporal type
```
2.seconds.typeOf = 'Duration' (* make duration from number of seconds *)
5.hours.isDuration = true (* make duration from number of hours *)
0.25.seconds = 250.milliseconds (* make duration from number of milliseconds, durations are comparable *)
3.hours.seconds = 10800 (* convert duration to seconds *)
1.5.seconds.milliseconds = 1500 (* convert duration to milliseconds *)
0.5.seconds + 750.milliseconds = 1.25.seconds (* addition of durations *)
2.weeks - 12.days = 48.hours (* subtraction of durations *)
0.25.seconds + 500.milliseconds = 750.milliseconds
500.milliseconds + 0.25.seconds = 0.75.seconds
| f = { :t0 | | t1 = 2.randomFloat.seconds; | f.evaluateAfterWith(t1, t1) }; | f(2.seconds).cancel = nil
2.minutes < 2.hours (* durations are magnitudes *)
2.hours > 2.minutes (* durations are magnitudes *)
60.seconds.milliseconds = 60000 (* convert duration to milliseconds *)
60.seconds.seconds = 60 (* convert duration to seconds *)
60.seconds.minutes = 1 (* convert duration to minutes *)
3.days.hours = 72 (* convert duration to hours *)
3.weeks.days = 21 (* convert duration to days *)
'P1W1DT1H1M1S'.Duration.seconds = 694861 (* parse ISO-8601 duration string *)
'P2DT2H2M2S'.Duration.seconds = 180122 (* parse ISO-8601 duration string *)
'P3DT4H'.Duration = (3.days + 4.hours)
(2.days + 2.hours + 2.minutes + 2.seconds).seconds = ((2 * 24 * 60 * 60) + (2 * 60 * 60) + (2 * 60) + 2)
| d = 2.seconds, c = d.copy; | d ~~ c & { d = c } (* copy duration *)
1.siderealMonths = 27.321661.days (* as defined with respect to the celestial sphere *)
1.synodicMonths = 29.53059.days (* as define with respect to the line joining the sun and earth *)
(29.days + 12.hours + 44.minutes + 2.9.seconds - 1.synodicMonths).abs = 76.milliseconds
27.days + 7.hours + 43.minutes + 11.6.seconds - 1.siderealMonths < 1.seconds
1.julianYears = 365.25.days
3.minutes * 3 = 9.minutes (* multiply duration by number *)
9.minutes / 3 = 3.minutes (* divide duration by number *)
-3.seconds.abs = 3.seconds (* absolute value *)
(3.minutes - 2.hours).abs = (1.hours + 57.minutes) (* absolute value *)
7:8.milliseconds.seconds = 7:8000 (* fraction as duration *)
2.minutes.asSeconds = 120.asSeconds (* seconds of duration, or identity of number *)
```

## Error -- exception type
```
Error().isError = true (* an error with no message is an error *)
Error('Error message').isError = true (* error with message is an error *)
Error('Error message').name = 'Error' (* an error has a name *)
Error('Error message').messageText = 'Error message' (* an error has a message *)
Error('Error message').log = nil (* log error to transcript/console *)
{ Error('Error message').signal }.ifError { true } (* signal error *)
{ 'Error message'.error }.ifError { true } (* generate and signal an error *)
{ Error('message').copy }.ifError { true } (* cannot copy errors *)
| x | { x := false }.ensure { x := true }; x (* ensure termination block is evaluated *)
| x | { { ''.error }.ensure { x := true } }.ifError { }; x (* ensure termination block is evaluated *)
```

## Float64Array -- collection type
```
Float64Array(0).typeOf = 'Float64Array'
Float64Array(0).species = Float64Array:/1
Float64Array(0).isFloat64Array
Float64Array(0).size = 0
Float64Array(8).size = 8
Float64Array(8).at(1) = 0
Float64Array(8).atPut(1, pi) = pi (* answer value put *)
| a = Float64Array(8); | a.atPut(1, pi) = pi & { a.at(1) = pi }
| a = Float64Array(8); | (a[1] := pi) = pi & { a[1] = pi }
[1 .. 9].Float64Array.isFloat64Array = true
[1 .. 9].Float64Array.reversed = [9 .. 1].Float64Array
| a = [1 .. 9].Float64Array; | a.reverse; a = [9 .. 1].Float64Array
| a = [9 .. 1].Float64Array; | a.sort; a = [1 .. 9].Float64Array (* sort array in place *)
{ Float64Array(1).atPut(3, 'x') }.ifError { true }
| a = Float64Array(1); | a.basicAtPut(1, 'x'); a.at(1).isNaN = true (* unsafe mutation inserts NaN *)
| a = Float64Array(1); | a.basicAtPut(3, 'x'); a.basicAt(3) = nil (* unsafe mutation does not extend array *)
[1 .. 3].Float64Array.printString = '[1, 2, 3].Float64Array'
[1 .. 3].Float64Array.storeString = '[1, 2, 3].Float64Array'
| a = [1 .. 3].Float64Array, c = a.copy; | c[1] := 3; c ~= a & { c.Array = [3, 2, 3] } (* copy *)
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
{ 2:3 ** 3:4 }.ifError { true } (* only integer exponents are implemented *)
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
0.5 <= 1:4 = false (* less than or equal to, unicode = ≤ *)
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
{ Fraction(6, 0) }.ifError { true }
1:2 = 2:4 = true
1:2 * 2 = 1
2 * 1:2 = 1
23.isFraction = true
23.numerator = 23
23.denominator = 1 (* denominator of integer is one *)
1:3 + 1:7 = 10:21
Fraction(3, 1) = 3:1
-3:2.negated = 3:2
-3:2.abs = 3:2
3:2.ceiling = 2
-3:2.ceiling = -1
3:2.floor = 1
-3:2.floor = -2
353:359.printString = '353:359' (* Fraction print string *)
59:61.storeString = 'Fraction(59, 61)' (* Fraction store string *)
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
-3:2.numerator.negative (* numerator of negative fraction is negative *)
-3:2.denominator.positive (* denominator of negative fraction is positive *)
4:6.numerator = 2 (* literal fractions are reduced *)
4:6.denominator = 3 (* literal fractions are reduced *)
4:2 = 2
Fraction(4, 6).numerator = 4 (* Fraction is not initially reduced *)
Fraction(4, 6).denominator = 6 (* Fraction is not initially reduced *)
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
3:2.SmallFloat = 1.5 (* fraction as float *)
0.5 < 2:3 = true
2:3 > 0.5 = true
1 < 3:2 = true
3:2 > 1 = true
3:4.unicode = '¾' (* unicode character for fraction, else error *)
2:3.unicode = '⅔' (* unicode character for fraction, else error *)
{ 9:11.unicode }.ifError { true } (* unicode character for fraction, else error *)
system.unicodeFractionsTable.isDictionary = true
system.unicodeFractionsTable.associations.isArray = true
| n = system.unicodeFractionsTable.associations.collect(value:/1); | n = n.sorted
'4:3'.parseFraction = 4:3 (* parse fraction *)
'4/3'.parseFraction('/') = 4:3  (* parse fraction given delimiter *)
| x = Fraction(2 ** 55, 2); | x ~= (x - 1) = false (* fractions of large small floats behave strangely *)
| x = Fraction(2n ** 55n, 2); | x ~= (x - 1) (* fractions of large large integers behave ordinarily *)
2:3 ~= 3:4 (* unequal fractions *)
(2:3 == 2:3).not (* non-identical fractions (equal fractions need not be the same object) *)
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
6:8 * 4 = 3 (* answer integer *)
7:8 / 3 = 7:24 (* division by integer is fraction *)
6:9 = 2:3
-4:8 = -1:2
Fraction(5, -15).normalized = -1:3
Fraction(-4, -12).normalized = 1:3
2:3.numerator = 2
2:3.denominator = 3
2:3 = 6:9
2:3 ~= 9:27
3:7 < 1:2
3:4 > 2:3
2:4 + 1:6 = 2:3
5:12 - 1:4 = 1:6
5:8 * 3:12 = 5:32
6:5 / 10:7 = 21:25
SmallFloat(3:4) = 0.75
SmallFloat(1:2) = (1 / 2)
-1:3.typeOf = 'Fraction'
3:5 + 1 = 8:5
3:5 - 0.5 ~ 0.1
2:7 * (1 + 2.i) = (2:7 + 4:7.i)
2:7 * (1.5 + 2.i) ~ (0.4286 + 0.5714.i)
3:2 / (1 + 2.i) ~ (3:10 - 3:5.i)
1:2 + 2.i ~ (1:2 + 2:1.i)
0.5 ~ 1:2
0.3333 ~ 1:3
0.33 < (1:3)
1:3 - 0.33 ~ 0.003333
1:3.zero = Fraction(0, 1) (* zero of same type, i.e. fraction *)
1:3.one = Fraction(1, 1) (* one of same type, i.e. fraction *)
```

## Hash -- murmur hash
```
'String Input'.murmur3(2166136261) = [2006581733, 2651545595, 2673830536, 2103835251]
```

## Heap -- collection type
```
Heap().isHeap (* an empty heap is a heap *)
Heap().size = 0 (* an empty heap has size 0 *)
Heap().isEmpty (* an empty heap is empty *)
| h = Heap(); | h.add(3); h.size = 1 (* add element to heap, size is one *)
| h = Heap(); | h.add(3); h.first = 3 (* add element to heap, it is the first element *)
| h = Heap(); | h.add(3); h[1] = 3 (* add element to heap, it is the first element *)
| h = Heap(); | h.add(3); h.add(2); [h.size, h.first, h[2]] = [2, 2, 3] (* add elements to heap *)
| h = Heap(); | { h[1] }.ifError { true } (* out of bounds *)
| h = Heap(); | h.add(3); { h[2] }.ifError { true } (* out of bounds *)
| h = Heap(); | h.add(5); h.add(12); h.add(1); h.first = 1 (* add out of order *)
| h = Heap(); | h.addAll([5, 12, 1]); h.first = 1 (* add all out of order *)
| h = Heap(); | h.add(5); h.removeFirst; h.isEmpty (* add & remove *)
| h = Heap(); | h.addAll([5, 12, 1]); [h.removeFirst, h.first] = [1, 5] (* remove first *)
| h = Heap(); | h.addAll([5, 12, 1]); [h.removeFirst, h.removeFirst, h.first] = [1, 5, 12] (* remove first *)
| h = Heap(); | { h.removeFirst }.ifError { true } (* remove an element that does not exist *)
| h = Heap(); | h.add(5); [h.removeFirst, h.size] = [5, 0] (* add & remove *)
| h = Heap(); | h.addAll([1 .. 9].shuffled); h.first = 1 (* add shuffled, first is always 1 *)
| h = Heap(); | h.addAll([1 .. 9].shuffled); 8.timesRepeat { h.removeFirst }; h.first = 9
| h = Heap(); | h.addAll([1 .. 9].shuffled); 8.timesRepeat { h.removeAt(2) }; h.first = 1
| h = [1, 3, 5].Heap, a = []; | h.do { :each | a.add(each) }; a = [1, 3, 5]
| h = Heap(greaterThan:/2); | h.addAll([1, 3, 5]); h.first = 5
| h = Heap { :p :q | p > q }; | h.addAll([1, 3, 5]); [h.removeFirst, h.first] = [5, 3]
| h = [1 .. 4].Heap, c = h.copy; | c.add(5); h ~= c & { c = [1 .. 5].Heap }
```

## Identity -- literals
```
nil == nil (* nil identity *)
true == true & { false == false } (* boolean identity *)
3.141 == 3.141 & { 23 == 23 } & { 5n == 5n } (* number identity *)
'str' == 'str' (* string identity *)
(x: 1) ~~ (x: 1) (* record non-identity *)
[1] ~~ [1] (* array non-identity *)
```

## Integral -- numeric trait
```
1.isInteger = true (* integer predicate *)
123.printString = '123' (* integer print string *)
123.storeString = '123' (* integer store string *)
-987654321.printString = '-987654321' (* negative integer print string *)
4 / 2 = 2 (* integer division with integer result *)
| n = 2; | 3.timesRepeat { n := n * n }; n = 256 (* iteration *)
(0 .. 15).collect(asHexDigit:/1).join = '0123456789ABCDEF' (* integer to hex character *)
| a = []; | 1.upToDo(5) { :each | a.add(each) }; a = [1 .. 5] (* iterate over integer sequence *)
{ 5.upToDo(1) { :each | nil } }.ifError { true } (* non-ascending sequences are an error *)
| a = []; | 5.downToDo(1) { :each | a.add(each) }; a = [5 .. 1] (* iterate over integer sequence *)
{ 1.downToDo(5) }.ifError { true } (* non-descending sequences are an error *)
| a = []; | 1.toByDo(5, 1) { :each | a.add(each) }; a = [1 .. 5] (* with step *)
| a = []; | 1.toDo(5) { :each | a.add(each) }; a = [1 .. 5] (* toDo is upToDo if ascending *)
| a = []; | 5.toDo(1) { :each | a.add(each) }; a = [] (* non-ascending sequences are empty *)
(0 .. 255).collect { :each | each.digitAt(1) } = [0 .. 255]
(0 .. 255).collect { :each | each.digitAt(2) }.allSatisfy { :each | each = 0 }
(256 .. 511).collect { :each | each.digitAt(1) } = [0 .. 255]
(256 .. 511).collect { :each | each.digitAt(2) }.allSatisfy { :each | each = 1 }
(512 .. 1023).collect { :each | each.digitAt(2) }.Bag.sortedElements = [2 -> 256, 3 -> 256]
[1, 8, 16, 24, 32n, 40n, 48n, 56n, 64n].collect { :each | (2 ** each).digitLength } = [1 .. 9]
(2 ** 128n - 1).digitLength = 16
123456n.fnv1aHash = 2230130162n
(1 << 30) == 1073741824 (* equal integers are identical *)
6.take(3) = 20 (* n choose k *)
6.take(3) = ((6 * 5 * 4) / (1 * 2 * 3))
3.take(6) = 0 (* if k is greater than n answer is zero *)
58909.printStringHex = 'E61D' (* hexadecimal representation *)
```

## Integral -- prime numbers
```
9.primesArray = [2, 3, 5, 7, 11, 13, 17, 19, 23] (* first elements of prime number sequence *)
9.nthPrime = 23 (* lookup prime by index in sequence *)
system.cache::primesArray[9] = 23 (* the primes array is cached (memoized) by the system *)
5.nthPrime = 11 (* the nth entry in the sequence of prime numbers *)
23.nthPrime = 83 (* the nth entry in the sequence of prime numbers *)
3579.nthPrime = 33413 (* the nth entry in the sequence of prime numbers *)
system.cache::primesArray[3579] = 33413 (* nthPrime extends the primesArray cache as required *)
(2 .. 20).select { :each | each.isPrime } = [2, 3, 5, 7, 11, 13, 17, 19]
(2 .. 20).reject { :each | each.isPrime } = [4, 6, 8, 9, 10, 12, 14, 15, 16, 18, 20]
60.primeFactors = [2, 2, 3, 5] (* prime factors *)
[2, 2, 3, 5].product = 60 (* product is the inverse of primeFactors *)
60.primeFactors.product = 60
315.primeFactors = [3, 3, 5, 7] (* prime factors *)
2588.primeFactors = [2, 2, 647] (* prime factors *)
(2 .. 15).select { :each | each.primeFactors.max <= 5 } = [2,  3,  4,  5,  6,  8,  9, 10, 12, 15]
(2 .. 999).allSatisfy { :each | each = each.primeFactors.product } = true (* equality with product of factors *)
10071203840.primeFactors.Bag.sortedElements = [2 -> 13, 5 -> 1, 19 -> 1, 12941 -> 1] (* prime factor histogram *)
6606028800.primeFactors.Bag.sortedCounts = [22 -> 2, 2 -> 5, 2 -> 3, 1 -> 7]
8589298611.primeFactors = [3, 2863099537] (* large prime factors *)
(2 .. 30).select { :each | each.primeFactors.max <= 5 } = [2, 3, 4, 5, 6, 8, 9, 10, 12, 15, 16, 18, 20, 24, 25, 27, 30]
(2 .. 15).select { :each | each.primeLimit <= 5 } = [2, 3, 4, 5, 6, 8, 9, 10, 12, 15]
23.isPrime = true (* prime number predicate *)
2971215073.isPrime = true (* prime number predicate *)
2971215073.nextPrime = 2971215083 & { 2971215083.isPrime } (* find next prime *)
100.primesUpTo = [2, 3, 5, 7,11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]
35.isCoprime(64)
1173.isCoprime(1547).not
```

## Integral -- integer names
```
[1 .. 10].collect(threeDigitName:/1) = ['one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten']
[11 .. 20].collect(threeDigitName:/1) = ['eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen', 'twenty']
[21, 25, 29].collect(threeDigitName:/1) = ['twenty-one', 'twenty-five', 'twenty-nine']
[111, 333, 999].collect(threeDigitName:/1) = ['one hundred eleven', 'three hundred thirty-three', 'nine hundred ninety-nine']
(921 * (10 ** 12)).asWords = 'nine hundred twenty-one trillion'
504606846975.asWords = 'five hundred four billion, six hundred six million, eight hundred forty-six thousand, nine hundred seventy-five'
123456789.asWords = 'one hundred twenty-three million, four hundred fifty-six thousand, seven hundred eighty-nine'
13579.asWords = 'thirteen thousand, five hundred seventy-nine'
```

## Integral -- roman numerals
```
(1 .. 10).collect(printStringRoman:/1) = ['I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX', 'X']
(11 .. 20).collect(printStringRoman:/1) = ['XI', 'XII', 'XIII', 'XIV', 'XV', 'XVI', 'XVII', 'XVIII', 'XIX', 'XX']
(50, 61 .. 160).collect(printStringRoman:/1) = ['L', 'LXI', 'LXXII', 'LXXXIII', 'XCIV', 'CV', 'CXVI', 'CXXVII', 'CXXXVIII', 'CXLIX', 'CLX']
['I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX', 'X'].collect(romanNumber:/1) = [1 .. 10]
['XI', 'XII', 'XIII', 'XIV', 'XV', 'XVI', 'XVII', 'XVIII', 'XIX', 'XX'].collect(romanNumber:/1) = [11 .. 20]
['L', 'LXI', 'LXXII', 'LXXXIII', 'XCIV', 'CV', 'CXVI', 'CXXVII', 'CXXXVIII', 'CXLIX', 'CLX'].collect(romanNumber:/1) = [50, 61 .. 160]
2023.printStringRoman = 'MMXXIII'
'MMXXIII'.romanNumber = 2023
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
| i = (1 .. 9); | i.copy ~~ i & { i.copy = i } (* copy is equal not identical *)
(1 .. 9).includes(9) (* test if element is in collection, interval is inclusive *)
(1 .. 9).includes(11).not (* test if element is in collection *)
(1 .. 9).includesIndex(3) (* does interval include index *)
(1 .. 9).select { :item | item > 7 } = [8, 9] (* return elements that pass test *)
(1 .. 9).reject { :item | item < 7 } = [7, 8, 9] (* return elements that fail test *)
(1 .. 9).collect { :item | item + item }.last = 18 (* transform each element *)
(1 .. 9).detect { :item | item > 3 } = 4 (* detect first element that passes test *)
(9 .. 1).detect(even:/1) = 8 (* detect first element that passes test *)
{ (9, 7 .. 1).detect(even:/1) }.ifError { true } (* if no element is detected, raise error *)
{ [].detect { :item | true } }.ifError { true } (* detect at an empty collection raises an error *)
(1 .. 9).injectInto(0) { :sum :item | sum + item } = 45 (* sum elements *)
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
5.toBy(1, -1).Array = [5, 4, 3, 2, 1]
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
(1 .. 9).copyFromTo(3, 7) = (3 .. 7) (* copy from start to end indices, inclusive *)
| i = 1; | 1.to(9).do { :each | i := i + each }; i = 46
Interval(-1, 1, 1).printString = '(-1 .. 1)'
Interval(-1, 1, 1).storeString = 'Interval(-1, 1, 1)'
Interval(1, 9, 1) = (1 .. 9)
Interval(1, 10, 3).size = 4
Interval(1, 10, 3).Array = [1, 4, 7, 10]
1.to(6).reversed = (6 .. 1)
1.to(6).first = 1 (* first element of interval *)
{ 1.upTo(0).first }.ifError { true } (* first element of empty interval *)
(1 .. 6).second = 2 (* second element of interval *)
to(1, 6).last = 6 (* last element of interval *)
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
3.to(5) = (3 .. 5)
1.to(0).size = 0
3.upTo(5) = (3 .. 5)
{ 1.upTo(0) }.ifError { true } (* upTo must be ascending *)
{ 0.downTo(1) }.ifError { true } (* downTo must be descending *)
0.toBy(1, -1).size = 0 (* toBy is the correct way to write a downTo that may be empty *)
5.downTo(3) = (5 .. 3)
3.upOrDownTo(5) = 5.upOrDownTo(3).reversed
| s = ''; | (1, 3 .. 9).reverseDo { :x | s := s ++ x }; s = '97531' (* do from end *)
(1 .. 9) + 3 = (4 .. 12) (* plus with a number answers an Interval *)
(1 .. 9) - 2 = (-1 .. 7) (* minus with a number answers an Interval *)
3 + (1 .. 9) = [4 .. 12]
(1 .. 5) + (1, 3 .. 9) = [2, 5 .. 14]
(1 .. 5) - (9, 7 .. 1) = [-8, -5 .. 4]
(0.5, 1 .. 4.5) = Interval(0.5, 4.5, 0.5) (* non-integer (fractional) step *)
(0.5, 1 .. 4.5).size = 9 (* fractional step size *)
(1, 1 + 1:3 .. 3).size = 7 (* fractional step size *)
(1:3 .. 7:3).size = 3 (* fractional start and end, integral step size *)
(1:3, 2:3 .. 3).size = 9 (* fractional step size *)
1:3.thenTo(2:3, 3).middle = 5:3
Interval(1, 100, 1) = 1.to(100)
Interval(1, 100, 0.5).size = 199
(1, 1.5 .. 100).at(198) = 99.5
(1 / 2).toBy(54 / 7, 1 / 3).last = (15 / 2)
1:2.toBy(54:7, 1:3).last = 15:2
(1 .. 3) ++ ['4', '5'] = [1, 2, 3, '4', '5'] (* append array to interval *)
| i = (1, 3 .. 9); | i.removeFirst = 1 & { i = (3, 5 .. 9) } (* remove first element *)
| i = (9, 7 .. 1); | i.removeFirst = 9 & { i = (7, 5 .. 1) } (* remove first element *)
| i = (1, 3 .. 9); | i.removeLast = 9 & { i = (1, 3 .. 7) } (* remove first element *)
| i = (9, 7 .. 1); | i.removeLast = 1 & { i = (9, 7 .. 3) } (* remove first element *)
(1 .. 9).sorted = (1 .. 9) (* ascending intervals are sorted *)
(9 .. 1).sorted = (1 .. 9) (* reverse interval if descending *)
| n = 0; | (1 .. 5).permutationsDo { :each | n := n + 1 }; n = 120 (* interval permutations *)
(1, 3 .. 17).copyFromTo(3, 6) = (5, 7 .. 11) (* copy from start index to end index *)
(17, 15 .. 1).copyFromTo(3, 6) = (13, 11 .. 7) (* copy from start index to end index *)
(1, 3 .. 17).copyFromTo(6, 3).isEmpty (* if indices are out of order the interval is empty *)
```

## Iteration
```
| n = 0; | 4.timesRepeat { n := n + 1 }; n = 4 (* times repeat loop (int) *)
| n = 0; | -4.timesRepeat { n := nil }; n = 0 (* times repeat loop (zero or negative values are allowed) *)
| n = 0; | 1.toDo(4) { :x | n := n + x }; n = 10 (* for loop (int) *)
| n = 0; | 1.toDo(4) { :x | n := n + x }; n = 10 (* for loop (int) *)
| s = ''; | 1.toDo(4) { :x | s := s ++ x }; s = '1234' (* for loop (int) *)
| s = ''; | (1 .. 5).do { :x | s := s ++ x }; s = '12345' (* for loop (interval) *)
| s = ''; | 1.toDo(5) { :x | s := s ++ x }; s = '12345' (* for loop (start & end indices) *)
| s = ''; | 1.toDo(0) { :x | 'error'.error }; s = '' (* for loop (end less than start) *)
| s = ''; | (1 .. 3).reverseDo { :x | s := s ++ x }; s = '321' (* for loop (interval, reversed) *)
| s = ''; | [1, 3, 5].do { :x | s := s ++ x }; s = '135' (* for loop (collection) *)
| n = 9; | { n > 3 }.whileTrue { n := n - 1 }; n = 3 (* while true loop *)
| n = 9; | { n < 7 }.whileFalse { n := n - 1 }; n = 6 (* while false loop *)
10.timesRepeat { nil } = 10 (* timesRepeat answers the receiver) *)
1.toDo(10) { :unused | nil } = 1 (* toDo answers the receiver *)
| a = []; | [1 .. 9].rejectThenDo(even:/1) { :each | a.add(each * 3) }; a = [3, 9, 15, 21, 27] (* avoid intermediate collection *)
| a = []; | [1 .. 9].selectThenDo(even:/1) { :each | a.add(each * 3) }; a = [6, 12, 18, 24] (* avoid intermediate collection *)
```

## LargeInteger -- numeric type
```
23n.typeOf = 'LargeInteger' (* syntax for large integer literals *)
(2 ** 54).LargeInteger.squared.printString = '324518553658426726783156020576256'
(2 ** 37).LargeInteger.squared.storeString = '18889465931478580854784n'
'324518553658426726783156020576256'.parseLargeInteger.isLargeInteger = true
2971215073.LargeInteger.isPrime = true
23n.factorial = 25852016738884976640000n (* factorial of LargeInteger *)
100n.factorial = 93326215443944152681699238856266700490715968264381621468592963895217599993229915608941463976156518286253697920827223758251185210916864000000000000000000000000n (* factorial of LargeInteger *)
170n.factorial = 7257415615307998967396728211129263114716991681296451376543577798900561843401706157852350749242617459511490991237838520776666022565442753025328900773207510902400430280058295603966612599658257104398558294257568966313439612262571094946806711205568880457193340212661452800000000000000000000000000000000000000000n (* factorial of LargeInteger *)
[-1n, 0n, 1n].collect(sign:/1) = [-1n, 0n, 1n]
6n / 8n = Fraction(3n, 4n)
2 / 3n = Fraction(2n, 3n)
4n / 2n = 2n (* reduced *)
| x = (2n ** 54n); | x ~= (x - 1) (* large integers behave ordinarily *)
5n % 3n = 2n (* modulo *)
[10n % 5n, -4n % 3n, 4n % -3n, -4n % -3n] = [0n, 2n, -2n, -1n] (* modulo, negative operands *)
13n % 7n % 4n = 2n (* left assocative *)
13n + 1n % 7n = 0n (* equal precedence *)
(2n ** 170 - 1).isPowerOfTwo = false (* LargeInteger power of two test *)
324518553658426726783156020576256n.even = true (* is large integer even *)
324518553658426726783156020576257n.odd = true (* is large integer odd *)
100n.factorial / 99n.factorial = 100n (* large integer factorial, c.f. small float *)
1000n.factorial / 999n.factorial = 1000n (* large integer factorial *)
8589298611n.primeFactors.last = 2863099537n
(1n << 100n) == 1267650600228229401496703205376n (* equal large integers are identical *)
92233720368n * 100000000n + 54775807n = 9223372036854775807n (* reader for large integer literals *)
2n ** 100n = 1267650600228229401496703205376n (* raised to *)
| n = 2n; | n.copy == n (* copy is identity *)
23n.SmallFloat = 23 (* large integer to small float *)
| a = [9 .. 1]; | { a[5n] }.ifError { true } (* large integers are not valid indices *)
58909n.printStringHex = 'E61D' (* hexadecimal representation *)
```

## LinkedList -- collection type
```
LinkedList().typeOf = 'LinkedList' (* type of linked list *)
LinkedList().isLinkedList = true (* type predicate for linked list *)
LinkedList().size = 0 (* empty linked list *)
LinkedList().isEmpty (* empty linked list *)
LinkedList:/0.ofSize(3).size = 3 (* linked list of three nil values *)
[1, 2, 3].LinkedList.size = 3 (* linked list from array *)
| l = LinkedList(); | l.addFirst(1); l.addFirst(2); l.Array = [2, 1] (* add to start *)
| l = LinkedList(); | l.addLast(1); l.addLast(2); l.Array = [1, 2] (* add to end *)
| l = LinkedList(); | 1.toDo(5) { :each | l.add(each) }; l.Array = [1 .. 5] (* add to end *)
[1 .. 9].LinkedList.collect { :each | 10 - each } = [9 .. 1].LinkedList (* collect *)
| l = [1 .. 9].LinkedList; | l.removeFirst; l.first = 2 (* remove first *)
| l = [1 .. 9].LinkedList; | l.removeLast; l.last = 8 (* remove last *)
| l = [1].LinkedList; | l.removeFirst = 1 & { l.isEmpty } (* remove first *)
| l = [1].LinkedList; | l.removeLast = 1 & { l.isEmpty } (* remove last *)
| l = [1 .. 5].LinkedList; | l.removeAllSuchThat(odd:/1); l.Array = [2, 4] (* in place reject *)
| l = (1 .. 99).LinkedList; | l.removeAll; l.isEmpty (* remove all *)
(1 .. 99).LinkedList.select(even:/1).Array = [2, 4 .. 98] (* select *)
(1 .. 9).LinkedList.selectThenCollect(even:/1, squared:/1).Array = [4, 16, 36, 64] (* avoid intermediate collection *)
(1 .. 9).LinkedList.collectThenSelect(squared:/1) { :each | each > 36 }.Array = [49, 64, 81] (* avoid intermediate collection *)
[1 .. 9].LinkedList.reversed = [9 .. 1] (* reversed, species is Array *)
{ LinkedList().removeFirst }.ifError { :error | true } (* remove first, error if empty *)
{ LinkedList().removeLast }.ifError { :error | true } (* remove last, error if empty *)
| l = (1 .. 5).LinkedList; | l[3] = 3 (* index into *)
| l = (1 .. 5).LinkedList; | l[1] := -1; l.Array = [-1, 2, 3, 4, 5] (* mutate at index *)
| l = (1 .. 5).LinkedList; | l[3] := -3; l.Array = [1, 2, -3, 4, 5] (* mutate at index *)
(1 .. 9).LinkedList.firstLink.value = 1 (* first link *)
(1 .. 9).LinkedList.firstLink.nextLink.value = 2 (* second link *)
(1 .. 9).LinkedList.lastLink.value = 9 (* last link *)
| l = (1 .. 3).LinkedList; | l.firstLink.value := -1; l.Array = [-1, 2, 3] (* mutate link value *)
(1 .. 9).LinkedList.isSorted = true (* are elements in sequence *)
(9 .. 1).LinkedList.isSortedBy(greaterThan:/2) = true (* are elements in sequence by predicate *)
[1, 3 .. 9].LinkedList.indices = (1 .. 5) (* indices of linked list (an interval) *)
| l = (1 .. 9).LinkedList; | l.copy = l & { l.copy ~~ l } (* copy is equal but not identical *)
| l = (1 .. 9).LinkedList, c = l.copy; | c[1] := 9; c[1] = 9 & { l[1] = 1 } (* copies are distinct *)
```

## Magnitude -- numeric trait
```
1 < 3 = true (* less than *)
1.lessThan(3) = true
2 < 2 = false
3 < 1 = false
1 <= 3 = true (* less than or equal to, unicode = ≤ *)
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
3.minMax(1, 5) = 3.min(1).max(5)
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
var d = Map(); (d['x'] := 1) = 1 & { d['x'] = 1 } (* atPut (subscript mutation) syntax *)
var d = Map(); d[1] := 'x'; d[1] = 'x'
var d = Map(); d['x'] := 1; d.removeKey('x'); d.isEmpty = true
::x := 4; ::x * ::x = 16
::a := 'x' -> 1; [::a.key, ::a.value] = ['x', 1]
var d = (f: { :i | i * i }); d::f.value(9) = 81
{ Map().removeKey('unknownKey') }.ifError { true }
(x: 1, y: 1).withoutDuplicates = (x: 1)
var d = Map(); 1.toDo(100) { :i | d[i] := i; (i > 10).ifTrue { d.removeKey(i - 10) } }; d.size = 10
var c = Map(); c[2] := 'two'; c[1] := 'one'; c.removeKey(2); c[1] := 'one'; c.removeKey(1); c.includesKey(1) = false
(x: 1, y: 2).Map.includesKey('x') (* Record to Map, map includes key predicate *)
(x: 1, y: 2).Map ++ (x: 2, y: 1) = (x: 2, y: 1).Map (* appending a record to a Map answers a Map, biases right *)
(x: 1, y: 2, z: 3).Map ++ (x: 2, y: 1) = (x: 2, y: 1, z: 3).Map (* append record to Map *)
(x: 1, y: 2).Map ++ (x: 2, y: 1, z: 3) = (x: 2, y: 1, z: 3).Map (* append record to Map *)
(x: 1, y: 2).Map.json = '{"x":1,"y":2}' (* maps with string keys are encoded as records *)
(x: 1, y: 2, z: 3).Map.indices = ['x', 'y', 'z'] (* indices of map (an array) *)
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
{ 1 / nil }.ifError { true } (* operand not apatable to number *)
0.9.rounded = 1
1.rounded = 1
1.1.rounded = 1
-1.9.rounded = -2
-2.rounded = -2
-2.1.rounded = -2
1.5.rounded = 2 (* in case of tie, round to +infinity *)
-1.5.rounded = -1
| n = 10 ** 6; | n ~ (n + 1) & { 1 !~ 2 } (* a million is close to a million and one, but one is not close to two *)
```

## Matrix22 -- geometry type
```
Matrix22(1, 4, -1, 9).determinant = 13
Matrix22(-1, 3/2, 1,-1).inverse = Matrix22(2, 3, 2, 2)
Matrix22().rotation(pi / 2).applyTo(Vector2(0, 1)).closeTo(1@0)
```

## Matrix33 -- geometry type
```
Matrix33(1, 1, 1, 1, 0, 0, 0, 1, 0).inverse = Matrix33(0, 1, 0, 0, 0, 1, 1, -1, -1)
```

## Method
```
{ true + false }.ifError { true } (* boolean does not implement + *)
var f = { :x :y | x + y }; { f(true, false) }.ifError { true } (* boolean does not implement + *)
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
0.ifNil { false } = 0 (* nil conditional, answer receiver if not nil *)
0.ifNil { false } { true } (* nil conditional *)
ifNil(nil) { true } = true (* nil conditional *)
ifNil(0) { false } = 0 (* nil conditional *)
nil.printString = 'nil' (* nil print string *)
nil.storeString = 'nil' (* nil store string *)
nil.json = 'null' (* nil has a Json representation *)
'null'.parseJson = nil (* nil has a Json representation *)
```

## Number -- numeric trait
```
1 + 2.5 = 3.5 (* Addition of two numbers *)
10 - 8.5 = 1.5 (* Subtraction of two numbers *)
3.4 * 5 = 17 (* Multiplication of two numbers *)
8 / 2 = 4 (* Division of two numbers *)
2 ** 3 = 8 (* Exponentiation of a number *)
12 = 11 = false (* Equality between two numbers *)
12 ~= 11 = true (* Test if two numbers are different *)
12 > 9 = true (* Greater than *)
12 >= 10 = true (* Greater or equal than *)
12 < 10 = false (* Smaller than *)
2.718.truncated = 2 (* Truncate to integer *)
2.718.rounded = 3 (* Round to integer *)
2.718.roundTo(0.01) = 2.72 (* Round to a given precision *)
123456789.asStringWithCommas = '123,456,789'
123456.789.asStringWithCommas = '123,456.789'
13579.asStringWithCommas = '13,579'
159.asStringWithCommas = '159'
-9876543210.asStringWithCommas = '-9,876,543,210'
-987654.321.asStringWithCommas = '-987,654.321'
-97.531.asStringWithCommas = '-97.531'
-951.asStringWithCommas = '-951'
| i = 1; | 1.toDo(5) { :each | i := i + each.squared } ; i = 56 (* iterate over numbers from start to end *)
| i = 1; | 1.toByDo(5, 2) { :each | i := i + each.squared } ; i = 36 (* iterate over numbers from start to end by step *)
| i = 1; | (1 .. 3).do { :each | i := i + each.squared } ; i = 15 (* iterate over numbers from one to end *)
{ 23.size }.ifError { true } (* numbers do not have a size *)
{ 23.at(1) }.ifError { true } (* numbers are not indexable *)
{ 23.do { :each | nil } }.ifError { true } (* numbers are not iterable *)
```

## Object -- kernel trait
```
[1, 3, 5].typeOf = 'Array' (* name of type of object *)
[1, 3, 5].species = Array:/1
[1, 3, 5].Set.species = Set:/0
[1, 3, 5].Bag.species = Bag:/0
(x: 1, y: 3, z: 5).species = Record:/0
'b'.caseOf(['a' -> 1, 'b' -> 2, 'c' -> 3]) = 2
{ 'd'.caseOf(['a' -> 1, 'b' -> 2, 'c' -> 3]) }.ifError { true }
'b'.caseOfOtherwise(['a' -> 1, 'b' -> 2, 'c' -> 3]) { :notFound | false } = 2
'd'.caseOfOtherwise(['a' -> 1, 'b' -> 2, 'c' -> 3]) { :notFound | notFound = 'd' }
| z = [{ 'a' } -> { 1 + 1 }, { 'b' } -> { 2 + 2 }, { 'c' } -> { 3 + 3 } ]; | 'b'.caseOf(z) = 4
{ | z = [{ 'a' } -> { 1 + 1 }, { 'b' } -> { 2 + 2 } ]; | 'c'.caseOf(z) }.ifError { true }
3:2.perform('numerator') = 3 (* perform named unary method, name is not qualified *)
(3 -> 2).perform('key') = 3
3.perform('plus', 4) = 7 (* perform named binary method, name is not qualified *)
4:3.slotNameArray = ['numerator', 'denominator']
4:3.slotArray = ['numerator' -> 4, 'denominator' -> 3]
4:3.numerator = 4:3:@numerator (* slot access syntax *)
| n = 4:3; | n:@denominator := 5; n = 4:5 (* slot access syntax *)
pi.in { :x | x.rounded + 20 } = 23 (* evaluate procedure with object *)
```

## OrderedCollection -- collection trait
```
| a = [1, 2, 4]; | a.addBefore(3, 4); a = [1 .. 4] (* insert value before existing value *)
| a = [1, 2, 4]; | a.addAfter(3, 2); a = [1 .. 4] (* insert value after existing value *)
| a = ['w', 'x', 'z']; | a.addAfterIndex('y', 2); a = ['w', 'x', 'y', 'z'] (* insert value after index *)
| a = [2, 3]; | a.addFirst(1) = 1 & { a = [1, 2, 3] } (* insert value at start *)
| a = [4, 5]; | a.addAllFirst([1 .. 3]); a = [1 .. 5] (* add sequence at start *)
| a = [1, 2]; | a.addLast(3) = 3 & { a = [1, 2, 3] } (* insert value at end *)
| a = [1, 2]; | a.addAllLast([3 .. 5]); a = [1 .. 5] (* add sequence at end *)
| a = [1 .. 5]; | a.removeAt(3); a = [1, 2, 4, 5] (* remove element at index *)
| a = [1 .. 5]; | a.removeFirst; a = [2 .. 5] (* remove first element *)
| a = [1 .. 5]; | a.removeLast; a = [1 .. 4] (* remove last element *)
```

## Point -- geometry trait
```
0.asPoint.isPoint (* number to point, point predicate *)
0.asPoint.isZero (* are x and y both zero *)
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
typeOf:/1.typeOf = 'Procedure'
| i = 1; | { i < 5 }.whileTrue { i := i + 1 }; i = 5 (* mutate outer temporary *)
| i = 1; | whileTrue { i < 5 } { i := i + 1 }; i = 5 (* trailing closure syntax *)
{ }.numArgs = 0 (* procedure arity *)
{ :x | x }.numArgs = 1
{ :i :j | i }.numArgs = 2
{ :i :j :k | i }.numArgs = 3
{ :i :j :k :l | i }.numArgs = 4
collect:/2.numArgs = 2 (* method arity *)
{ { :i | i = nil }.value }.ifError { true } (* too few arguments, c.f. non-strict *)
{ { :x | 0 - x }.value(3, 4) = -3 }.ifError { true } (* too many arguments, c.f. non-strict *)
collect:/2.name = 'collect:/2'
var f = { :x | x * x }; [f(5), f.(5)] = [25, 25]
var f = { :x | x * x }; var d = (p: f); d::p.value(5) = 25
{ 0 }.cull(23) = 0 (* ignore one argument *)
{ 0 }.cull(23, 3.141) = 0 (* ignore two arguments *)
{ :x | x }.cull(23) = 23 (* recognise one argument *)
{ :x | x }.cull(23, 3.141) = 23 (* recognise one argument, ignore one argument *)
{ :x :y | x * y }.cull(23, 3.141) = 72.243 (* recognise two arguments *)
var f = { :x | x * x }; f(3) = 9
{ var f = { :x | x * x }; [3, 5, 7].collect(f) = [9, 25, 49] }.ifError { true }
var f = { :x | x * x }; [3, 5, 7].collect(f:/1) = [9, 25, 49]
{ :x | x * x }.map([3, 5, 7]) = [9, 25, 49] (* map is flipped collect *)
{ :x :y | x * y + y }.apply([3.141, 23]) = 95.243
{ { :x | x }.apply(0) }.ifError { true }
{ { :x | x }.apply([]) }.ifError { true }
| x = { }; | x.isProcedure (* blocks are objects and may be assigned to a variable *)
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
{ }.printString = 'a Procedure'
{ :x | x }.printString = 'a Procedure'
{ }.typeOf = 'Procedure'
{ }.value = nil (* empty procedure evaluates to nil *)
{ | x | }.value = nil (* empty procedure with unused temporary evaluates to nil *)
{ | x = 1; | }.value = nil (* empty procedure with unused initialised temporary evaluates to nil *)
{ | c a | c := [1]; a := { | a | a := 4; a }.value; { | a | a := 2; c.add(a); { | a | a := 3; c.add(a) }.value }.value; c.add(a); c }.value = [1, 2, 3, 4]
1.toDo(10) { :index | nil } = 1 (* answers start index *)
valueWithReturn { :return:/1 | 1.toDo(10) { :index | (index = 5).ifTrue { 5.return } } } = 5 (* non-local return *)
{ true }.assert = nil (* assert that block evaluates to true, answers nil *)
{ { false }.assert }.ifError { true } (* raise an error if block does not evaluate to true *)
valueWithReturn { :return:/1 | { (9.atRandom > 7).ifTrue { true.return } }.repeat } (* repeat a block until it "returns" *)
{ 1.anUnknownMessage }.ifError { :err | err }.isError = true (* evaluate error block on error *)
{ 1.anUnknownMessage }.ifError { true } = true (* error block is culled (i.e. may elide error argument) *)
| f = { | x = 0; | { x := x + 1; x } }, g = f.value; | [g.value, g.value] = [1, 2] (* closure *)
| f = { | x = 0; | { x := x + 1; x } }; | [f.value.value, f.value.value] = [1, 1] (* closures *)
| f = { :n | (n = 1).if { 1 } { f(n - 1) * n } }; | (7 .. 9).collect(f) = [5040, 40320, 362880]
```

## Promise -- kernel type
```
{ Promise() }.ifError { true } (* there is no void contructor *)
Error('f').Promise.catch { :err | (err.messageText = 'f').postLine }; true (* construct a rejected promise *)
1.resolvedPromise.then { :n | (n = 1).postLine }; true (* construct a resolved promise *)
var p = Promise { :t:/1 :f | t('t') }; p.then { :t | (t = 't').postLine }; p.isPromise
var p = Promise { :t :f:/1 | f('f') }; p.thenElse { :t | t.postLine } { :f | (f = 'f').postLine }; p.isPromise
var p = Promise { :t :f:/1 | f('f') }; p.then { :t | t.postLine }.catch { :f | (f = 'f').postLine }; p.isPromise
var p = Promise { :t :f:/1 | f('f') }; p.thenElse { :t | t.postLine } { :f | (f = 'f').postLine }.finally { 'true'.postLine }; p.isPromise
| f = { :c | Promise { :t:/1 :f | { t(c) }.evaluateAfter(0.15.randomFloat) } }; | [1.f, 2.f, 3.f].anyResolved.then { :t | [1, 2, 3].includes(t).postLine }; true
| f = { :c | Promise { :t:/1 :f | { t(c) }.evaluateAfter(0.05.randomFloat) } }; | ['x'.f, 'y'.f, 'z'.f].allResolved.then { :t | (t = ['x', 'y', 'z']).postLine }; true
```

## Pseudo variables
```
false.isBoolean (* constant *)
false.isBoolean (* constant *)
nil.isNil (* constant *)
pi.isNumber (* constant *)
inf.isNumber (* constant (infinity) *)
```

## Random -- system random number generator
```
9.randomInteger.isInteger (* random integers (1 to self) *)
var s = Set(); 729.timesRepeat { s.add(9.randomInteger) }; s.minMax = [1, 9] (* check distribution *)
var s = Set(); 729.timesRepeat { s.add(9.randomInteger) }; s.Array.sorted = [1 .. 9] (* check distribution *)
9.randomFloat.isNumber (* random floating point number (0 to self) *)
var s = Set(); 729.timesRepeat { s.add(9.randomFloat.rounded) }; s.minMax = [0, 9] (* check distribution *)
3.randomInteger(9).isInteger (* random integer in range *)
3.randomFloat(9).isNumber (* random float in range *)
var b = Bag(); 5000.timesRepeat { b.add(5.atRandom) }; b.contents.values.allSatisfy { :each | (each / 5000 * 5 - 1).abs < 0.1}
{ [].atRandom = nil }.ifError { true } (* random element of empty collection (nil if unsafe indexing is allowed) *)
[1].atRandom = 1 (* random element of one-element collection *)
var c = [1 .. 5]; c.includes(c.atRandom) (* answer random element from a collection *)
var a = [1 .. 5].Set, b = Bag(); 250.timesRepeat { b.add(a.atRandom) }; a = b.Set (* random element of collection *)
```

## Random -- sfc
```
| r = Random(98765); | r.typeOf = 'Random' (* type *)
| r = Random(98765); | r.isRandom (* predicate *)
| r = Random(98765); | r.randomFloat = 0.49556130869314075 (* random number in [0, 1) *)
| r = Random(98765); | r.randomFloat(10) = 4.9556130869314075 (* random number in [0, 10) *)
| r = Random(98765); | r.randomFloat(0, 100) = 49.556130869314075 (* random number in [0, 100) *)
| r = Random(98765); | r.randomInteger(1000) = 496 (* random integer in [1, 1000] *)
| r = Random(98765); | r.randomInteger(1, 10000) = 4956 (* random integer in [1, 10000] *)
| r = Random(), n = r.randomFloat; | n >= 0 & { n < 1 } (* seed from system clock *)
| r = Random(), s = Set(); | 729.timesRepeat { s.add(r.randomInteger(9)) }; s.minMax = [1, 9] (* check distribution *)
| r = Random(), s = Set(); | 729.timesRepeat { s.add(r.randomInteger(9)) }; s.Array.sorted = [1 .. 9] (* check distribution *)
```

## Random - mersenne twister
```
| m = MersenneTwister(98765); | m.typeOf = 'Random' (* type of *)
| m = MersenneTwister(98765); | m.isRandom (* predicate *)
| m = MersenneTwister(98765); | m.randomFloat = 0.088898599949636 (* random number in [0, 1) *)
| m = MersenneTwister(98765); | m.randomFloat(10) = 0.88898599949636 (* random number in [0, 10) *)
| m = MersenneTwister(98765); | m.randomFloat(0, 100) = 8.8898599949636 (* random number in [0, 100) *)
| m = MersenneTwister(98765); | m.randomInteger(1000) = 89 (* random integer in [1, 1000] *)
| m = MersenneTwister(98765); | m.randomInteger(1, 10000) = 889 (* random integer in [1, 10000] *)
| m = MersenneTwister(), r = m.randomFloat; | r >= 0 & { r < 1 } (* seed from system clock *)
MersenneTwister(123456).randomFloat = 0.12696983303810094 (* test from standard tests *)
| m = MersenneTwister(), s = Set(); | 729.timesRepeat { s.add(m.randomInteger(9)) }; s.minMax = [1, 9] (* check distribution *)
| m = MersenneTwister(), s = Set(); | 729.timesRepeat { s.add(m.randomInteger(9)) }; s.Array.sorted = [1 .. 9] (* check distribution *)
```

## ReadStream -- collection type
```
ReadStream().typeOf = 'ReadStream' (* type of read stream *)
ReadStream().isReadStream (* read stream predicate *)
ReadStream().atEnd = true (* read stream at end predicate *)
ReadStream().position = 0 (* initially the position is zero *)
(1 .. 5).ReadStream.size = 5 (* read stream from interval, read stream size *)
(1 .. 5).ReadStream.upTo(3) = (1 .. 2) (* read up to, but not including, an element *)
(1 .. 5).ReadStream.upTo(9) = (1 .. 5) (* read up to end if element is not located *)
(1 .. 5).ReadStream.contents = (1 .. 5) (* contents of finite stream (a copy of the collection)  *)
(1 .. 5).ReadStream.originalContents = (1 .. 5) (* original contents of stream (the actual collection *)
| r = (1 .. 5).ReadStream; | r.upToEnd; r.contents = (1 .. 5) (* contents of consumed stream *)
| r = [1 .. 5].ReadStream; | [r.next, r.next(3), r.next, r.next] = [1, [2, 3, 4], 5, nil]
| r = [1 .. 3].ReadStream; | [r.next, r.upToEnd] = [1, [2, 3]]
| r = (1 .. 5).ReadStream; | [r.peek, r.next] = [1, 1] (* peek at the next item *)
| r = (1 .. 5).ReadStream; | [r.peekFor(1), r.next] = [true, 2] (* peek or read next item *)
| r = (1 .. 5).ReadStream; | [r.peekFor(nil), r.next] = [false, 1] (* peek or read next item *)
| r = (1 .. 5).ReadStream; | r.upTo(3) = (1 .. 2) & { r.next = 4} (* matching element is consumed *)
| r = (1 .. 5).ReadStream; | r.skip(3); r.upToEnd = (4 .. 5) (* skip to a position *)
| r = (1 .. 9).ReadStream; | r.skipTo(7); r.upToEnd = (8 .. 9) (* skip to an object *)
| r = (1 .. 5).ReadStream; | r.position(3); r.skip(-1); r.next = 3 (* move to indicated position, which is the index before the next element *)
ReadStream().next = nil (* next at an empty read stream answers nil *)
{ ReadStream().position := -1 }.ifError { true } (* it is an error to move the position out of bounds *)
{ ReadStream().position := 1 }.ifError { true } (* it is an error to move the position out of bounds *)
| r = (9 .. 1).ReadStream; | [r.upTo(3), r.upToEnd] = [(9 .. 4), (2 .. 1)]
| r = (9 .. 1).ReadStream; | [r.upToPosition(3), r.upToEnd] = [(9 .. 7), (6 .. 1)] (* read from current position up to indicated position *)
| r = '.....ascii'.asciiByteArray.ReadStream, a = ByteArray(5); | r.skip(5); r.nextInto(a); a.asciiString = 'ascii'
(1 .. 9).ReadStream.nextSatisfy { :each | each >= 5 } = 5
(1 .. 9).ReadStream.take(23) = [1 .. 9]
(1 .. 9).ReadStream.nextMatchFor(1) = true
(1 .. 9).ReadStream.nextMatchAll([1, 2, 3]) = true
(1 .. 9).ReadStream.collection = Interval(1, 9, 1) (* read stream over interval collection *)
| r = (1 .. 9).ReadStream; | [r.next, r.back, r.next] = [1, 1, 1] (* go back one element and return it (by peeking) *)
| r = (1 .. 1000).ReadStream; | [r.next, r.next, r.atEnd] = [1, 2, false]
```

## Record -- collection type
```
().typeOf = 'Record'
().isRecord
().species = Record:/0
Record().isRecord
Record().includesKey('x') = false (* includes key predicate *)
(w: 0, x: 1).includesKey('x') = true
{ Record().at('x') }.ifError { true } (* lookup for non-existing key raises an error *)
{ ()['x'] }.ifError { true } (* lookup for non-existing key is an error *)
var d = Record(); d.atPut('x', 1) = 1 & { d.at('x') = 1 }
var d = Record(); (d['x'] := 1) = 1 & { d['x'] = 1 }
var d = Record(); d['x'] := 1; d['y'] := 2; d.size = 2
var d = Record(); d::x := 1; d::y := 2; d.size = 2
['x' -> 1, 'y' -> 2].Record['y'] = 2
{ Record().atPut(1, 1) }.ifError { true }
(x: 3.141, y: 23).json = '{"x":3.141,"y":23}' (* records have a json encoding where values do *)
'{"x":3.141,"y":23}'.parseJson = (x: 3.141, y: 23) (* parse json record *)
var d = (x: 1, y: 2), i = 9; d.associationsDo { :each | i := i - each.value } ; i = 6 (* iterate over associations *)
var d = (x: 1, y: 2); d.collect { :each | each * 9 } = (x: 9, y: 18)
(x: 23, y: 3.141).isDictionary
(x: pi)::x = pi
(x : pi) :: x = pi
var d = (x: 23, y: 3.141); d::x = 23
var d = (x: 23, y: 3.141); d::x := 42; d = (x: 42, y: 3.141)
(x: 1).copy = (x: 1) (* a copy of record is a record *)
| d = (x: 23, y: 3.141), c = d.copy; | d ~~ c & { d = c } (* copy is equal to but not identical to *)
| d = (x: 1, y: 2), c = d.copy; | c::x := 3; c::x = 3 & { d::x = 1 } (* copies are distinct *)
(x:1, y:2) ++ (z:3) = (x:1, y:2, z:3) (* white space after colon is optional *)
(x: 1, y: 2).associations = ['x' -> 1, 'y' -> 2] (* array of associations at record *)
(x: 1, y: 2).Array = [1, 2] (* values as Array *)
var d = (x:1, y:2, z:3), (x, z) = d; [x, z] = [1, 3]
var (x, y) = { var n = system.randomFloat; (x: n, y: n) }.value; x = y
(x:1, y:2, z:3).select(even:/1) = (y: 2)
(x:1, y:2, z:3).sum = 6
var d = (x: 9); d::x.sqrt = 3
size (x: 1, y: 2, z: 3) = 3
var c = (y: 2, z: 3), r = (x: 1); r.addAll(c); r = (x: 1, y: 2, z: 3) (* add all elements of a Dictionary to a Dictionary *)
var c = (y: 2, z: 3); (x: 1).addAll(c) = c (* answer is argument *)
var d = (c: 3, parent: (b: 2, parent: (a: 1))); ['a', 'b', 'c'].collect { :each | d.atDelegateTo(each, 'parent') } = [1, 2, 3]
var d = (c: 3, parent: (b: 2, parent: (a: 1))); ['a', 'b', 'c'].collect { :each | d.messageSend(each, 'parent', []) } = [1, 2, 3]
var d = (x: 1, parent: (y: 2, parent: (z: 3))); d.atPutDelegateTo('z', -3, 'parent'); d.atDelegateTo('z', 'parent') = -3
var d = (c: 3, parent: (b: 2, parent: (a: 1))); [d:.a, d:.b, d:.c] = [1, 2, 3] (* :. is atDelegateTo 'parent' *)
| d = (x: 1, parent: (y: 2, parent: (z: 3))); | d:.x := -1; [d:.x, d:.y, d:.z] = [-1, 2, 3] (* :. & := is atPutDelegateTo 'parent' *)
| d = (x: 1, parent: (y: 2, parent: (z: 3))); | d:.y := -2; [d:.x, d:.y, d:.z] = [1, -2, 3]
| d = (x: 1, parent: (y: 2, parent: (z: 3))); | d:.z := -3; [d:.x, d:.y, d:.z] = [1, 2, -3]
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
(x: 1, y: 2) = (x: 1, y: 2) (* Record equality *)
(x: 1, y: 2) ~= (x: 2, y: 1) (* Record in-equality *)
| r = (x: 1, y: 2); | r == r (* Record identity *)
(x: 1, y: 2) ~~ (x: 1, y: 2) (* Record non-identity *)
(x: 1, y: 2, z: 3).indices = ['x', 'y', 'z'] (* indices of record (an array) *)
```

## Rectangle -- geometry type
```
Rectangle(0@0, 1@1).printString = 'Rectangle(0@0, 1@1)'
Rectangle(0@0, 2@2).intersect(Rectangle(1@1, 4@4)) = Rectangle(1@1, 2@2)
Rectangle(1@1, 3@3).area = 4
Rectangle(1@1, 3@3).center = Vector2(2, 2)
Rectangle(1@1, 3@3).containsPoint(2@2) = true
| o = 0@0, p = 10@10, q = 0 - p; | [Rectangle(q, o), Rectangle(o, p)].rectangleMerging = Rectangle(q, p)
| r = (0@0).extent(10@20); | r.area = (10 * 20) (* area is width by height *)
| r = (0@0).extent(10@20); | r.translateBy(-20@10).area = (10 * 20) (* translation preserves area *)
| r = (10@20).corner(0@0); | r.area = 0 (* the area of an empty rectangle is zero *)
| r = (10@20).corner(0@20); | r.area = 0 (* the area of an empty rectangle is zero *)
| r = (0@20).corner(10@0); | r.area = 0 (* the area of an empty rectangle is zero *)
| r = (0@0).extent(10@20), c = r.center; | r.containsPoint(c) (* the center is inside the rectangle *)
| r = (0@0).extent(10@20), c = r.center; | r.topLeft.distance(c) = r.bottomRight.distance(c)
| r = (0@0).extent(10@20), c = r.center; | r.bottomLeft.distance(c) = r.topRight.distance(c)
| r = (0@0).extent(10@20), c = r.center; | r.topLeft.distance(c) = r.bottomLeft.distance(c)
| r = (0@0).extent(10@20), c = r.center; | r.translateBy(-20@10).center = c.translateBy(-20@10) (* the center is translated with the rectangle *)
| r = (30@10).corner(10@20), c = r.center; | r.containsPoint(c).not  (* an empty rectangle does not contain any point *)
| r = (0@0).extent(50@50); | [r.center, 1.5@1.5, r.topLeft, r.topRight, r.bottomLeft, r.bottomRight].collect { :each | r.containsPoint(each) } = [true, true, true, false, false, false]
| r = (10@10).extent(20@30); | r.containsPoint(r.origin) (* a rectangle does contain its origin *)
| r = (10@10).extent(20@30); | r.containsPoint(r.corner).not (* a rectangle does not contain its corner *)
| r = (0@0).extent(50@50), pt = r.randomPoint; | r.containsPoint(pt) (* a rectangle contains any random point in it *)
| r = (0@0).extent(50@50); | r.pointAtFraction(0.5@0.5) = r.center (* pointAtFraction can find the center *)
| r = (10@20).corner(30@50); | (10@20).corner(30@35) = r.topHalf & { (10@20).corner(30@27.5) = r.topHalf.topHalf }
| r = (10@20).corner(30@50); | (10@20).corner(20@35) = r.topLeftQuadrant
| r = (10@20).corner(30@50); | (10@20).corner(15@27.5) = r.topLeftQuadrant.topLeftQuadrant
| r = (10@20).corner(30@50); | (20@20).corner(30@35) = r.topRightQuadrant
| r = (10@20).corner(30@50); | (25@20).corner(30@27.5) = r.topRightQuadrant.topRightQuadrant
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

## RunArray -- collection type
```
| a = RunArray([1, 3, 5], ['a', 'b', 'c']); | a.isRunArray & { a.size = 9 } (* from runs and values, size is sum of runs *)
| a = RunArray([1, 3, 5], ['a', 'b', 'c']); | a.size = 9 & { a.Array.join = 'abbbccccc' } (* as array *)
| a = RunArray([1 -> 'a', 3 -> 'b', 5 -> 'c']); | a.size = 9 & { a.Array.join = 'abbbccccc' } (* from associations *)
| a = RunArray([1 4 2 1], [9 7 5 3]); | a.size = 8 & { a.Array = [9 7 7 7 7 5 5 3] }
{ | a = RunArray([1 -> 'a', 3 -> 'b']); | a[5] }.ifError { true } (* invalid index *)
| a = RunArray([1, 4, 2, 1], 'abca'.split); | a.first = 'a' & { a.last = 'a' } (* first and last are optimized *)
| a = RunArray([1, 4, 2], 'abc'.split); | a.includes('c') & { a.isSorted } (* includes and isSorted are optimized *)
RunArray([1, 4, 2], ['a', 'b', 'c']).reversed = [2 -> 'c', 4 -> 'b', 1 -> 'a'].RunArray (* reversed is optimized *)
| a = [23 -> 'a', 34 -> 'b', 45 -> 'a'].RunArray; | (a.allocatedSize / a.size * 100).rounded = 9 (* space saving, in % *)
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
[].isSorted (* an empty sequence is sorted *)
[1].isSorted (* a one element sequence is sorted *)
[11, 9 .. 1].isSortedBy { :i :j | i > j } (* is sequence sorted by predicate *)
[1, 5, 3, 7, 9].isSorted.not (* is sequence sorted *)
[1, 3, 5, 7, 9].copyFromTo(3, 5) = [5, 7, 9] (* copy part of collection, one-indexed, inclusive *)
[1, 3, 5, 7, 9].indexOfSubCollection([5, 7, 9]) = 3 (* locate index of subsequence *)
[1, 3, 5, 7, 9].indexOf(5) = 3 (* index of element (compared using =) *)
[1, 3, 5, 7, 9].first = 1 (* first element of sequence *)
[1 .. 9].first(5) = [1 .. 5] (* first n elements of sequence *)
{ [1 .. 9].first(11) }.ifError { true } (* error if too few elements *)
| a = (1 .. 9); | a.first = a[1] (* one-indexed *)
[1, 3, 5, 7, 9].last = 9 (* last element of *)
[1 .. 9].last(5) = [5 .. 9] (* last n elements of *)
{ [1 .. 9].last(11) }.ifError { true } (* too few elements *)
| i = (1 .. 9); | i.last = i[9] (* intervals are one-indexed sequences *)
[1, 3, 5, 7, 9].middle = 5 (* middle element of *)
[1 .. 4].beginsWith([1, 2]) = true (* is prefix of *)
[1 .. 4].beginsWith([]) = true (* empty prefix *)
| n = 0, i = (1 .. 4); | i.permutationsDo { :each | n := n + 1 }; n = 24 (* interval permutations do *)
| n = 0, a = [1 .. 4]; | a.permutationsDo { :each | n := n + 1 }; n = 24 & { a = [1 .. 4] } (* array permutations do *)
| a = [1 .. 3].permutations; | a = [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 2, 1], [3, 1, 2]] (* permutations *)
| i = (4, 7 .. 13), p = i.permutations; | p.size = i.size.factorial & { p.Set.size = p.size }
| i = (4, 7 .. 13); | i.permutations.allSatisfy { :e | e.sorted.hasEqualElements(i) }
[1, 9, 2, 8, 3, 7, 4, 6].pairsCollect { :i :j | i + j } = [10, 10, 10, 10]
var s = ''; [1, 9, 2, 8, 3, 7, 4, 6].pairsDo { :i :j | s := s ++ (i + j).printString }; s = '10101010'
var s = ''; [1, 9, 2, 8, 3, 7, 4, 6].reverseDo { :i | s := s ++ i.printString }; s = '64738291' (* do from end *)
[1, 2, 2, 3, 3, 3, 4, 4, 4, 4].withoutDuplicates = [1, 2, 3, 4] (* copy without duplicates, retain order *)
([1, 3 .. 9] ++ [1, 3 .. 9] ++ [2, 4 .. 10] ++ [2, 4 .. 10]).withoutDuplicates = [1, 3, 5, 7, 9, 2, 4, 6, 8, 10]
[1 .. 9].hasEqualElements((1 .. 9)) (* an array is not equal to an interval, but can have equal elements *)
(1 .. 9).hasEqualElements([1 .. 9]) (* an interval is not equal to an array, but can have equal elements *)
[1 .. 9] ~= (1 .. 9) (* an array is not equal to an interval *)
(1 .. 9) ~= [1 .. 9] (* an interval is not equal to an array *)
[1.5 .. 9.5].middle = 5.5 (* range start need not be an integer *)
var c = [1 .. 5]; c.swapWith(1, 4); c = [4, 2, 3, 1, 5]
{ [1 .. 5].swapWith(1, 9) }.ifError { true }
[1, [2, [3, [4, [5], 6], 7], 8], 9].flattened = [1 .. 9] (* concatenation removing all nesting *)
[1, [2, [3, ['45', 6], '78']], 9].flattened = [1, 2, 3, '45', 6, '78', 9] (* strings are not flattened to sequences of characters *)
[3, 4, [2, 4, ['xy'], 'wz']].flattened = [3, 4, 2, 4, 'xy', 'wz']
[1 .. 9].rotateLeft(3) = ([4 .. 9] ++ [1 .. 3]) (* rotate left *)
[1 .. 9].rotateRight(3) = ([7 .. 9] ++ [1 .. 6]) (* rotate right *)
| d = []; | (3 .. 1).withDo((1 .. 3)) { :p :q | d.add(p -> q) } ; d = [3 -> 1, 2 -> 2, 1 -> 3]
| d = []; | (3 .. 1).reverseWithDo((1 .. 3)) { :p :q | d.add(p -> q) } ; d = [1 -> 3, 2 -> 2, 3 -> 1]
| d = []; | (3 .. 1).withIndexDo { :each :index | d.add(each -> index) } ; d = [3 -> 1, 2 -> 2, 1 -> 3]
(9 .. 1).withCollect((1 .. 9)) { :p :q | p * 2 + q } = [19 .. 11]
(9 .. 1).withIndexCollect { :each :index | each * 2 + index } = [19 .. 11]
[1, 3, 5, 7, 11, 15, 23].findBinary { :arg | 11 - arg } = 11
[1, 3, 5, 7, 11, 15, 23].findBinaryIndex { :arg | 11 - arg } = 5
{ [1, 3, 5, 7, 11, 15, 23].findBinaryIndex { :arg | 12 - arg } }.ifError { true }
[1, 3, 5, 7, 11, 15, 23].findBinaryIndexIfNone { :arg | 12 - arg } { :a :b | [a, b] } = [5, 6]
[1, 3, 5, 7, 11, 15, 23].findBinaryIndexIfNone { :arg | 0.5 - arg } { :a :b | [a, b] } = [0, 1] (* note 0 is not a valid index *)
[1, 3, 5, 7, 11, 15, 23].findBinaryIndexIfNone { :arg | 25 - arg } { :a :b | [a, b] } = [7, 8] (* note 8 is not a valid index *)
[1, 3, 5, 7, 11, 15, 23].findBinaryIfNone { :arg | 11 - arg } { :a :b | [a, b] } = 11
[1, 3, 5, 7, 11, 15, 23].findBinaryIfNone { :arg | 12 - arg } { :a :b | [a, b] } = [11, 15]
[1, 3, 5, 7, 11, 15, 23].findBinaryIfNone { :arg | 0.5 - arg } { :a :b | [a, b] } = [nil, 1]
[1, 3, 5, 7, 11, 15, 23].findBinaryIfNone { :arg | 25 - arg } { :a :b | [a, b] } = [23, nil]
| a = []; | (0 .. 1).asDigitsToPowerDo(2) { :each | a.add(each.copy) }; a = [[0, 0], [0, 1], [1, 0], [1, 1]]
['one', 'two', 'three', 'four'].atAll([3, 2, 4]) = ['three', 'two', 'four'] (* at each index *)
(1 .. 9).atAll((3 .. 5)) = [3 .. 5] (* at each index *)
| a = ['1', '2', '3', '4']; | a[3, 2, 4] = ['3', '2', '4'] (* at each index syntax *)
| a = Array(9); | a.atAllPut(0); a = [0, 0, 0, 0, 0, 0, 0, 0, 0] (* set all elements to a single value *)
| a = [1 .. 9]; | a.atAllPut([3 .. 7], 0); a = [1, 2, 0, 0, 0, 0, 0, 8, 9] (* set all selected indices to a value *)
| a = [1 .. 9]; | a.atAllPut((3 .. 7), 0); a = [1, 2, 0, 0, 0, 0, 0, 8, 9] (* set all selected indices to a value *)
| a = [1 .. 9]; | a.atAllPutAll([3 .. 7], [7 .. 3]); a = [1, 2, 7, 6, 5, 4, 3, 8, 9] (* set all selected indices to corresponding values *)
| a = [1 .. 9]; | a.atAllPutAll((3 .. 7), (7 .. 3)); a = [1, 2, 7, 6, 5, 4, 3, 8, 9] (* set all selected indices to corresponding values *)
| a = [1 .. 9]; | a.replace { :each | each * each }; a = [1, 4, 9, 16, 25, 36, 49, 64, 81] (* in place collect *)
| c = [7, 2, 6, 1]; | c.sorted = [1, 2, 6, 7] & { c.sorted ~= c } (* sorted copy *)
| c = [7, 2, 6, 1]; | c.sort = [1, 2, 6, 7] & { c = [1, 2, 6, 7] } (* sort in place *)
[7, 2, 6, 1].SortedArray.contents = [1, 2, 6, 7]
[7, 2, 6, 1].sorted(greaterThan:/2) = [7, 6, 2, 1]
| n = 0; | [3 .. 7].allButFirstDo { :each | n := n + each }; n = [4 .. 7].sum (* iterate skipping first element *)
| n = 0; | [3 .. 7].allButLastDo { :each | n := n + each }; n = [3 .. 6].sum (* iterate skipping last element *)
| a = []; | (1 .. 4).combinationsAtATimeDo(3) { :each | a.add(each.copy) }; a = [[1, 2, 3], [1, 2, 4], [1, 3, 4], [2, 3, 4]]
| a = []; | (1 .. 5).combinationsAtATimeDo(3) { :each | a.add(each.sum) }; a = [6, 7, 8, 8, 9, 10, 9, 10, 11, 12]
| a = []; | (1 .. 9).fromToDo(3, 7) { :each | a.add(each) }; a = [3 .. 7] (* partial iterator *)
| a = []; | [1 / 3, 1 / 4, 1 / 4, 0.9, 1 / 3, 1].groupsDo { :p :q :r | a.add(p.roundTo(q) = r) }; a = [true, true]
| a = []; | (9 .. 1).keysDo { :index | a.add(index * 2) }; a = [2, 4 .. 19] (* keys are indices *)
| a = []; | (9 .. 1).keysAndValuesDo { :key :value | a.add(key * 2 + value) }; a = [11 .. 19] (* keys are indices *)
| a = []; | (9 .. 7).keysAndValuesDo { :key :value | a.add(key -> value) }; a = [1 -> 9, 2 -> 8, 3 -> 7](* keys are indices *)
| a = []; | (9 .. 7).withIndexDo { :each :index | a.add(index -> each) }; a = [1 -> 9, 2 -> 8, 3 -> 7](* index is second argument *)
| a = [1 .. 5]; | a.atIncrementBy(3, 6); a = [1, 2, 9, 4, 5] (* increment value at index by *)
| a = [1 .. 9]; | a.atLastPut(3, -7); a = [1, 2, 3, 4, 5, 6, -7, 8, 9] (* set at index from end *)
'string'.split.sorted = ['g', 'i', 'n', 'r', 's', 't']
'string'.split.sortedWithIndices = ['g' -> 6, 'i' -> 4, 'n' -> 5, 'r' -> 3, 's' -> 1, 't' -> 2]
| a = 'string'.split; | a.atAll([6, 4, 5, 3, 1, 2]) = a.sorted
[1, 3, 2, 5, 4].sortedWithIndices = [1 -> 1, 2 -> 3, 3 -> 2, 4 -> 5, 5 -> 4]
[1, 3, 2, 5, 4].atAll([1, 3, 2, 5, 4]) = [1 .. 5]
| a = [2 .. 5], b = a.copyWithFirst(1); | a ~= b & { b = [1 .. 5] } (* copy with new first element *)
| a = [1 .. 7]; | a.replaceFromToWith(3, 5, [-3, -4, -5]); a = [1, 2, -3, -4, -5, 6, 7]
{ [1 .. 7].replaceFromToWith(3, 5, [-3, -4]) }.ifError { true } (* replacement must be of equal size *)
| a = [1 .. 7]; | a.replaceFromToWithStartingAt(3, 5, [-3, -4, -5], 1); a = [1, 2, -3, -4, -5, 6, 7]
[1 .. 7].forceToPaddingWith(9, 0) = [1, 2, 3, 4, 5, 6, 7, 0, 0] (* copy of sequence with required length and initializer *)
[1 .. 7].forceToPaddingWith(5, 0) = [1 .. 5] (* partial copy *)
| a = [1 .. 4]; | a += 8; a = [9 .. 12] (* in place array/scalar addition *)
| a = [1 .. 4]; | a += [4 .. 1]; a = [5, 5, 5, 5] (* in place array/array addition *)
| a = [5 .. 8]; | a -= 4; a = [1 .. 4] (* in place array/scalar subtraction *)
| a = [5 .. 8]; | a -= [4 .. 1]; a = [1, 3 .. 7] (* in place array/array subtraction *)
| a = [1 .. 4]; | a *= 2; a = [2, 4 .. 8] (* in place array/scalar multiplication *)
| a = [1 .. 4]; | a *= [4 .. 1]; a = [4, 6, 6, 4] (* in place array/array multiplication *)
| a = [2, 4 .. 8]; | a /= 2; a = [1, 2 .. 4] (* in place array/scalar division *)
| a = [2, 4 .. 8]; | a /= [1 .. 4]; a = [2, 2, 2, 2] (* in place array/array division *)
| a = [9 .. 1]; | a.withReplace((1 .. 9)) { :p :q | p * 2 + q }; a = [19 .. 11] (* in place withCollect *)
[7 .. 4].indexValueAssociations = [1 -> 7, 2 -> 6, 3 -> 5, 4 -> 4] (* the (index -> value) associations of a sequence *)
| a = []; | (x: 1, y: 2, z: 3).indicesDo { :each | a.add(each) }; a = ['x', 'y', 'z'] (* iterate indices *)
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
{ [1 .. 5] + [6 .. 9] = [7, 9, 11, 13, 11] }.ifError { true } (* sequences must be of equal size, Sc/Lang extends this behaviour *)
[1 .. 5].squared = [1, 4, 9, 16, 25] (* unary math lifted to collection *)
[1, 4, 9, 16, 25].sqrt = [1 .. 5] (* unary math lifted to collection *)
```

## Set -- collection type
```
Set().isSet (* set type predicate *)
Set().size = 0 (* count items in set *)
Set().isEmpty (* is set empty? *)
[1, 1, 2, 1, 2, 3].Set.size = 3 (* array to set *)
[1, 3, 5, 3, 1].Set.isSet = true
[1, 3, 5, 3, 1].Set.size = 3
[1, 3, 5, 3, 1].Set.includes(3) = true (* does set include item *)
[1, 3, 5, 3, 1].Set.includes(7) = false
[1, 5, 3, 5, 1].Set.Array = [1, 5, 3] (* set from array to array *)
[1, 5, 3, 5, 1].Set.sorted = [1, 3, 5] (* a sorted set is an array *)
| s = [1 .. 5].Set; | s ~~ s.Set (* a Set formed from a Set is not identical to the initial set *)
| s = [1 .. 5].Set; | s = s.Set (* a Set formed from a Set is equal to the initial set *)
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
var s = (1 .. 9).Set; s.intersection(s) = s (* set intersection, self intersection is identity *)
(1 .. 4).Set.intersection((5 .. 9).Set) = [].Set (* set intersection, empty intersection *)
(1 .. 5).Set.intersection((4 .. 9).Set) = [4, 5].Set (* set intersection *)
var s = (1 .. 9).Set; s.remove(5); [s.includes(5), s.includes(9)] = [false, true]
var s = (1 .. 9).Set; var t = s.copy; var n = t.size; s.removeAll; [s.size = 0, t.size = n] = [true, true]
(1 .. 4).Set.union((5 .. 9)) = (1 .. 9).Set (* set union *)
| s = (1 .. 4).Set, t = (5 .. 9), u = s.union(t); | u.size = (s.size + t.size) (* set union is not mutating *)
(1 .. 5).Set.ifAbsentAdd(3) = false
[1 .. 9].Set.select { :each | false } = [].Set (* select nothing *)
| s = Set(); | s.addAll([4 / 2, 4, 2]); s.size = 2
[1, 2, 3, 1, 4].Set = [1, 2, 3, 4, 3, 2, 1].Set = true
(1 .. 6).union((4 .. 10)) = (1 .. 10).Set (* set union *)
'hello'.split.intersection('there'.split) = 'he'.split (* set intersection *)
'Smalltalk'.split.includes('k') = true
[1, 2, 3, 1, 4].Set.isIndexable = false (* sets are not indexable *)
[1, 2, 3, 1, 4].Set.indices = nil (* sets are not indexable *)
[1, 2, 2, 3, 3, 3].Set.occurrencesOf(3) = 1 (* number of occurrences of element in set (zero or one) *)
[1, 3, 3, 3].Set.occurrencesOf(2) = 0 (* number of occurrences of element in set (zero or one) *)
```

## SmallFloat -- numeric type
```
3.141.typeOf = 'SmallFloat'
3.141.SmallFloat = 3.141 (* SmallFloat is identity, c.f. Fraction>>SmallFloat *)
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
-9.quotient(4) = -2 (* quotient, quo: in St *)
-0.9.quotient(0.4) = -2 (* quotient, quo: in St *)
9.remainder(4) = 1 (* remainder, rem: in St *)
-9.remainder(4) = -1
0.9.remainder(0.5) = 0.4
0.9.remainder(0.4) ~ 0.1 (* approximately equal to *)
| total = 0; | 9.timesRepeat { total := total + system.randomFloat }; total < 7
3.max(7) = 7
3.max(7) = 7.max(3)
7.min(3) = 3
3.min(7) = 7.min(3)
12345.truncateTo(600) = 12000
13.betweenAnd(11, 14) = true (* is number between two numbers, inclusive *)
[1 .. 5].collect { :each | each.betweenAnd(2, 4) } = [false, true, true, true, false]
9.atRandom.isInteger = true
9.randomInteger.isInteger = true
9.randomFloat.isInteger = false
pi.randomFloat.isInteger = false
[3.141.json, 23.json] = ['3.141', '23'] (* numbers have json encodings *)
['3.141', '23'].collect(parseJson:/1) = [3.141, 23] (* parse json numbers *)
| r | 1.toDo(5) { :each | r := each }; r = 5
| r | 1.to(0).do { :each | r := each }; r = nil
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
60.divisors = [1, 2, 3, 4, 5, 6, 10, 12, 15, 20, 30, 60]
1729.divisors = [1, 7, 13, 19, 91, 133, 247, 1729]
e() = 1.exp
e = e() (* e is a constant, like pi *)
epsilon() < (10 ** -15)
epsilon() > (10 ** -16)
1 - epsilon() ~= 1 (* epsilon() is the difference between 1.0 and previous representable value *)
epsilon ~= epsilon() (* epsilon is a constant, like pi & e *)
pi = 3.141592653589793 (* pi is a number *)
epsilon = 0.000000000000001 (* epsilon is a number *)
e = 2.718281828459045 (* e is a number *)
(1 - epsilon).veryCloseTo(1)
inf.isFinite = false
pi.isFinite = true
{ nil.isFinite }.ifError { true }
5.closeTo(5) = true
5.closeTo('5') = false
5.closeTo(3) = false
(5/3).closeTo(5/3) = true
(1/3).closeTo(0.3333) = true
(1/3).closeTo(0.333) = false
[-1000000000000000, -100, -5, -3, -2, -1, 0, 1].select(isPrime:/1).isEmpty
[17, 78901, 104729, 15485863, 2038074743].allSatisfy(isPrime:/1)
[561, 2821, 6601, 10585, 15841, 256, 29996224275831].noneSatisfy(isPrime:/1) (* no primes here *)
1.00001.reduce = 1 (* round if number is closeTo an integer *)
1.5.reduce = 1.5 (* identity if number is not closeTo an integer *)
| x = (2 ** 54); | x ~= (x - 1) = false (* large numbers behave strangely *)
| x = (2.0 ** 54.0); | x ~= (x - 1.0) = false (* large numbers behave strangely *)
[-1, 0, 1].collect(asString:/1) = ['-1', '0', '1']
inf.asString = 'inf' (* inf prints as inf *)
(0 - inf).asString = '(0 - inf)'
pi.printString = '3.141592653589793'
pi.storeString = '3.141592653589793'
23.isInteger (* is a small float an integer *)
23.isSmallInteger (* is a small float a small integer *)
(2 ** 53) = 9007199254740992 (* a small float that is an integer that is beyond the range of small integers *)
(2 ** 53).isInteger (* is a small float an integer *)
(2 ** 53).isSmallInteger = false (* is a small float a small integer *)
23.assertIsSmallInteger = 23 (* require that a number be a small integer *)
{ 3.141.assertIsSmallInteger }.ifError { true } (* raise an error if value is not a small integer *)
{ (2 ** 53).assertIsSmallInteger }.ifError { true }
100.factorial / 99.factorial ~ 100 (* small float factorial *)
| n = 9007199254740992; | n + 0.1 = n (* ieee floating point *)
9007199254740990.0 + 10.1 = 9007199254741000.1 (* ieee floating point *)
(4 // 3) + (4 // 5) = 1 (* integer division *)
(4 / 3) + (4 / 5) = (32 / 15) (* floating point division *)
| n = 23453456; | (n * n).sqrt = n (* floating point square and square root *)
2 ** [0, 1, 3, 8] = [1, 2, 8, 256] (* number raised to array *)
-2 ** [8, 7] = [256, -128] (* negative number raised to array *)
0 ** [5, 0] = [0, 1] (* zero raised to array *)
[2.5, 1.5] ** [2, 4] = [6.25, 5.0625] (* array raised to array *)
10 ** [-1, -2] = [0.1, 0.01] (* raised to negative numbers *)
2 ** [1.5, 2.4, 2.9, -2.2] = [2.82842712474619, 5.278031643091577, 7.464263932294459, 0.217637640824031] (* non integer exponents *)
2 ** 100 = 1267650600228229401496703205376 (* ieee precision *)
(1 / 2).asString = '0.5' (* division prints as floating point *)
1.0 = 1 (* there is no distinct integer type *)
[1, 1.4, 1.49999, 1.5, 1.50000001].rounded = [1, 1, 1, 2, 2] (* rounding *)
[14 / 10, 44534 / 100].rounded = [1, 445] (* rounding *)
pi.sin.abs < 0.00000000001 (* sin of pi is close to zero *)
(pi / 2).sin > 0.9999999999 (* sin of two pi is close to one *)
0 = -0 (* zero is equal to negative zero *)
92233720368 * 100000000 + 54775807 = 9223372036854775807 (* reader for large small float integer literals *)
| n = 3.141; | n.copy == n (* copy is identity *)
pi.in { :pi | pi } = pi (* pi is a constant, it can be shadowed *)
| pi = 23; | pi = 23 (* pi is a constant, it can be shadowed *)
pi.zero = 0 (* zero of same type, i.e. small float *)
pi.one = 1 (* one of same type, i.e. small float *)
```

## SmallFloat -- modulo
```
3 % 2 = 1
3 % 3 = 0
-3 % 2 ~= -1 (* ? *)
-3 % -2 = -1
3 % -2 ~= 1 (* ? *)
3 % 3 = 0
-3 % -3 = 0
3 % -3 = 0
```

## SortedArray -- collection type
```
SortedArray().isSortedArray (* sorted array *)
SortedArray().species = SortedArray:/0 (* species is sorted array *)
SortedArray().size = 0 (* query size *)
| a = SortedArray(); | a.add(3); a.add(1); a.add(2); a.contents = [1 .. 3] (* add inserts items into sequence *)
| a = [3, 1].SortedArray; | a.add(2); a.contents = [1 .. 3] (* sorted array from array *)
| a = [7, 5 .. 1].SortedArray; | a.addAll([8, 6 .. 2]); a.contents = [1 .. 8] (* add all elements of collection into sequence *)
| a = [9 .. 1].SortedArray; | a.collect { :x | 9 - x }; a.contents = [1 .. 9] (* collect into ordered collection *)
| a = [1 .. 9].SortedArray(greaterThan:/2); | a.contents = [9 .. 1] (* sorted array with specified sort procedure *)
| a = [5 .. 9].SortedArray(greaterThan:/2); | a.addAll([1 .. 4]); a.contents = [9 .. 1]
(1 .. 10).SortedArray.median = 5
| a = SortedArray(); | a.add('truite'); a.add('porcinet'); a.add('carpe'); a.median = 'porcinet'
[5, 2, 50, -10].SortedArray.Array = [-10, 2, 5, 50]
'hello'.split.SortedArray.Array = 'ehllo'.split
```

## Stack - collection type
```
Stack().typeOf = 'Stack' (* Stack is a type *)
Stack().isStack (* empty stack, stack predicate *)
Stack().isEmpty (* empty stack, empty predicate *)
Stack().size = 0 (* empty stack, size *)
| s = Stack(); | s.push(pi); [s.size, s.top, s.size] = [1, pi, 1] (* push element onto stack, inspect top of stack *)
| s = Stack(); | s.push(pi); [s.size, s.pop, s.size] = [1, pi, 0] (* push element onto stack, inspect top of stack *)
| s = Stack(); | s.push('x'); s.push('y'); [s.size, s.pop, s.size, s.pop, s.size] = [2, 'y', 1, 'x', 0] (* push two elements, pop two elements *)
{ | s = Stack(); | s.pop }.ifError { true } (* cannot pop from empty stack *)
| s = Stack(); | s.push('x') = 'x' (* push answers object pushed *)
| s = Stack(); | s.push('x'); s.copy = s & { s.copy ~~ s } (* copy is equal but not identical *)
```

## String -- text type
```
'quoted string'.isString (* quoted string *)
'string'.isAsciiString = true (* does string contain only ascii characters *)
'Mačiūnas'.isAsciiString = false (* ascii does not include diacritics *)
''.isAsciiString = true (* the empty string is an ascii string *)
128.Character.string.isAsciiString = false (* not all byte arrays are ascii *)
'x' ++ 'y' = 'xy' (* append (catenation) *)
'x' ++ 1 = 'x1' (* append, right hand side need not be a string *)
'string'.asciiByteArray = [115, 116, 114, 105, 110, 103].ByteArray (* String to ByteArray of Ascii encoding *)
{ 'Mačiūnas'.asciiByteArray }.ifError { true } (* non-ascii characters *)
'3.4'.asNumber = 3.4 (* parse float *)
'3'.asInteger = 3 (* parse integer *)
'string'.at(4) = 'i'.Character (* one-indexing *)
'string'[4] = 'i'.Character (* one-indexing (bracket notation) *)
{ 'string'[7] }.ifError { true } (* error on out of range index *)
''.isEmpty = true (* empty string predicate *)
'string'.isEmpty = false (* is empty string *)
'string'.size = 6 (* length *)
['m', 'ss', 'ss', 'pp', ''].join = 'msssspp' (* join *)
['x', 1, 'y', 2, 'z', 3].join = 'x1y2z3' (* all items need not be strings *)
[1, 2, 3].join = '123' (* no items need be strings *)
[].join = '' (* join of empty sequence is the empty string *)
['m', 'ss', 'ss', 'pp', ''].joinSeparatedBy('i') = 'mississippi' (* join with separator *)
'mississippi'.splitBy('i') = ['m', 'ss', 'ss', 'pp', ''] (* split at string *)
'str ing'.splitBy(' ') = ['str', 'ing'] (* split at char *)
'a b=2'.splitBy(' ').collect { :e | e.splitBy('=') }[2][2] = '2' (* split as parser *)
'string'.splitBy('ing') = ['str', '']
'string'.splitBy('trin') = ['s', 'g']
'string'.splitBy('absent') = ['string']
'string'.splitBy('') = ['s', 't', 'r', 'i', 'n', 'g']
'mississippi'.split.join = 'mississippi' (* join is the inverse of split *)
'mississippi'.splitBy('i').joinSeparatedBy('i') = 'mississippi' (* joinSeparatedBy is the inverse of splitBy *)
'/usr/local/bin'.splitBy('/') = ['', 'usr', 'local', 'bin']
'a' < 'b' = true (* string comparison *)
'text'.copyFromTo(2, 3) = 'ex' (* substring, one indexed, inclusive *)
'text'.copyFromTo(3, 3) = 'x' (* substring (single character) *)
{ 'string'.add('!') }.ifError { :err | 'oh oh...' } = 'oh oh...' (* strings are immutable *)
'quoted string with \'escaped\' quote characters'.words[4].copyFromTo(2, 8) = 'escaped'
'string'.utf8ByteArray = 'string'.asciiByteArray (* Utf-8 is a superset of ascii *)
'øéஃî'.utf8ByteArray = [195, 184, 195, 169, 224, 174, 131, 195, 174].ByteArray (* unicode *)
'Mačiūnas'.utf8ByteArray = [77, 97, 196, 141, 105, 197, 171, 110, 97, 115].ByteArray (* Utf-8 encoding *)
'Mačiūnas'.size = 8
'Mačiūnas'.utf8ByteArray.size = 10
'Mačiūnas'.utf16Array = [77, 97, 269, 105, 363, 110, 97, 115] (* Utf-16 encoding *)
'Mačiūnas'.utf16Array.size = 8
'string'.allButFirst = 'tring' (* all but first character of a String *)
'string'.allButFirst(4) = 'ng' (* all but first n characters of a String *)
''.typeOf = 'String' (* type of String *)
''.size = 0 (* the empty String has size zero *)
'x'.asString = 'x' (* asString at String is identity *)
'x'.asString.size = 1
'x'.printString.size = 3 (* printString is a quoted string *)
1.asString = '1' (* integer as string *)
pi.asString = '3.141592653589793' (* float as string *)
'ascii'.asciiByteArray = [97, 115, 99, 105, 105].ByteArray
'€'.utf8ByteArray = [226, 130, 172].ByteArray (* Utf-8 encoding of String as ByteArray *)
[226, 130, 172].ByteArray.utf8String = '€' (* String from Utf-8 encoded ByteArray *)
'€'.utf8ByteArray.utf8String = '€' (* decode and encode Utf-8 *)
'ascii'.asciiByteArray = 'ascii'.utf8ByteArray
'ascii'.asciiByteArray.asciiString = 'ascii' (* decode and encode Ascii *)
{ '€'.ascii }.ifError { true }
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
{ 'string'[3] := nil }.ifError { true } (* strings are immutable *)
'{"x": 3.141, "y": 23}'.parseJson = (x: 3.141, y: 23)
{ '_'.parseJson }.ifError { true }
'a text string'.json = '"a text string"' (* json encoding of string *)
'"a text string"'.parseJson = 'a text string' (* parse json string *)
'string'.first = 's'.Character (* first character *)
'string'.last = 'g'.Character (* last character *)
| x = ['a', 'bc', 'def']; | x.unlines.lines = x
'3 + 4'.evaluate = 7
'a short string'.replaceString('short', 'longer') = 'a longer string' (* replace substring *)
'x x x'.replaceString('x', 'y') = 'y x x'
'x x x'.replaceStringAll('x', 'y') = 'y y y'
'A Bc Def'.replaceStringAll(' ', '') = 'ABcDef'
'x y z'.replaceRegExp(RegExp('x|z', 'g'), '-') = '- y -'
'Word'.asLowercase = 'word'
'12345'.asLowercase = '12345' (* only if letters *)
'Word'.asUppercase = 'WORD'
'12345'.asUppercase = '12345' (* only if letters *)
'x' ~= 'X' & { 'x'.sameAs('X') & { 'x'.sameAs('x') } } (* considered without case *)
'word'.capitalized = 'Word'  (* uppercase first letter only *)
'12345'.capitalized = '12345' (* only if a letter *)
'testAt'.beginsWith('test') = true
'testAt'.beginsWith('At') = false
{ 'testAt'.beginsWith(nil) }.ifError { true }
'testAt'.endsWith('test') = false
'testAt'.endsWith('At') = true
'testAt'.endsWith('at') = false (* case sensitive *)
{ 'testAt'.endsWith(nil) }.ifError { true }
'sndfile.wav'.endsWith('.wav') = true
['a','b','','c'].unlines.paragraphs.collect(lines:/1) = [['a', 'b'], ['c']]
'string'.at(3) = 'r'.Character (* string indexing *)
var s = 'string'; [s[2], s[4], s[5]].join = 'tin' (* string subscripting *)
' x '.withBlanksTrimmed = 'x'
' x '.withoutLeadingBlanks = 'x '
' x '.withoutTrailingBlanks = ' x'
| a = []; | 'string'.do { :each | a.add(each) }; a.join = 'string'
'string'.stringArray.join = 'string'
| a = 'string'.characterArray; | a.joinCharacters = 'string' & { a.join = 'string' }
'𠮷'.countCharacters = 1
'𠮷'.countUtf16CodeUnits = 2
'𠮷'.size = 2
'𠮷'.isSingleCharacter = true
'𠮷'.characterArray = ['𠮷'.Character]
'𠮷'.codePointAt(1) = 134071 (* code point at index *)
'𠮷'.codePointAt(2) = 57271
'𠮷'.codePointAt(3) = nil (* nil for out of range indices *)
'𠮷'.codePointArray = [134071]
'𠮷'.isInBasicMultilingualPlane = false
'𠮷'.isWellFormed = true
{ '𠮷'.asciiByteArray }.ifError { true } (* non-ascii character *)
'𠮷'[1] = '𠮷'.Character
{ '𠮷'[2] }.ifError { true } (* lone surrogate *)
'0123456789'.isAllDigits
'1'.isAllDigits
''.isAllDigits = true (* the empty string answers true *)
'01234 56789'.isAllDigits = false (* spaces answer false *)
'x'.asciiValue = 120 (* ascii code point of string *)
{ 'xy'.asciiValue }.ifError { true } (* it is an error is the string is not a single character *)
{ '𠮷'.asciiValue }.ifError { true } (* it is an error is the character is not ascii *)
'string'.stringArray = ['s', 't', 'r', 'i', 'n', 'g']
'string'.characterArray = [115, 116, 114, 105, 110, 103].collect(Character:/1)
'Gnu/Linux'.findString('Linux') = 5
'Gnu/Linux'.findStringStartingAt('Linux', 1) = 5
'Hello'.isEmpty = false
'XYZ'.asLowercase = 'xyz'
'xyz'.asUppercase = 'XYZ'
'hilaire'.capitalized = 'Hilaire'
'1.54'.asNumber = 1.54 (* parse floating point number *)
'154'.asNumber = 154 (* parse integral number *)
'A clear but rather long-winded summary'.contractTo(19) = 'A clear ... summary'
'string'.Array.sort.join = 'ginrst'
'x' ~= 'x'.Character (* a single element string is not equal to a character *)
'Mačiūnas'.asAscii = 'Mainas' (* transform to ascii by deleting non-ascii characters *)
'string'.copy == 'string' (* copy is identity *)
'string'.asHex = '737472696e67' (* hex string of ascii codes of string *)
| s = 'string'; | (s.size * 2) = s.asHex.size (* asHex, hex string is twice as long *)
{ 'Mačiūnas'.asHex }.ifError { true } (* asHex, non-ascii strings raise an error *)
'"'.Character.codePoint = 34 (* double quote *)
'\''.Character.codePoint = 39 (* single quote *)
'\\'.Character.codePoint = 92 (* backslash (escape) *)
'`'.Character.codePoint = 96 (* backtick *)
'\b'.Character.codePoint = 8 (* backspace *)
'\t'.Character.codePoint = 9 (* horizontal tab *)
'\n'.Character.codePoint = 10 (* line feed, new line *)
'\v'.Character.codePoint = 11 (* vertical tab *)
'\f'.Character.codePoint = 12 (* form feed, new page *)
'\r'.Character.codePoint = 13 (* carriage return *)
'The quick brown fox jumps over the lazy dog'.crc16 = 16rFCDF (* 16 bit cyclic redundancy check, crc-16/arc *)
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

## Syntax -- array and interval syntax
```
[1 .. 3] = [1, 2, 3]
[3 .. 1] = [3, 2, 1]
[1, 3 .. 9] = [1, 3, 5, 7, 9]
[9, 7 .. 1] = [9, 7, 5, 3, 1]
[1 .. 1] = [1]
(1 .. 3) = Interval(1, 3, 1)
(3 .. 1) = Interval(3, 1, -1)
(1, 3 .. 9) = Interval(1, 9, 2)
(9, 7 .. 1) = Interval(9, 1, -2)
(1 .. 1) = Interval(1, 1, 1)
[1 .. 3] = (1 .. 3).Array
[3 .. 1] = (3 .. 1).Array
[1, 3 .. 9] = (1, 3 .. 9).Array
[9, 7 .. 1] = (9, 7 .. 1).Array
[1 .. 1] = (1 .. 1).Array
[1 3 5 2 4] = [1, 3, 5, 2, 4] (* vector syntax, literal items *)
[9.sqrt 16.sqrt 25.sqrt] = [3, 4, 5] (* vector syntax, simple unary sends *)
| a = 1, b = 3, c = 5; | [a b c b a] = [1, 3, 5, 3, 1] (* vector syntax, identifier items *)
[1 [1 3 [1 3 5] 5] 5] = [1, [1, 3, [1, 3, 5], 5], 5] (* vector syntax, vector items *)
[1 3; 5 7] = [[1, 3], [5, 7]] (* matrix syntax, literal items *)
| a = 1, b = 3, c = 5; | [a b c; c b a] = [[1, 3, 5], [5, 3, 1]] (* matrix syntax, identifier items *)
[1 2; 3 4;; 5 6; 7 8] = [[[1, 2], [3, 4]], [[5, 6], [7, 8]]]  (* volume syntax, literal items *)
| a = 1, b = 3; | [a b; b a;; b a; a b] = [[[1, 3], [3, 1]], [[3, 1], [1, 3]]] (* volume syntax, identifier items *)
[1 0 0; 0 1 0; 0 0 1;; 0 1 0; 1 0 1; 0 1 0;; 1 0 1; 0 1 0; 1 0 1].collect(sum:/1) = [1 1 1; 1 2 1; 2 1 2] (* volume to matrix *)
[1 0 0; 0 1 0; 0 0 1;; 0 1 0; 1 0 1; 0 1 0].transpose = [1 0 0; 0 1 0;; 0 1 0; 1 0 1;; 0 0 1; 0 1 0] (* transposed *)
[1 2 3; 4 5 6][2][3] = 6 (* matrix indexing *)
[1 2 3; 4 5 6].atPath([2]) = [4 5 6] (* matrix indexing; atPath, single index *)
[1 2 3; 4 5 6].atPath([2, 3]) = 6 (* matrix indexing; atPath, two indices *)
{ [1 2 3; 4 5 6].atPath([]) }.ifError { true } (* matrix indexing; atPath, empty indices is an error *)
[1 2 3; 4 5 6][2; 3] = 6 (* matrix indexing; atPath syntax *)
| m = [1 2 3; 4 5 6; 7 8 9]; | m[2; 3] = 6 & { m[3; 2] = 8 } (* matrix syntax, atPath syntax *)
```

## Syntax -- collection access and mutation
```
'text'[3] = 'x'.Character (* c[k] is syntax for c.at(k) *)
| x = [1 .. 5]; | x[3] := '3'; x[3] = '3' (* c[k] := v is syntax for c.atPut(k, v) *)
| i = (9 .. 1); | i[5, 3, 7] = [5, 7, 3] (* c[k1, k2...] is syntax for c.atAll([k1, k2...]) *)
| m = [1 2 3; 4 5 6; 7 8 9]; | m[2; 3] = 6 & { m[3; 2] = 8 } (* c[i; j...] is syntax for c.atPath([i, j...]) *)
```

## Syntax -- dictionary assignment syntax
```
| (x, y) = (x: 1, y: 2); | x = 1 & { y = 2 } (* variable declaration, retrieve named fields from the dictionary *)
| (y, x) = (x: 1, y: 2); | y = 2 & { x = 1 } (* selection is by name, not position *)
| (x, y, z) = (x: 1 * 2, y: 3 * 4, z: 5 * 6); | [z, y, x] = [30, 12, 2]
| x y | (x, y) := (x: 1, y: 2); x = 1 & { y = 2 } (* variable assignment, retrieve named fields from the dictionary *)
| y x | (y, x) := (x: 1, y: 2); y = 2 & { x = 1 } (* selection is by name, not position *)
| x y z | (x, y, z) := (x: 1 * 2, y: 3 * 4, z: 5 * 6); [z, y, x] = [30, 12, 2]
```

## Syntax -- dictionary literals
```
().isRecord (* () is the empty dictionary *)
() = [].Record (* () the empty dictionary *)
(x: 1, y: 2) = ['x' -> 1, 'y' -> 2].Record (* dictionary literal syntax *)
(x: 1, y: 2).printString = '(x: 1, y: 2)' (* Record print string *)
(x: 1, y: 2).storeString = '(x: 1, y: 2)' (* Record print string *)
```

## Syntax -- integer literals syntax
```
23.isInteger (* decimal integer literal *)
2r10111 = 23 (* binary (base 2) integer literal *)
8r27 = 23 (* octal (base 8) integer literal *)
10r23 = 23 (* decimal (base 10) integer literal *)
16r17 = 23 (* hexadecimal (base 16) integer literal *)
-23.isInteger (* negative decimal integer literal *)
-2r10111 = -23 (* negative binary (base 2) integer literal *)
-8r27 = -23 (* negative octal (base 8) integer literal *)
-10r23 = -23 (* negative decimal (base 10) integer literal *)
-16r17 = -23 (* negative hexadecimal (base 16) integer literal *)
[2r10111, 8r27, 10r23, 16r17] = [23, 23, 23, 23] (* twenty three *)
[-2r10111, -8r27, -10r23, -16r17] = [-23, -23, -23, -23] (* negative twenty three *)
9r55 = 50 (* radices other than 2, 8 10 and 16 may raise errors *)
[2r11111111, 8r377, 10r255, 16rff] = [255, 255, 255, 255] (* letters may be lower case *)
16rABCDEF = 10r11259375 (* letters may be uppercase *)
36rZZ = 1295 (* the maximum radix is 36, since each places is either a digit (10) or a letter (26) *)
[2r101011001, 8r531, 10r345, 16r159] = [345, 345, 345, 345]
{ 2r2 }.ifError { true } (* it is an error if the post-radix text includes out of range characters *)
2r1111111111111111 = (2 ** 16 - 1) (* 16 bits *)
2r111111111111111111111111 = (2 ** 24 - 1) (* 24 bits *)
2r11111111111111111111111111111111 = (2 ** 32 - 1) (* 32 bits *)
```

## Syntax -- interval & array syntax
```
(1 .. 9) = Interval(1, 9, 1) (* 1 to 9 by 1 *)
(9 .. 1) = Interval(9, 1, -1) (* 9 to 1 by -1 *)
(1, 3 .. 9) = Interval(1, 9, 2) (* 1 to 9 by 2 *)
(9, 7 .. 1) = Interval(9, 1, -2) (* 9 to 1 by -2 *)
[1 .. 9] = (1 .. 9).Array (* 1 to 9 by 1 *)
[9 .. 1] = (9 .. 1).Array (* 9 to 1 by -1 *)
[1, 3 .. 9] = (1, 3 .. 9).Array (* 1 to 9 by 1 *)
[9, 7 .. 1] = (9, 7 .. 1).Array (* 9 to 1 by -2 *)
```

## Syntax -- procedure application
```
{ } . () = nil (* apply no argument procedure *)
{ :n | n * n } . (23) = 529 (* apply one argument procedure *)
{ :p :q | p ++ q } . ('x', 'y') = 'xy' (* apply one argument procedure *)
```

## Syntax -- temporaries
```
| x | x = nil (* temporary syntax (no initializer) *)
| x = 1; | x = 1 (* temporary syntax (with initialiser) *)
| x y | x = nil & { y = nil } (* temporary syntax (no initializers) *)
| x = 1, y = 1; | x = 1 & { y = 1 } (* temporary syntax (with initialisers) *)
|( x = 1, y = 1 )| x = 1 & { y = 1 } (* |( x = i, y = j )| => | x = i, y = j; | *)
var x, y; x = nil & { y = nil } (* var x, y; => | x y | *)
var x = 1, y = 2; [x, y] = [1, 2] (* var x = i, y = i; => | x = i, y = j; | *)
var x = 1; var y = 2, z = 3; [x, y, z] = [1, 2, 3] (* there can be multiple var (with initializer) sequences *)
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

## Syntax -- unused variable name syntax
```
(1 .. 3).collect { :_ | 0 } = [0, 0, 0] (* underscore can be used to indicate an unused variable *)
| [x, _, z] = [1, 2, 3]; | [x, z] = [1, 3]
(1 .. 3).withIndexCollect { :_ :_ | 0 } = [0, 0, 0] (* multiple unused variable can be declared *)
| [x, _, _, z] = [1, 2, 3, 4]; | [x, z] = [1, 4] (* multiple unused variable can be declared *)
```

## Syntax -- whitespace
```
{:x|x+1}.value(1)=2 (* no white space *)
{ :x | x + 1 } . value ( 1 ) = 2 (* white space (space) *)
{	:x	|	x	+	1	}	.	value	(	1	)	=	2 (* white space (tab) *)
```

## System -- system type
```
system.typeOf = 'System' (* system type *)
system.isSystem (* system predicate *)
system.typeDictionary.keys.includes('System') = true
system.randomFloat < 1 (* system random number generator *)
system.uniqueId ~= system.uniqueId (* system unique identifier generator *)
system.highBitPerByteTable.size = 256 (* high bits per byte table *)
system.highBitPerByteTable.Bag.sortedCounts = [128 -> 8, 64 -> 7, 32 -> 6, 16 -> 5, 8 -> 4, 4 -> 3, 2 -> 2, 1 -> 1, 1 -> 0]
system.lowBitPerByteTable.size = 255 (* low bits per byte table *)
system.lowBitPerByteTable.Bag.sortedCounts = [128 -> 1, 64 -> 2, 32 -> 3, 16 -> 4, 8 -> 5, 4 -> 6, 2 -> 7, 1 -> 8]
```

## System -- system names
```
'!'.isOperatorName = true (* operator name predicate *)
'*'.operatorMethodName = 'times' (* operator name *)
['~', '!', '@', '#', '$','%'].collect(operatorMethodName:/1) = ['tilde', 'bang', 'commercialAt', 'hash', 'dollar', 'modulo']
['^', '&', '*', '-', '+', '='].collect(operatorMethodName:/1) = ['hat', 'and', 'times', 'minus', 'plus', 'equals']
['?', '<', '>'].collect(operatorMethodName:/1) = ['query', 'lessThan', 'greaterThan']
'!^'.operatorMethodName = 'bangHat' (* composite operator names capitalize non-initial names *)
'~='.operatorMethodName = 'tildeEquals'
```

## System -- categoryDictionary
```
system.categoryDictionary.isDictionary = true
system.categorizeAll('accessing', ['at', 'atPut', 'first', 'key', 'last', 'value']); true
system.isCategoryName('accessing') = true
system.category('accessing').isSet = true
system.categoriesOf('at').includes('accessing') = true
system.categoriesOf('notInCategorySystem') = []
system.isCategorized('at') = true
system.isCategorized('notInCategorySystem') = false
system.categorizeAll('Collections/Abstract', ['ArrayedCollection', 'Collection', 'SequenceableCollection']); true
'Collections/Abstract'.categoryNameParts = ['Collections', 'Abstract']
system.categoryOf('at') = 'accessing'
system.categoryOf('notInCategorySystem') = '*Uncategorized*'
```

## System -- globalDictionary
```
system.isIndexable (* system is indexable *)
system.globalDictionary.isDictionary (* the system global dicitionary is a dictionary *)
system.globalDictionary.isRecord (* specifically, it is a record *)
{ system::undefined }.ifError { true } (* system implements the indexable trait, unknown keys raise errors *)
system::TwoPi := 2 * pi; system::TwoPi / 2 = pi (* declare and then access a global variable *)
system.indices.includes('TwoPi') (* system is indexable *)
system.indexOf(2 * pi) = 'TwoPi' (* system is indexable *)
```

## System -- methodDictionary
```
system.methodDictionary.isDictionary = true
system.methodDictionary::collect.isDictionary = true
system.methodDictionary::collect[2].isDictionary = true
system.methodDictionary::collect[2]::Array.isMethod = true
system.methodDictionary.includesKey('collect') = true
system.allMethods.collect { :each | each.signature }.includes('@Iterable>>do:/2') = true
'@Iterable>>do:/2'.parseMethodSignature = ['@Iterable', 'do:/2']
'@Collection'.parseQualifiedTraitName = 'Collection'
system.methodLookupAtType('collect', 2, 'Array').isMethod = true
system.methodImplementations('sum').collect { :each | each.origin.name }.includes('Interval') = true
system.methodSignatures('add').includes('Map>>add:/2') = true
system.methodLookupAtSignature('@Iterable>>sum:/1').isMethod = true
system.methodLookupAtType('sum', 1, 'Array').sourceCode = '{ :self |\n\t\tself.reduce(plus:/2)\n\t}'
system.methodTypes('last:/1').includes('Interval') = true
system.multipleArityMethodList.includes('randomFloat') = true
system.onlyZeroArityMethodList.includes('PriorityQueue') = true
system.doesTraitImplementMethod('Collection', 'select') = true
system.doesTypeImplementMethod('Array', 'adaptToNumberAndApply') = true
[1, 2, 3].respondsTo(select:/2) = true (* does a value (courtesy the type) implement a method *)
system.methodPrintString('add').size >= 3
system.methodLookupAtType('collect', 2, 'Array').isMethod = true
system.methodLookupAtType('collect', 2, 'Array').origin.name = 'ArrayedCollection'
system.methodLookupAtType('collect', 2, 'Array').procedure.value([3, 4, 5], { :x | x * x }) = collect([3, 4, 5], { :x | x * x })
system.methodLookupAtType('sum', 1, 'Array') == system.methodLookupAtType('sum', 1, 'Set')
'sum:/1'.parseQualifiedMethodName = ['sum', 1]
```

## System -- time
```
system.systemTimeInMilliseconds > 0 = true
system.unixTimeInMilliseconds > 1671935015392 = true
| t1 = system.unixTimeInMilliseconds, t2 = system.unixTimeInMilliseconds; | t2 - t1 = 0
| t = { 23.benchFib }.millisecondsToRun; | t > 1 & { t < 1000 }
| [c, t] = { 23.benchFib }.benchForMilliseconds(100); | c >= 1 & { t >= 100 }
| [c, t] = { system.unixTimeInMilliseconds }.benchForMilliseconds(10); | c > 1000 & { t >= 10 }
```

## System -- traitDictionary
```
system.traitDictionary.isDictionary = true
system.traitDictionary.includesKey('Collection') = true
system.traitTypes('Collection').includes('Array') = true
system.typeTraits('Array').includes('ArrayedCollection') = true
system.methodTraits('atRandom:/1').includesAllOf(['Collection', 'SequenceableCollection']) = true
system.methodTraits('sum:/1') = ['Iterable']
system.traitTypes('Object').includes('SmallFloat') = true
system.traitLookup('Object').methodDictionary.includesKey('respondsTo:/2') = true
system.traitLookup('Collection').isTrait = true
system.traitLookup('Collection').name = 'Collection'
system.traitLookup('Iterable').methodDictionary.includesKey('do:/2') = true
system.traitLookup('Iterable').methodDictionary::do:/2.isMethod = true
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
system.typeLookup('Association').methodDictionary.select { :each | each.name = 'key' }.size = 2
system.typeLookup('Association').methodDictionary.anySatisfy { :each | each.name = 'copy' } = false
system.typeLookup('Array').isType = true
system.typeLookup('Array').name = 'Array'
system.typeLookup('Array').methodDictionary.includesKey('shallowCopy:/1') = true
system.typeLookup('Array').methodDictionary::shallowCopy:/1.isMethod = true
system.typeMethodDictionary('Array').anySatisfy { :each | each.name ='select' } = true
system.typeLookup('String').isType = true
system.typeLookup('String').methodDictionary.includesKey('includesSubstring:/2') = true
system.typeLookup('Void').methodDictionary.includesKey('Set:/0') = true
system.typeLookup(4:3.typeOf).slotNameArray = ['numerator', 'denominator']
```

## System -- Uniform Resource Locator (URL)
```
'http://cern.ch/'.URL.isURL = true
'http://cern.ch/'.URL.hostname = 'cern.ch'
'http://cern.ch/'.URL.port = ''
'http://cern.ch/'.URL.protocol = 'http:'
```

## System -- fetch
```
'/home/rohan/sw/spl/README.md'.asFileUrl.fetchText.then { :text | (text.size > 0).postLine }; true (* fetch text from file *)
'/home/rohan/sw/spl/README'.asFileUrl.fetchText.catch { :err | err.postLine }; true (* file does not exist *)
'file://localhost/home/rohan/sw/spl/README.md'.asUrl.fetchText.then { :text | (text.size > 0).postLine }; true (* fetch text from url (local) *)
'https://rohandrape.net/sw/spl/README.md'.asUrl.fetchText.thenElse { :text | (text.size > 0).postLine } { :err | true }; true (* fetch text from url (remote, allow for no network connection) *)
```

## System -- URLSearchParams
```
'x=3.141&y=23'.URLSearchParams.has('x') = true
'x=3.141&y=23'.URLSearchParams.get('y') = '23'
```

## Temporaries
```
| x | x = nil (* uninitialised variables are nil *)
| x y | x = y (* uninitialised variables are nil *)
| x = 1, y = 2; | x < y (* initialisers are written as name = value *)
```

## TimeStamp -- temporal type
```
1676784053576.TimeStamp.printString = 'TimeStamp(1676784053576)' (* make TimeStamp from Number of milliseconds since unix epoch *)
1676784053576.TimeStamp.iso8601 = '2023-02-19T05:20:53.576Z' (* convert TimeStamp to ISO-8601 string *)
system.unixTime.isTimeStamp = true (* get current time at system *)
system.unixTime.iso8601.size = 24
1676784053576.TimeStamp.roundTo(24.hours).iso8601 = '2023-02-19T00:00:00.000Z' (* round to duration *)
| t = system.unixTime; | t - 0.seconds = t (* offset TimeStamp by Duration *)
{ system.unixTime.postLine }.evaluateAfter(0.5.seconds).cancel = nil
{ system.unixTime.postLine }.evaluateAt(system.unixTime + 0.5.seconds).cancel = nil
{ system.unixTime.postLine }.evaluateEvery(3.seconds).cancel = nil
| t = 1676784053576.TimeStamp, c = t.copy; | c ~~ t & { c = t }
```

## Type -- slot access
```
('x' -> 1).slotNameArray = ['key', 'value'] (* slot names *)
('x' -> 1):@key = 'x' (* read slot *)
('x' -> 1):@answer = nil (* unknown slot names answer nil *)
| a = ('x' -> 1); | a:@key := 'y'; a = ('y' -> 1) (* write slot *)
| a = ('x' -> 1); | a:@hidden := pi; a = ('x' -> 1) & { a:@hidden = pi } (* writes to unknown slot add a slot *)
| a = 'x' -> 1; | a:@key = 'x' & { a:@value = 1 } (* read slots *)
| a = 'x' -> 1; | a:@key := 'y'; a:@value := 2; a = ('y' -> 2) (* write slots *)
```

## Syntax -- unary messages
```
89.sin = 0.8600694058124533
3.sqrt = 1.7320508075688772
pi.printString = '3.141592653589793'
'blop'.size = 4
true.not = false
```

## Syntax -- binary messages
```
'100' -> 100 = Association('100', 100) (* creates an association *)
3 + 4 = 7
10 - 1 = 9
4 <= 3 = false
4:3 * 3 = 4 = true (* equality is a binary message; fractions are exact *)
3:4 == 3:4 = false (* two equal Fractions are not the same object *)
```

## Syntax -- precedence
```
100.factorial / 99.factorial ~ 100 (* (unary) methods bind more closely than operators *)
2 ** (1 + 3.factorial) = 128
2.raisedToInteger(1 + 3.factorial) = 128
1 + 2 * 3 = 9
1 + (2 * 3) = 7
3 + 4.factorial = 27 (* not 5040 *)
(3 + 4).factorial = 5040
3 + 4 * 5 = 35 (* (not 23) binary messages sent from left to right *)
3 + (4 * 5) = 23
1 + 1 / 3 = (2 / 3) (* not 4/3 *)
1 + (1 / 3) = (4 / 3)
1 / 3 + 2 / 3 = (7 / 9) (* not 1 *)
(1 / 3) + (2 / 3) = 1
```

## Unit/Angle -- geometry unit type
```
pi.radians.typeOf = 'Angle' (* type of angle *)
pi.radians.isAngle (* angle predicate *)
1.radians.degrees ~ 57.296 (* radians to degrees *)
pi.radians.degrees = 180 (* pi radians is 180 degrees *)
180.degrees.radians = pi (* 180 degrees is pi radians *)
pi.radians < 360.degrees (* angles are magnitudes *)
pi.radians.asRadians = pi.asRadians (* radians of angle, or identity of number *)
```

## Unit/Frequency -- temporal unit type
```
1.hertz.typeOf = 'Frequency' (* frequency from hertz (cyles per second) *)
1.hertz.isFrequency (* frequency predicate *)
1.hertz.printString = '1.hertz' (* frequency print string *)
10.hertz.Duration = (1 / 10).seconds (* duration is the reciprocal of frequency *)
(1 / 10).seconds.Frequency = 10.hertz (* frequency is the reciprocal of duration *)
44.1.kilohertz = 44100.hertz (* frequencies are eq, kilohertz (thousands of cycles per second) *)
1.kilohertz.Duration = 1.milliseconds (* the period of 1kHz is 1ms *)
44.1.hertz < 44.1.kilohertz (* frequencies are magnitudes *)
1.kilohertz.asHertz = 1000.asHertz (* hertz of frequency, or identity of number *)
```

## Unit/Length -- geometry unit type
```
1.metres.typeOf = 'Length' (* metre constructor, type of *)
1.metres.isLength (* length predicate *)
10.centimetres.printString = '0.1.metres'
12.inches ~ 1.feet (* there are approximately twelve inches in a foot *)
1.yards.feet = 3 (* there are three feet in a yard *)
1.miles = 5280.feet (* lengths can be tested for equality *)
1.nauticalMiles = 1852.metres (* a nautical mile is defined in terms of metres *)
1.astronomicalUnits.kilometres.rounded = 149597871 (* 149,597,871 *)
1.astronomicalUnits.miles.rounded = 92955807 (* 92,955,807 *)
1.lightYears.kilometres.rounded = 9460700000000 (* 9,460,700,000,000 *)
1.lightYears.astronomicalUnits.rounded = 63241 (* 63,241 *)
1.parsecs.lightYears ~ 3.2615
1.parsecs.astronomicalUnits.rounded = 206266
1.picometres.picometres = 1
12.point = 4.2336.millimetres (* a point is approximately four millimetres *)
12.point.inches ~ (12 / 72) (* a point is approximately 1/72 of an inch *)
12.point ~ 1.picas (* twelve point is approximately a pica *)
10.centimetres.asMetres = 0.1.asMetres (* metres of length, or identity of number *)
```

## Unit/Mass -- physics unit type
```
23.grams.typeOf = 'Mass' (* gram constructor, type of *)
23.grams.isMass (* mass predicate *)
23.grams.printString = '23.grams'
23.kilograms = 23000.grams (* a kilogram is a thousand grams *)
2.2.pounds ~ 997.9.grams (* two and on fifth pounds is approximately a kilogram *)
36.ounces ~ 1020.58.grams (* thirty-six ounces are approximately a kilogram *)
(1 / 16).pounds = 1.ounces (* an ounce is 1/16 of a pound *)
1.kilograms.asGrams = 1000.asGrams (* grams of mass, or identity of number *)
```

## Unit/SiUnit -- units type
```
'kg'.siUnit.typeOf = 'SiUnit' (* type of SiUnit *)
'm'.siUnit.isSiUnit (* lookup unit by symbol *)
'meter'.siUnit.isSiUnit (* lookup unit by name *)
'm'.siUnit == 'meter'.siUnit (* units are cached (identical) *)
'Hz'.siUnit.name = 'hertz' (* Hz is the symbol of the unit hertz *)
's'.siUnit.isBaseUnit & { 'Pa'.siUnit.isDerivedUnit } (* there are seven base units and twenty two named derived units *)
```

## UnorderedCollection -- collection trait
```
{ [1, 2, 3].Set.at(1) }.ifError { true } (* unordered collections do not implement at *)
{ [1, 2, 3].Bag.at(1) }.ifError { true }
```

## Vector2 -- geometry type
```
Vector2(0, 0).typeOf = 'Vector2'
Vector2(-1, 1).isVector2 = true
Vector2(3, 4).isVector2 & { true } = true
[0, 0].Vector2 = (0@0)
(-1@1).isVector2.not = false
-1@1 = Vector2(-1, 1)
(-1@1).x = -1
(-1@1).y = 1
(-1@1).x(-3) = -3
(-1@1).y(3) = 3
-1@1 * 9 = (-9@9)
-1@1 + 2 = (1@3)
2 * (-1@1) * 2 = (-4@4)
(-1@1).asString = '-1@1'
(1 @ 1).negated = (-1 @ -1) (* negation *)
0 - (1 @ 1) = (-1 @ -1) (* negation as subtraction from zero *)
| p = -1@1; | p.x := -3; p.y := 3; p = (-3@3) = true
| p = -1@3, a = [p]; | a.first.x := -3; p = (-3@3) = true
| x = 3.141, y = 23, p = x@y; | p.x = x & { p.y = y }
[1@0, 1@1, 0@1, -1@1, -1@0, 0 @ -1].collect(t:/1) = (pi * [0, 1 / 4, 1 / 2, 3 / 4, 1, -1 / 2])
0@0 = Point(0,0)
200 @ 100 = Point(200, 100) (* obtain a new point *)
(200 @ 100).x = 200 (* x coordinate *)
(200 @ 100).y = 100 (* y coordinate *)
0 - (200 @ 100) = (-200 @ -100) (* negates x and y (note @- is an binary selector) *)
(0 - (200 @ 100)).abs = (200 @ 100) (* absolute value of x and y *)
200 @ 100 + 1 = (201 @ 101) (* add scale to both x and y *)
200 @ 100 - 1 = (199 @ 99) (* subtract scale from both x and y *)
200 @ 100 * 2 = (400 @ 200) (* multiply x and y by scale *)
200 @ 100 / 2 = (100 @ 50) (* divide x and y by scale *)
(200 @ 100) // 2 = (100 @ 50) (* divide x and y by scale *)
200 @ 100 % 3 = (2 @ 1) (* modulo of x and y by scale *)
200 @ 100 + (50 @ 25) = (250 @ 125) (* add points *)
200 @ 100 - (50 @ 25) = (150 @ 75) (* subtract points *)
200 @ 100 * (3 @ 4) = (600 @ 400) (* multiply points *)
1800 @ 100 / (3 @ 4) = (600 @ 25) (* divide points *)
(200 @ 100).Array = [200, 100] (* array of x and y *)
| v = Vector2(3, 4); | v.first = 3 & { v.second = 4 } (* implements first and second *)
| v = Vector2(3, 4); | v[1] = 3 & { v[2] = 4 } (* implements at *)
| v = Vector2(3, 4); | v[1] := 7; v.first = 7 (* implements atPut *)
Vector2(3, 4).size = 2 (* implements size *)
| v = Vector2(3, 4); | v.swapInPlace; v[1] = 4 (* swap fields in place *)
Vector2(3, 4).swapped = Vector2(4, 3) (* answer swapped vector *)
| v = (0 @ 0), c = v.copy; | c.x := 1; c ~= v & { c = (1 @ 0) } (* copy two vector *)
```

## Vector3 -- geometry type
```
[1, 2, 3].Vector3 = Vector3(1, 2, 3) (* three vector from array *)
| a = [1, 2, 3], v = a.Vector3; | v.Array = [1, 2, 3] (* three vector to array *)
Vector3(0, 0, 0).isZero (* are x, y and z all zero *)
| v = Vector3(1, 2, 3); | [v.x, v.y, v.z] = [1, 2, 3] (* fields are x, y, z *)
| v = Vector3(3, 4, 5); | v[1] = 3 & { v[2] = 4 & { v[3] = 5 } } (* implements at *)
| v = Vector3(3, 4, 5); | v[1] := 5; v[3] := 3; v.Array = [5, 4, 3] (* implements atPut *)
| v = Vector3(3, 4, 5); | [v.first, v.second, v.third] = [3, 4, 5] (* implements first &etc. *)
```

## Vector4 -- geometry type
```
[1, 2, 3, 4].Vector4 = Vector4(1, 2, 3, 4) (* four vector from array *)
| a = [1, 2, 3, 4], v = a.Vector4; | v.Array = [1, 2, 3, 4] (* four vector to array *)
Vector4(0, 0, 0, 0).isZero (* are w, x, y and z all zero *)
| v = Vector4(1, 2, 3, 4); | [v.w, v.x, v.y, v.z] = [1, 2, 3, 4] (* fields are w, x, y, z *)
```

## WriteStream -- collection type
```
| w = WriteStream(); | w.nextPut(1); w.contents = [1]
| w = WriteStream(); | w.nextPut(1); w.nextPutAll([2 .. 8]); w.nextPut(9); w.contents = [1 .. 9]
| w = WriteStream(); | 1.putOn(w); w.contents = [1]
| w = WriteStream(); | 1.putOn(w); [2 .. 8].putOn(w); 9.putOn(w); w.contents = [1 .. 9]
| w = [].ByteArray.WriteStream; | w.nextPutAll([1 .. 9]); w.contents = [1 .. 9].ByteArray
| w = Utf8WriteStream(); | 'bodlɛʁ'.encodeOn(w); w.contents.utf8String = 'bodlɛʁ'
| w = Utf8WriteStream(); | 'bodlɛʁ'.encodeOn(w); w.utf8Contents = 'bodlɛʁ'
| w = Utf8WriteStream(); | [3.141, nil].do { :each | each.printOn(w) }; w.utf8Contents = '3.141nil'
| w = [nil, nil].WriteStream; | w.nextPut('a'); w.nextPut('b'); w.contents.join = 'ab'
```
