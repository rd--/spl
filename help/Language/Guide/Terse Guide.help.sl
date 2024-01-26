# Terse Guide

## Angle -- geometry type
```
system.includesPackage('Angle') {- angle package -}
1.pi.radians.typeOf = 'Angle' {- type of angle -}
1.pi.radians.isAngle {- angle predicate -}
1.radians.degrees ~ 57.296 {- radians to degrees -}
1.pi.radians.degrees = 180 {- pi radians is 180 degrees -}
180.degrees.radians = 1.pi {- 180 degrees is pi radians -}
1.pi.radians < 360.degrees {- angles are magnitudes -}
1.pi.radians.asRadians = 1.pi.asRadians {- radians of angle, or identity of number -}
```

## Arithmetic expressions
```
6 + 3 = 9 {- addition -}
6.plus(3) = 9 {- addition -}
[0 + 0, 1 + 0, 0 + 1, 1 + 1, -1 + 1, -1 + 2] = [0, 1, 1, 2, 0, 1] {- addition -}
6 - 3 = 3 {- subtraction -}
6.minus(3) = 3 {- subtraction -}
[1 - 0, 0 - 1, 2 - 1] = [1, -1, 1] {- subtraction -}
6 * 3 = 18 {- multiplication, unicode = × -}
6.times(3) = 18 {- multiplication -}
[1 * 0, -1 * 1, 5 * -5, -3 * -4] = [0, -1, -25, 12] {- multiplication -}
9 / 3 = 3 {- division, unicode = ÷ -}
9.dividedBy(3) = 3 {- division -}
[36 / 6, -10 / 2, 20 / -5, -5 / -5] = [6, -5, -4, 1] {- division -}
9 // 3 = 3 {- integer division (quotient) -}
9.dividedByDividedBy(3) = 3 {- integer division -}
[9 // 4, -5 // 3, 5 // 2] = [2, -1, 2] {- the quotient from euclidean (integer) division -}
(-5 .. 5).collect { :n | n // 3 } = [-1, -1, -1, -0, -0, 0, 0, 0, 1, 1, 1] {- integer division -}
[1 // 1, 3 // 2, 4 // -2, -6 // 3, -12 // -4] = [1, 1, -2, -2, 3] {- integer division -}
1 + 2 * 3 = 9 {- evaluation always left to right, operators equal precedence -}
3 * 2 + 1 = 7 {- evaluation always left to right, operators equal precedence -}
1 + 2 * 3 = ((1 + 2) * 3) {- equals predicate is also left to right -}
3 + 4 * 5 - 6 / 7 ~ 4.1428 {- precedence, longer sequence, not ~22.1428 -}
3 = 3 {- equals -}
3.equals(3) {- equals -}
2 ~= 3 {- not equals -}
2.tildeEquals(3) {- not equals -}
3 == 3 {- identical -}
3.equalsEquals(3) {- identity -}
1 + (2 * 3) = 7 {- parentheses group sub-expressions -}
(5 / 3).isInteger.not {- division with fractional result -}
5 / 2 = 2.5 {- division with float result -}
5 // 3 = 1 {- integer divide -}
5 % 3 = 2 {- modulo -}
5.modulo(3) = 2 {- modulo -}
[10 % 3, 10 % -3, -10 % 3, -10 % -3, 10 % 5] = [1, -2, 2, -1, 0] {- modulo -}
(0 .. 9).collect { :i | i % 5 } = [0, 1, 2, 3, 4, 0, 1, 2, 3, 4]
[10 % 5, -4 % 3, 4 % -3, -4 % -3] = [0, 2, -2, -1] {- modulo, negative operands -}
13 % 7 % 4 = 2 {- left assocative -}
13 + 1 % 7 = 0 {- equal precedence -}
-5 = 5.negated {- unary minus -}
5.sign = 1 {- numeric sign, positive->1 -}
[-9, 0, 9].collect(sign:/1) = [-1, 0, 1] {- numeric sign, -1 or 0 or 1 -}
[-9, 0, 9].collect(signBit:/1) = [1, 0, 0] {- numeric sign, 1 for negative else 0 -}
5.sign(-1) = -5 {- answer number with sign of argument -}
-1.copySignTo(5) = -5 {- answer argument with sign of number -}
5.negated = -5 {- negate receiver, unary minus -}
1.25.truncated = 1 {- integer part of number -}
-1.25.truncated = -1 {- integer part of number -}
1.25.fractionPart = 0.25 {- fractional part -}
-1.25.fractionPart = -0.25 {- fractional part -}
1.pi.fractionPart + 1.pi.truncated = 1.pi {- fractional part and truncated part sum to identity -}
let x = 1.pi.negated; x.fractionPart + x.truncated = x {- fractional part and truncated part sum to identity -}
let x = 1.pi.negated; x.fractionPart + x.integerPart = x {- fractional part and truncated part sum to identity -}
2.fractionPart = 0 {- the fractional part of an integer is zero -}
(1 / 2).fractionPart = (1 / 2) {- the fractional part of a number between zero and one is identity -}
(4 / 3).fractionPart ~ (1 / 3) {- floating point math is not exact -}
(4 / 3) - 1 ~ (1 / 3) {- floating point math is not exact -}
0.5.fractionPart = 0.5
2.5.fractionPart = 0.5
5.reciprocal = (1/5) {- reciprocal function -}
6 * 3.1 = 18.6 {- auto convert to float -}
5.squared = 25 {- square function -}
25.sqrt = 5 {- square root -}
-1.sqrt.isNaN {- square root of a negative number is not a number -}
NaN.isNaN {- literal for NaN -}
4.sqrt = 2 & { 1000000.sqrt = 1000 & { 1.sqrt = 1 } & { 0.sqrt = 0 } }
2.sqrt = 1.4142135623730951
2.sqrt.squared.closeTo(2) {- floating point errors -}
2.sqrt.squared ~ 2 {- almost equal to, or similar to, unicode = ≈ -}
2.sqrt.squared <~ 2 {- less than or similar to -}
2.sqrt.squared >~ 2 {- greater than or similar to -}
2 !~ 3 {- not almost equal to -}
2.sqrt.squared.veryCloseTo(2) {- floating point errors -}
5.0 ^ 2.0 = 25.0 {- raisedTo (power) function -}
5 ^ 2 = 25 {- raisedTo integer -}
5.raisedTo(2) = 25 {- raisedTo integer -}
3 ^ 4 = 81 {- 3 * 3 * 3 * 3 = 81 -}
1.exp.veryCloseTo(2.718281828459) {- exponential -}
-5.abs = 5 {- absolute value -}
(0 - 1.pi).abs = 1.pi {- absolute value of floating point numbers -}
0.abs = 0 & { 5.abs = 5 } {- absolute value of zero and positive numbers -}
-0 = 0 {- negative zero is equal to zero -}
3.99.rounded = 4 {- round, c.f. rounded -}
3.99.truncated = 3 {- truncate -}
3.99.roundTo(1) = 4.0 {- round to specified decimal places, c.f. roundTo: -}
3.99.truncateTo(1) = 3.0 {- truncate to specified decimal places -}
12345.truncateTo(600) = 12000 {- truncate to integer -}
1.pi.roundDownTo(0.01) = 3.14 {- round down to nearest 1/100th -}
1.pi.roundDownTo(0.1) = 3.1 {- round down to nearest 1/10th -}
1923.roundDownTo(10) = 1920 {- round down to nearest multiple of 10 -}
1.pi.roundDownTo(0.005) = 3.140 {- round down to nearest 5/1000th -}
1.pi.negated.roundDownTo(0.01) = -3.15 {- rounding down a negative number rounds away from zero -}
(3 - 1.epsilon).roundDown = 2 {- round down to nearest integer -}
0.9.roundToTowardsZero(1) = 0 {- round towards zero, i.e. down for positive numbers -}
-0.9.roundToTowardsZero(1) = 0 {- round towards zero, i.e. up for negative numbers -}
0.9.roundTowardsZero = 0 {- round to nearest integer towards zero -}
-0.9.roundTowardsZero = 0 {- round to nearest integer towards zero, upwards for negative numbers -}
[-4, -3, -2.9, -2, -1, -0.9, 0, 0.9, 1, 2, 2.9, 3, 4].collect { :each | each.roundDownTo(2) } = [-4, -4, -4, -2, -2, -2, 0, 0, 0, 2, 2, 2, 4]
3.99.floor = 3 {- round down -}
3.99.ceiling = 4 {- round up -}
5.factorial = 120 {- factorial of SmallFloat -}
18.factorial = 6402373705728000 {- large small integer factorial -}
20.factorial = 2432902008176640000 {- large small float factorial -}
20.factorial.isSmallInteger = false {- 20! is not a small integer -}
(0 .. 9).collect(factorial:/1) = [1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880]
{ -1.factorial }.ifError { true } {- factorial is not defined for negative integers -}
9.factorial = (1 .. 9).product {- factorial is product of interval -}
12.factorial.log2.floor = 28 {- bit-depth of factorial -}
[12, 18, 20, 100, 170].collect { :each | each.factorial.log2.floor } = [28, 52, 61, 524, 1019]
9.doubleFactorial = 945 {- double factorial -}
[12, 18, 20].collect { :n | n.doubleFactorial } = [46080, 185794560, 3715891200]
[12, 18, 20].collect { :n | n.doubleFactorial.log2.floor } = [15, 27, 31]
(0, 2 .. 14).collect(doubleFactorial:/1) = [1, 2, 8, 48, 384, 3840, 46080, 645120]
(1, 3 .. 13).collect(doubleFactorial:/1) = [1, 3, 15, 105, 945, 10395, 135135]
14.doubleFactorial = (2, 4 .. 14).product {- double factorial is product of equal parity interval -}
13.doubleFactorial = (1, 3 .. 13).product {- double factorial is product of equal parity interval -}
28.gcd(12) = 4 {- greatest common denominator -}
28.lcm(12) = 84 {- least common multiple -}
1.exp.log = 1 {- natural logarithm -}
3.log = 1.0986122886681096 {- natural logarithm -}
100.log = 4.605170185988092 {- natural logarithm -}
-1.log.isNaN {- natural logarithm -}
100.log10 = 2.0 {- base 10 logarithm -}
1024.log2 = 10 {- base 2 logarithm -}
2048.log2 = 11 {- base 2 logarithm -}
100.log2 = 6.643856189774724 {- base 2 logarithm -}
-1.log2.isNaN {- base 2 logarithm -}
180.degreesToRadians = 1.pi {- convert degrees to radians -}
1.pi.radiansToDegrees = 180 {- convert radians to degrees -}
(1.pi / 2).sin = 1.0 {- sine -}
0.0.cos = 1.0 {- cosine -}
0.cos = 1 {- cosine -}
1.pi.cos = -1 {- cosine -}
(2 * 1.pi).cos = 1 {- cosine -}
2.pi.cos = 1 {- pi as unary operator -}
1.mu = 1e-6 {- mu as unary operator -}
(1.pi / 2).cos.veryCloseTo(0) {- cosine -}
0.0.tan = 0.0 {- tangent -}
[0, 45, 90, 180].collect(degreeSin:/1) = [0, 0.7071067811865475, 1, 0] {- sine given angle in degree -}
[0, 45, 90, 180].collect(degreeCos:/1) = [1, 0.7071067811865475, 0, -1] {- cosine given angle in degree -}
2.sqrt / 2 = 0.7071067811865476
2.sqrt / 2 = 0.5.sqrt
10.max(20) = 20 {- get maximum of two numbers -}
10.maxBy(20, negated:/1) = 10 {- comparison of translated values -}
10.min(20) = 10 {- get minimum of two numbers -}
10.minBy(20, negated:/1) = 20 {- comparison of translated values -}
1.pi.veryCloseTo(3.141592653589793) {- pi = 3.141592653589793 -}
1.exp.veryCloseTo(2.718281828459) {- e = 2.718281828459 -}
let n = 100.randomFloat; (n >= 0) & { n < 100 } {- random number in (0, self-1) -}
4 + 5 * 6 = 54 {- operators are evaluated left to right -}
0.arcCos = (1.pi / 2) {- arc cosine -}
1.arcCos = 0 {- arc cosine -}
-1.arcCos = 1.pi {- arc cosine -}
0.arcSin = 0 {- arc sine -}
1.arcSin =(1.pi / 2) {- arc sine -}
-1.arcSin = (1.pi / 2).negated {- arc sine -}
0.atan2(0) = 0 {- arc tangent -}
0.atan2(1) = 0
1.atan2(0) = (1.pi / 2)
{ 1.atan2(nil) }.ifError { true } {- operand not adaptable to number -}
8.cubeRoot = 2 {- nthRoot 3 -}
1000000.cubeRoot = 100 {- cube root -}
1.cubeRoot = 1 {- cube root -}
-0.cubeRoot = -0 {- cube root -}
0.cubeRoot = 0 {- cube root -}
-2.cubeRoot = -1.2599210498948732 {- cube root -}
inf = Infinity {- Infinity is the literal for IEEE infinity, inf is a constant, like 1.pi -}
3 / 0 = inf {- division by zero is infinity -}
-3 / 0 = inf.negated {- negative division by zero is negative infinity -}
(0 / 0).isNaN {- division of zero by zero is NaN -}
1.isNaN.not {- one is a number -}
4 / (0 .. 3) = [inf, 4, 2, 4 / 3] {- divide by zero is infinity -}
inf.sign = 1
inf.positive = true
(0 - inf).sign = -1
(0 - inf).negative = true
25.sqrt = 5 {- integer sqrt -}
(2 / 4) * 2 = 1 {- integer division -}
2 * (2 / 4) = 1 {- integer division -}
let x = 10 ^ -7; let nearest = 10 ^ -8; let furthest = 0; (x - nearest).abs < (x - furthest).abs & { (x ~ furthest) ==> { (x ~ nearest) } }
-1 !~ 1 {- negative one is not close to one -}
1 !~ inf {- one is not close to inifinity -}
inf ~ inf {- being equal, infinty is also close to itself -}
0 ~ 1.epsilon & { 1.epsilon ~ 0 } & { 1 + 1.epsilon ~ 1 } {- ε is ≈ zero ∧ ≈ is a symmetric operator ∧ one plus ε is ≈ one -}
let n = 10 ^ -9; 0 ~ n & { n ~ 0 } & { 1 + n ~ 1 }
[8 % 3, 9 % 3, 8.9 % 3, 1.epsilon % 3, 1.epsilon.negated % 3] ~ [2, 0, 2.9, 0, 3] {- modulo -}
(-5 .. 5).collect { :each | each % 3 } = [1, 2, 0, 1, 2, 0, 1, 2, 0, 1, 2] {- modulo -}
15 % 4 = 3 {- modulo -}
15 \\ 4 = 3 {- remainder -}
(15 // 4) * 4 + (15 \\ 4) = 15 {- // = quotient and \\ = remainder -}
let x = 15; let y = 4; (x // y) * y + (x \\ y) = x {- quotient by denominator + remainder = numerator -}
let x = 9; let y = 4; (x // y) * y + (x \\ y) = x {- // = quotient, \\ = remainder -}
(-5 .. 5).collect { :each | each.remainder(3) } = [-2 -1 -0 -2 -1 0 1 2 0 1 2]
1e6 = 1000000 {- scientific notation, unit base, positive exponent -}
3e9 = (3 * (10 ^ 9)) {- scientific notation, integer base -}
23e-1 = 2.3 {- scientific notation, negative exponent -}
3.141e-1 = 0.3141 {- scientific notation, float base, negative exponent -}
0.1e-6 = 1e-7 {- scientific notation, equivalence -}
8.625 / 0.75 = 11.5 {- a number divided by a number less than zero -}
let x = 8.625; let y = 0.75; let q = x.quotient(y); let r = x.remainder(y); [q, r, x = (y * q + r)] = [11, 0.375, true]
let x = 8.625; let y = 0.75; let q = x.quotientBy(y, rounded:/1); let r = x.remainderBy(y, rounded:/1); [q, r, x = (y * q + r)] = [12, -0.375, true]
0.5.rounded = 1 {- round to neareset or upwards (not to nearest or even -}
-0.5.rounded = -0 {- round upwards to negative zero -}
1.5.rounded = 2 {- round to neareset or upwards (not to nearest or even -}
1 + 2 = 3 {- addition -}
5 - 3 = 2 {- subtraction -}
2 * 3 = 6 {- multiplication -}
10 / 2.5 = 4 {- division -}
9 % 4 = 1 & { 9 = (4 * 2 + 1) } {- modulo -}
```

## Math -- power of two
```
8.isPowerOfTwo {- is the receiver a power of two -}
(1 .. 999).select(isPowerOfTwo:/1) = [1, 2, 4, 8, 16, 32, 64, 128, 256, 512]
(2 ^ 30).isPowerOfTwo = true {- this is only reliable for numbers that can be represented in 32-bits -}
(2 ^ 30 - 1).isPowerOfTwo = false
127.asLargerPowerOfTwo = 128 {- next power of two that is not less than the receiver -}
[1, 2, 4, 8, 16, 32, 64, 128, 256].collect { :each | (each + 1).asLargerPowerOfTwo } = [2, 4, 8, 16, 32, 64, 128, 256, 512]
129.asSmallerPowerOfTwo = 128 {- next power of two that is not greater than the receiver -}
[2, 4, 8, 16, 32, 64, 128, 256, 512].collect { :each | (each - 1).asSmallerPowerOfTwo } = [1, 2, 4, 8, 16, 32, 64, 128, 256]
300.asPowerOfTwo = 256 {- next smaller power of two -}
```

## Array -- collection type
```
system.includesPackage('Array') {- array package -}
[].typeOf = 'Array' {- type of Array -}
[].species = Array:/1 {- species of Array -}
[].species.new = [] {- new empty array -}
[].species.new(3) = [nil, nil, nil] {- new array of indicated size -}
[].species.ofSize(3) = [nil, nil, nil] {- new array of indicated size -}
[].species.newFrom((1 .. 9).asSet) = [1 .. 9] {- new array from collection -}
[].species.newFrom([].asSet) = [] {- new array from empty collection -}
[].species.newFrom([]) = [] {- new array from empty array -}
[].isArray = true {- the empty Array is an Array -}
[].isCollection = true {- arrays are collections -}
[].isIndexable = true {- arrays are indexable -}
[].isSequenceable = true {- arrays are sequenceable -}
[].isEmpty = true {- the empty array is empty -}
[].copy = [] {- copy empty array -}
Array() = [] {- Void constructor makes the empty Array -}
Array(0) = [] {- SmallFloat constructor makes an initialised sized Array -}
Array(3).size = 3 {- new array of indicated size -}
Array(5) = [nil, nil, nil, nil, nil] {- array slots are initialised to nil -}
Array(5, 0) = [0, 0, 0, 0, 0] {- array can have slots initialised to a value -}
[].asArray = [] {- Array constructor, empty array -}
let a = [1 .. 9]; a.copy ~~ a {- copy does not answer argument -}
let a = [1 .. 9]; a.asArray == a {- asArray answers the receiver if it is an array -}
let a = [1 .. 9].asSet; a.asArray ~~ a {- Array constructor copies any collection, sequenceable or otherwise -}
1.asCollection = [1] {- enclose a non-collection in an array -}
[1 .. 3].asCollection = [1 .. 3] {- an array is a collection -}
(1 .. 3).asCollection = (1 .. 3) {- an interval is a collection -}
(1 .. 3).asCollection = (1 .. 3) {- an interval is a collection -}
let x = [1 .. 3]; x.asCollection == x {- in the case of a collection, it is not copied -}
let x = (1 .. 3); x.asCollection == x {- in the case of a collection, it is not copied -}
let x = [[1, 2], [3, 4, 5]]; x.collect(asCollection:/1) = x {- identity -}
[1, 2, 3] = [1, 2, 3] = true {- array equality -}
[1, 2, 3] ~= [1, 2, 4] {- array inequality, differ by value -}
[1, 2, 3] = [1, 2, 4] = false {- array inequality -}
[1, 2] ~= [1, 2, 3, 4] {- array inequality, differ by size -}
[1, 2] = [1, 2, 3, 4] = false {- array inequality -}
[1, 2, 3, 4, 5, 6] ~= 7 {- array inequality, differ by type -}
[1, 2, 3, 4, 5, 6] = 7 = false {- array inequality -}
[1, 2, 3] == [1, 2, 3] = false {- arrays are not identical, even if equal -}
let a = [1, 2, 3]; a == a = true {- array self identity -}
[1, 2, 3].isArray = true {- array predicate -}
[1, 2.3, '4'].atRandom.isArray.not {- array predicate -}
4 * [1, 2, 3] = [4, 8, 12] {- scalar Array math -}
[1, 3, 5, 7].reversed = [7, 5, 3, 1] {- reversed answers new array -}
let a = [1, 3, 5, 7]; a.reversed ~= a {- reversed answers new array -}
let a = [1, 3, 5, 7]; a.reverse = a {- reverse mutates array in place -}
let a = [1, 3, 5, 7]; a.reverse; a = [7, 5, 3, 1] {- array reverse (in place) -}
[1, 2, 3, 5, 7, 9].sum = 27 {- sum of elements, unicode = Σ -}
[1, 2, 3, 5, 7, 9].reduce { :a :b | a + b } = 27 {- reduce by plus is sum -}
(1 .. 4).reduce { :sum :each | sum + each } = 10 {- sum is first argument, element is second -}
[1, 2, 3, 5, 7, 9].reduce(+) = 27 {- reduce by plus is sum -}
[1, 2, 3, 5, 7, 9].reduce(plus:/2) = 27 {- with operator written out -}
[1, 4, 2, 3, 5].reduce(min:/2) = 1 {- reduce by min is min -}
[1, 4, 2, 3, 5].reduce(max:/2) = 5 {- reduce my max is max -}
{ [].reduce { :a :b | a + b } }.ifError { true } {- cannot reduce empty collection -}
{ [].reduce { :sum :each | sum + each } }.ifError { true } {- error if the collection is empty -}
[1].reduce { :a :b | nil } = 1 {- reduce one-element collection -}
[1 2 3 5 7 9].injectInto(0, +) = 27
[1, 2, 3, 5, 7, 9].injectInto(0, plus:/2) = 27 {- with operator written out -}
[1, 2, 3, 5, 7, 9].product = 1890 {- product, unicode = Π -}
[1 2 3 5 7 9].reduce( * ) = 1890
[1, 2, 3, 5, 7, 9].reduce(times:/2) = 1890 {- with operator written out -}
[1 2 3 5 7 9].injectInto(1, * ) = 1890
[1, 2, 3, 5, 7, 9].injectInto(1, times:/2) = 1890 {- with operator written out -}
[1, 2, 3, 5, 7, 9].collect(sqrt:/1).sum.rounded = 12
[9, 16, 25].collect(sqrt:/1) = [3, 4, 5]
[9, 16, 25].collect { :each | sqrt(each) } = [3, 4, 5]
[].allSatisfy(odd:/1) = true
[1, 3, 5, 7, 9].allSatisfy(odd:/1) = true
[1, 2].allSatisfy(odd:/1) = false
[].anySatisfy(odd:/1) = false
[0, 2, 4, 6, 8].anySatisfy(odd:/1) = false
[0, 1].anySatisfy(odd:/1) = true
[].noneSatisfy(odd:/1) = true {- empty collection answers true -}
[1, 3, 5, 7, 9].noneSatisfy(even:/1) = true {- no odd number is even -}
(1 .. 5).noneSatisfy(odd:/1) = false {- one is odd -}
(1 .. 5).oneSatisfies { :each | each.even & { each > 2 } } {- exactly one element matches -}
(1 .. 5).count { :each | each.even & { each > 2 } } = 1 {- exactly one element matches -}
[1 .. 3] ++ [4 .. 6] = [1 .. 6] {- addAllLast, answering new like collection, unicode = ⧺ -}
let a = [1 .. 3]; a.addAllLast([4 .. 6]); a = [1 .. 6]
let a = [1 .. 3]; let b = a ++ [4 .. 6]; a ~~ b & { a = [1 .. 3] } & { b = [1 .. 6] }
{ [1 .. 3] ++ 4 }.ifError { true } {- right hand side must be a collection -}
plusPlus([1 .. 3], [4 .. 6]) = [1 .. 6] {- ++ equals plusPlus -}
[[1 .. 3], [4 .. 6], [7 .. 9]].concatenation = [1 .. 9] {- concatenation, unicode = ⧻ -}
[1 2 3; 4 5 6; 7 8 9].concatenation = [1 .. 9] {- concatenation, [Matrix Syntax] -}
[[1, 2, 3], [4, 5], [6]].concatenation = [1 .. 6]
[1 2 3; 4 5; 6].concatenation = [1 .. 6] {- non-square [Matrix Syntax] -}
let a = [1 .. 3]; a[2] = a.at(2) {- [At Syntax] -}
let i = (1 .. 3); i[2] = i.at(2) {- [At Syntax] -}
let m = [1 2 3; 4 5 6; 7 8 9]; m[2, 2] = 5 & { m[3, 1] = 7 } {- [At Syntax] -}
let m = [1 2; 3 4; 5 6]; m[2, 2] := 16; m[3, 1] := 25; m = [1 2; 3 16; 25 6] {- [AtPut Syntax] -}
(1 .. 5).includesIndex(3) {- is valid index -}
(1 .. 5).atIfPresent(3) { :x | x * x } = 9 {- clause if index is valid -}
(1 .. 5).atIfPresent(9) { :x | false } = nil {- ifAbsent clause answers nil -}
(1 .. 5).atIfAbsent(9) { true } {- exception clause if index is invalid -}
(1 .. 5).atIfPresentIfAbsent(9) { :x | false } { true } {- ifPresent and ifAbsent clauses -}
(1 .. 5).atIfPresentIfAbsent(3) { :x | x * x } { false } = 9 {- ifPresent and ifAbsent clauses -}
let a = [1, 2, 3]; a.atPut(2, 'two') = 'two' & { a = [1, 'two', 3] } {- atPut answers value put -}
let a = [1, 2, 3]; (a[2] := 'two') = 'two' & { a = [1, 'two', 3] }
let a = [1, 2, 3]; a.atModify(2, squared:/1) = 4 & { a = [1, 4, 3] } {- modify value at index -}
[5, 4, 3, 2, 1].detect { :each | each % 2 = 0 } = 4
{ [5, 4, 3, 2, 1].detect { :each | each % 7 = 0 } }.ifError { true }
[5, 4, 3, 2, 1].detect { :each | each * 2 <= 4 } = 2 {- find first element matching predicate -}
[5, 4, 3, 2, 1].detectIfNone { :each | each % 7 = 0 } { nil } = nil {- nil if no element is found -}
[5, 4, 3, 2, 1].findFirst { :each | each % 3 = 0 } = 3 {- answer index of first element matching predicate -}
[5, 4, 3, 2, 1].findFirst { :each | each % 7 = 0 } = 0 {- zero if no element is found -}
[[1, 2, 3, 4], [5, 6, 7, 8]].transposed = [[1, 5], [2, 6], [3, 7], [4, 8]]
[1 2 3; 4 5 6].transposed = [1 4; 2 5; 3 6] {- transposed, matrix syntax -}
1.toAsCollect(9, Array:/1) { :each | each * each } = [1, 4, 9, 16, 25, 36, 49, 64, 81]
let a = [1 .. 9]; a.shuffle; a ~= [1 .. 9] {- shuffle in place, using system Random -}
let a = [1 .. 9]; let r = Random(13579); a.shuffleUsing(r); a = [9, 8, 2, 3, 5, 7, 1, 4, 6] {- shuffle in place, using given Random -}
let a = [1 .. 9]; a.shuffled ~= a & { a = [1 .. 9] } {- answer shuffled copy -}
[1 .. 9].shuffled.sorted = [1 .. 9] {- resort after shuffle -}
[].shuffled = []
13.fibonacciArray = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233]
'3'.replicate(3) = ['3', '3', '3']
[1, 2, 3, 4, 3, 2, 1].detectMax(identity:/1) = 4
[(1 .. 3), (1 .. 6), (1 .. 9)].detectMax(size:/1) = (1 .. 9)
[(1 .. 3), (1 .. 6), (1 .. 9)].detectMin(size:/1) = (1 .. 3)
['1', '2', '3', '4', '5'].indexOf('3') = 3 {- index of first occurrence of element in sequence -}
[9 .. 1].indexOf(3) = 7 {- index of first occurrence of element in sequence -}
[1, 2, 3, 2, 3].indexOf(3) = 3 {- first of multiple occurrences -}
[1, 2, 3, 2, 3].indexOf(4) = 0 {- or zero -}
[1, 2, 3, 2, 3].indexOfIfAbsent(4) { true }
[1, 2, 3, 2, 3].lastIndexOf(3) = 5 {- index of last occurrence of element in sequence -}
[1, 2, 3, 2, 3].lastIndexOf(4) = 0 {- or zero -}
[1, 2, 3, 2, 3].lastIndexOfIfAbsent(4) { true }
[9 .. 1].includes(3) = true {- decide if a collection includes an element, unicode = ∋ -}
[1 .. 9].includes(9) {- an array includes its last element -}
[1 .. 7].doesNotInclude(9) {- decide if a collection does not include an element, unicode = ∌ -}
[9 .. 1].anySatisfy { :each | each = 3 } = true
[].includes(3) = false {- the empty collection does not include any element -}
[9 .. 1].includesAllOf([3 .. 7]) = true
[5 .. 3].includesAllOf([3 .. 7]) = false
[].includesAllOf([3 .. 7]) = false
Array(5).fillWith(negated:/1) = [-1 .. -5] {- fill array with answers of a block applied to each index -}
let r = Random(12345); Array(5).fillWith { r.nextRandomInteger(9) } = [8, 5, 9, 9, 4] {- block is applied using cull -}
let r = Random(12345); let f = { r.nextRandomInteger(9) }; Array(5).fillWith(f:/0) = [8, 5, 9, 9, 4] {- block is applied using cull -}
Array(5).fillFromWith((1 .. 5), negated:/1) = [-1 .. -5]
let a = Array(5); a.fillFromWith([1, 3, 5, 7, 9], squared:/1); a = [1, 9, 25, 49, 81]
let a = Array(4); [1, 3, 5, 7].collectInto({ :each | each * each}, a); a = [1, 9, 25, 49]
[1, 2, 3, 4, 3, 2, 1].occurrencesOf(3) = 2 {- number of occurrences of element in collection -}
let a = [1, 2]; let [x, y] = a; [y, x] = [2, 1]
let i = (1 .. 3); let [x, y, z] = i; [z, y, x] = [3 .. 1] {- sequence binding syntax -}
let [x, y] = { let n = system.nextRandomFloat; [n, n] }.value; x = y
[1, 3 .. 9] = [1, 3, 5, 7, 9]
[9, 7 .. 1] = [9, 7, 5, 3, 1]
[1 .. 3].printString = '[1, 2, 3]' {- array print string -}
[1 .. 3].storeString = '[1, 2, 3]' {- array store string -}
[-1, 2.0, 3.141].printString = '[-1, 2, 3.141]' {- array print string -}
[-1, 2.0, 3.141].storeString = '[-1, 2, 3.141]' {- array store string -}
[1 .. 9].allButFirst = [2 .. 9] {- all but first element -}
[1 .. 9].allButFirst(7) = [8, 9] {- all but first k elements -}
{ [].allButFirst }.ifError { true } {- error if too few elements -}
[1 .. 9].allButLast = [1 .. 8] {- all but last element -}
[1 .. 9].allButLast(7) = [1, 2] {- all but last k elements -}
(1 .. 9).allButFirstAndLast = (2 .. 8) {- all but first and last element -}
(1 .. 9).allButFirstAndLast(3) = (4 .. 6) {- all but first and last element -}
{ [].allButLast }.ifError { true } {- error if too few elements -}
{ let a = Array(1); a.at(3) }.ifError { true } {- out of bound indexing is an error -}
{ let a = [1]; a[3] }.ifError { true } {- out of bound indexing is an error -}
let a = Array(1); a[1].isNil = true {- array slots are initialised to nil -}
let a = Array(1); a.basicAt(3).isNil = true {- basic (unsafe) indexing, out of bounds indexes answer nil -}
{ let a = Array(1); a.atPut(3, 'x') }.ifError { true } {- out of bound mutation is an error -}
{ let a = [1]; a[3] := 'x' }.ifError { true } {- out of bound mutation is an error -}
let a = Array(1); a.basicAtPut(3, 'x') = 'x' & { a.size = 3 } {- basic (unsafe) mutation, out of bounds indices extend array -}
Array:/1.newFrom(Interval(1, 5, 2)) = [1, 3, 5]
[1 .. 9].count(even:/1) = 4
[nil, true, false, 3.141, 23, 'str'].json = '[null,true,false,3.141,23,"str"]' {- json encodings -}
'[null,true,false,3.141,23,"str"]'.parseJson = [nil, true, false, 3.141, 23, 'str'] {- json parsing -}
[1, 2, 3].select { :x | x > 1 } = [2, 3] {- select items in collection -}
[1 .. 9].select { :x | true } = [1 .. 9] {- select everything -}
[1 .. 9].select { :x | false } = [] {- select nothing -}
[].select { :x | true } = [] & { [].select { :x | false } = [] } {- select from empty collection -}
[1, 2, 3].reject { :x | x > 1 } = [1]
[1 .. 9].reject { :x | true } = [] {- reject everything -}
[1 .. 9].reject { :x | false } = [1 .. 9] {- reject nothing -}
[].reject { :x | true } = [] & { [].reject { :x | false } = [] } {- reject from empty collection -}
(1 .. 9).collect{ :x | x * x }.last = 81
(1 .. 9).collect{ :x | x * x }.collect{ :x | x * x }.last = 6561
[1 .. 9].last(5) = [5 .. 9]
{ [1 .. 3].last(5) }.ifError { true }
[1 .. 9].anyOne = 1 {- any element, chooses first -}
{ [].anyOne }.ifError { true } {- there are not any elements in an empty collection -}
[1 .. 9].any(3) = [1 .. 3] {- any three elements, chooses first -}
{ [1 .. 9].any(11) }.ifError { true } {- it is an error if there are not enough elements -}
[1 .. 9].take(11) = [1 .. 9] {- taking more elements than there are answers a copy -}
[1, 2].take(5).size = 2 {- taking more elements than there are answers a copy -}
{ [1, 2].take(-1) }.ifError { true }
[1 .. 5].beginsWith([1 .. 3]) = true {- does sequence begin with subsequence -}
{ [1 .. 5].beginsWith(1) = false }.ifError { true } {- prefix must be a sequence -}
[1 .. 5].beginsWithAnyOf([[4, 5], [3, 4], [2, 3]]) = false {- does sequence begin with any of a set of subsequences -}
[1 .. 5].groupBy(even:/1).indices = [false, true] {- answer a Map grouping elements according to a predicate -}
[1 .. 5].groupBy(even:/1)[true] = [2, 4]
let a = []; [1, 'x', 2, 'y', 3, 'x'].pairsDo { :p :q | a.add(q -> p) }; a = ['x' -> 1, 'y' -> 2, 'x' -> 3] {- iterate adjacent pairs -}
let r = (); [1, 'fred', 2, 'charlie', 3, 'elmer'].pairsDo { :p :q | r.add(q -> p) }; r::elmer = 3 {- iterate adjacent pairs -}
[1 .. 9].indexOfSubCollection([3 .. 5]) = 3
[1 .. 9].indexOfSubCollectionStartingAt([3 .. 5], 9) = 0
[1 .. 9].indexOfSubCollectionStartingAt([9], 9) = 9
let c = []; [1 .. 9].splitByDo([3 .. 5]) { :each | c.add(each) }; c = [[1, 2], [6, 7, 8, 9]]
['a', 'b', '', 'c', '', 'd', '', 'e', 'f'].indicesOfSubCollection(['']) = [3, 5, 7]
['a', 'b', '', 'c', '', 'd', '', 'e', 'f'].splitBy(['']) = [['a', 'b'], ['c'], ['d'], ['e', 'f']]
['a', 'b', '', 'c', '', 'd', '', 'e', 'f', ''].splitBy(['']) = [['a', 'b'], ['c'], ['d'], ['e', 'f'], []]
[5, 6, 3, -3, 2, 1, 0, 4].minMax = [-3, 6] {- integer minMax -}
[2834.83, -293482.28, 99283, 23, 959323].minMax = [-293482.28, 959323] {- float minMax -}
{ ['x'].detect { :each | each.isNumber } }.ifError { true } {- if no element is detected, an error is raised -}
['x'].detectIfFound { :each | each.isString } { :x | 42 } = 42 {- process detected element before answering -}
['x'].detectIfFound { :each | each.isNumber } { :x | 'x' } = nil {- if not found answer nil -}
['x'].detectIfFoundIfNone { :each | each.isNumber } { :x | 'x' } { 'x' } = 'x' {- ifFound and ifNone clauses -}
['x'].detectIfNone { :each | each.isString } { 42 } = 'x'
['x'].detectIfNone { :each | each.isNumber } { 42 } = 42
let a = Array(9); a.atAllPut('x'); a.allSatisfy { :each | each = 'x' } {- set all entries to the same value -}
let a = Array(9); a.atAllPut('x') = 'x' & { a.atRandom = 'x' } {- answers object put -}
[1 .. 9].collect { :each | 10 - each } = [9 .. 1]
[1, 2, 3] ++ [4, 5, 6] = [1, 2, 3, 4, 5, 6]
[1 .. 5].reversed = [5 .. 1]
let c = [1 .. 5]; { c[1.5] }.ifError { true } {- index not an integer -}
let c = [1 .. 5]; { c['1'] }.ifError { true } {- index not an integer -}
{ [1 .. 5].not }.ifError { true } {- cannot be negated -}
let a = [1, 2, 4]; a.insertAt(3, 3); a = [1 .. 4] {- insert value at index -}
let a = [1, 2, 4]; a.addAfter(3, 2); a = [1 .. 4] {- insert value after existing value -}
let a = [1, 2, 4]; a.addBefore(3, 4); a = [1 .. 4] {- insert value before existing value -}
[1 .. 5].atPin(-1) = 1 {- pin left -}
[1 .. 5].atPin(9) = 5 {- pin right -}
(-1 .. 5).collect { :index | (1 .. 3).atPin(index) } = [1 1 1 2 3 3 3] {- index answering bound if out of bounds -}
[-1 .. 5].collect { :index | [1 .. 3].atPin(index) } = [1 1 1 2 3 3 3] {- index answering bound if out of bounds -}
[2, 7, 5, 0, 1, -2].collect { :index | [5, 6, 8].atWrap(index) } = [6, 5, 6, 8, 5, 5] {- at with index wrap-around -}
(-1 .. 5).collect { :index | (1 .. 3).atWrap(index) } = [2 3 1 2 3 1 2] {- index wrapping if out of bounds -}
let a = [1, nil, 3]; a.atWrapPut(5, 2); a = [1, 2, 3] {- atPut with index wrap around -}
(1 .. 3).atFold(4) = 2 {- at with index fold-around -}
(-1 .. 5).collect { :index | (1 .. 3).atFold(index) } = [3 2 1 2 3 2 1] {- at with index fold-around -}
[1 .. 9].difference([3 .. 7]) = [1, 2, 8, 9] {- set theoretic difference of two collections -}
[1 .. 9].difference([]) = [1 .. 9] {- set theoretic difference of two collections -}
[1, 2, 3].symmetricDifference([3, 4]) = [1, 2, 4].asSet {- elements which are in either set but not their intersection -}
['A', 'B', 'D', 'E'].symmetricDifference(['B', 'E', 'F']) = ['A', 'D', 'F'].asSet
let a = [1 .. 9]; a.reject { :each | a.includes(each) } = [] {- reject all -}
[1 .. 9].difference([1 .. 9]) = [] {- set theoretic difference of two collections -}
[1, 3 .. 9].intersection([2, 4 .. 8]) = [] {- set theoretic intersection, unicode = ∩ -}
[1 .. 5].intersection([5 .. 9]) = [5] {- set theoretic intersection -}
let a = []; [1 .. 3].doSeparatedBy { :each | a.add(each) } { a.add(0) }; a = [1, 0, 2, 0, 3]
[1, 2, 3].intersperse(0) = [1, 0, 2, 0, 3]
let a = []; [1 .. 3].doWithout({ :each | a.add(each) }, 2); a = [1, 3]
[1 .. 9].selectThenCollect(even:/1) { :each | each * 3 } = [6, 12, 18, 24] {- avoid intermediate collection -}
[1 .. 9].collectThenSelect(squared:/1) { :each | each > 36 } = [49, 64, 81] {- avoid intermediate collection -}
[1, 3 .. 9].union([3 .. 7]) = [1, 3, 4, 5, 6, 7, 9].asSet {- set theoretic union, unicode = ∪ -}
let a = [1 .. 9]; a.removeAllSuchThat(even:/1); a = [1, 3 .. 9] {- remove elements selected by predicate -}
let a = [1 2 2]; a.removeAllSuchThat { :each | each = 2 }; a = [1] {- remove elements selected by predicate, answers copy of self -}
let a = [1 2 2]; a.removeAllSuchThat { :each | each = 3 }; a = [1 2 2] {- it is not an error if no elements match -}
let a = [1 2 2 3 3 3]; a.removeAllEqualTo(3); a = [1 2 2] {- remove all elements equal to argument -}
let a = [1 .. 9]; let b = [1, 3 .. 9]; let c = [2, 4 .. 8]; a.removeAllFoundIn(b) == b & { a = c } {- remove elements found in a collection -}
let a = [1 2 2 3 3 3]; a.without(3) = [1 2 2] {- remove all elements equal to argument and answer self -}
let a = [1 2 2 3 3 3]; a.withoutAll([1, 3]) = [2 2] {- remove all elements equal to argument and answer self -}
5.arithmeticSeries(1, 2) = [1, 3 .. 9] {- arithmetic series (size from by) -}
5.geometricSeries(1, 2) = [1, 2, 4, 8, 16] {- geometric series (size from by) -}
Array(3).size = 3
Array:/1.ofSize(3) = [nil, nil, nil]
let l = []; l.addFirst(2); l.addFirst(1); l = [1, 2] {- add item to start of array -}
let l = [2]; l.addFirst(1) = 1 & { l = [1, 2] } {- answer is argument -}
let l = []; l.addLast(1); l.addLast(2); l = [1, 2] {- add item to end of array -}
let l = [1]; l.addLast(2) = 2 & { l = [1, 2] } {- answer is argument -}
let l = []; (1 .. 5).do { :each | l.add(each) }; l = [1 .. 5] {- alias for addLast -}
let l = [1 .. 9]; l.removeFirst = 1 & { l.size = 8 } {- remove first object from array -}
let l = [1 .. 9]; l.removeLast = 9 & { l.size = 8 } {- remove last object from array, answers removed element -}
let l = [4, 5]; l.addAllFirst(1.to(3)); l = [1 .. 5] {- add all elements to start of array -}
[1].addAllFirst([2, 3]) = [2, 3] {- answer is argument -}
let l = [1, 2, 3]; l.addAllLast(4.to(5)); l = [1 .. 5] {- add all elements to end of array -}
[1].addAllLast([2, 3]) = [2, 3] {- answer is argument -}
let l = [1]; l.addAll([2, 3]); l.addAll([]); l.addAll([4 .. 6]); l = [1 .. 6] {- alias for addAllLast -}
let i = (1 .. 9); let a = []; a.addAll(i); a.size = 9 {- add elements from Interval to end of Array -}
13.fibonacciSequenceInto([]) = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233]
let c = [1 .. 5]; [c.removeAt(1), c] = [1, [2, 3, 4, 5]] {- removeAt answers the removed element -}
let c = [1 .. 5]; [c.removeAt(3), c] = [3, [1, 2, 4, 5]]
let c = [1 .. 5]; [c.removeFirst(3), c] = [[1, 2, 3], [4, 5]] {- remove first three objects from array -}
let c = [1 .. 5]; [c.removeLast(3), c] = [[3, 4, 5], [1, 2]] {- remove last three objects from array -}
let c = [1 .. 5]; c.removeAll; c = [] {- remove all objects from array -}
let c = [1 .. 5]; [c.remove(3), c] = [3, [1, 2, 4, 5]] {- remove object from array -}
let c = [1, 2, 3, 2, 1]; [c.remove(2), c] = [2, [1, 3, 2, 1]] {- remove only one matching element -}
let c = [1 .. 5]; c.removeIfAbsent(9) { true } & { c = [1 .. 5] } {- remove object from array, handle absence -}
[1, 2, 3].ofSize(4) = [1, 2, 3, nil] {- extend to be of size, new slots are nil -}
let a = [1, 2, 3]; a.ofSize(2) = a {- if requested size is smaller, do nothing -}
let a = [1, 2, 3]; a.ofSize(2) == a {- if requested size is smaller, answer the array itself -}
[1, 3 .. 9].indices = (1 .. 5) {- indices of array (an interval) -}
let a = [1, [2, 3]]; let c = a.copy; c[2][1] := -2; c = a & { a = [1, [-2, 3]] } {- copy is a shallow copy -}
let a = [1, [2, 3]]; let c = a.deepCopy; c[2][1] := -2; c ~= a & { a = [1, [2, 3]] } {- deepCopy is a deep copy -}
let a = [nil, true, false, 3.141, 23, 'str']; a.deepCopy = a {- deepCopy of shallow array -}
[1, 3 .. 9].copyUpTo(7) = [1, 3, 5] {- copy up to but not including element -}
[1, 3 .. 9].copyUpThrough(7) = [1, 3, 5, 7] {- copy up to but and including element -}
[1, 3 .. 9].copyUpTo(-1) = [1, 3 .. 9] {- copy up to end if no such element -}
[1, 2, 3, 4, 2, 3, 4, 3, 4, 4].copyUpToLast(3) = [1, 2, 3, 4, 2, 3, 4] {- copy up to last instance of element -}
[1, 3 .. 9].copyUpToLast(-1) = [1, 3 .. 9] {- copy up to end if no such element -}
let i = (9 .. 1); i @* [5, 3, 7] = [5, 7, 3] {- atAll operator -}
let a = [9 .. 1]; a @* [5, 3, 7] = [5, 7, 3] {- atAll operator -}
let a = [5 .. 1]; a @* [1 5 3] = [5 1 3] {- atAll operator -}
let a = [5 .. 1]; a @* [2 .. 4] = [4 3 2] {- atAll operator -}
let a = [1, 1, 3, 4]; a @* [2, 4, 3, 1] = [1, 4, 3, 1] {- atAll operator -}
let a = [1 1 3 4]; a @* [2 4 3 1] = [1 4 3 1] {- atAll operator -}
```

## Arrayed -- collection trait
```
system.includesPackage('Arrayed') {- arrayed package -}
[3, 5, 7].basicAt(1) = 3 {- unchecked lookup -}
[3, 5, 7].basicAt(7) = nil {- unchecked lookup, nil on invalid index -}
let a = [1, 7, 3, 9, 5]; a.sortBy { :p :q | p >= q }; a = [9, 7 .. 1] {- sort using provided comparison, in place -}
[1, 7, 3, 9, 5].sortBy { :p :q | p >= q } = [9, 7 .. 1] {- sort using provided comparison, in place answering array -}
[1, 7, 3, 9, 5].sort = [1, 3 .. 9] {- sort using default comparison of <= -}
[(x: 1, y: 9), (x: 9, y: 1)].sortOn { :each | each::y } = [(x: 9, y: 1), (x: 1, y: 9)] {- sort using provided key block -}
```

## Assignment
```
| a b c | a := b := c := 'c'; [a, b, c] = ['c', 'c', 'c'] {- assignment is right-associative -}
let a = 'a'; let b = 'b'; let c = 'c'; a := b := c; [a, b, c] = ['c', 'c', 'c'] {- assignment is right-associative -}
| a | (a := 1) = 1 {- assignment answers assigned value -}
| a b | a := (b := 2 + 2) + 3 = 7 & { b = 4 } {- assignment answers assigned value -}
let a = 1; let b = 2; let c = 3; [a, b, c] := [b, c, a]; [a, b, c] = [2, 3, 1] {- permutation using array assignment syntax -}
```

## Association -- collection type
```
system.includesPackage('Association') {- association package -}
('x' -> 1).typeOf = 'Association' {- arrow (->) constructor, unicode = → -}
('x' -> 1).isAssociation {- type predicate -}
Association('x', 1) = ('x' -> 1)
'x'.minusGreaterThan(1) = ('x' -> 1) {- spelled out arrow method -}
let a = 'x' -> 1; [a.key, a.value] = ['x', 1] {- key and value accessors -}
('x' -> 1).asArray = ['x', 1] {- two element [key, value] array -}
['x' -> 1, 'y' -> 2].collect(asArray:/1) = [['x', 1], ['y', 2]]
(23 -> 3.141).printString = '23 -> 3.141'
(23 -> 3.141).storeString = 'Association(23, 3.141)'
(1 -> '1').key = (1 -> 'one').key
(1 -> '1').value ~= (1 -> 'one').value
(1 -> '1') ~= (1 -> 'one')
(1 -> 2) = system.evaluate((1 -> 2).storeString) {- store string can be evaluated to answer value -}
(false -> true) = system.evaluate((false -> true).storeString)
('+' -> 'plus') = system.evaluate(('+' -> 'plus').storeString)
(0 -> 1) ~= (0 -> 2) {- equality considers both key and value, unlike in Smalltalk-80 -}
('x' -> 1) ~= ('y' -> 1) {- equality considers both key and value, unlike in Smalltalk-80 -}
('x' -> 1) ~= (x: 1) {- an association is not equal to a record -}
let a = 'x' -> 1; a.keyValue('y', 2); a = ('y' -> 2) {- set key and value -}
('x' -> 1).first = 'x' {- implements first -}
('x' -> 1).second = 1 {- implements second -}
```

## Bag -- collection type
```
system.includesPackage('Bag') {- bag package -}
Bag().isBag = true
Bag().typeOf = 'Bag'
Bag().isCollection
Bag().isIndexable = false
Bag().isSequenceable = false
let b = Bag(); b.add('x'); b.add('x'); b.size = 2 {- number of objects in bag -}
let b = Bag(); b.add('x'); b.add('y'); b.add('x'); b.size = 3 {- add element to bag -}
let b = Bag(); b.addAll(['x', 'y', 'y', 'z', 'z', 'z']); b.size = 6 {- add all elements of argument to bag -}
let c = 'xyyzzz'; let r = Bag(); r.addAll(c); r.size = 6 {- add all elements of a String to a Bag -}
let c = 'xyyzzz'.split; let r = Bag(); r.addAll(c); r.size = 6 {- add all characters of a String to a Bag -}
[2, 3, 3, 5, 5, 5, 7, 7, 7, 7].asBag.size = 10
[2, 3, 5, 7, 3, 5, 7, 5, 7, 7].asBag.sortedCounts = [4 -> 7, 3 -> 5, 2 -> 3, 1 -> 2]
[2, 3, 5, 7, 3, 5, 7, 5, 7, 7].asBag.sortedElements = [2 -> 1, 3 -> 2, 5 -> 3, 7 -> 4]
let b = Bag(); let o = ['1' -> 10, '2' -> 1, '3' -> 5]; o.collect { :a | b.addWithOccurrences(a.key, a.value) }; b.sortedElements = o
[1, 3, 5, 1, 3, 1].asBag.sorted = [1, 1, 1, 3, 3, 5] {- array of elements, sorted -}
[1, 3, 5, 1, 5, 1].asBag.sorted = [1, 1, 1, 3, 5, 5] {- array of elements, sorted -}
[1, 3, 5, 1, 3, 1].asBag.sortedCounts = [3 -> 1, 2 -> 3, 1 -> 5]
[1, 3, 5, 1, 5, 1].asBag.sortedCounts = [3 -> 1, 2 -> 5, 1 -> 3]
[1, 3, 5, 1, 3, 1].asBag.sortedElements = [1 -> 3, 3 -> 2, 5 -> 1]
[1, 3, 5, 1, 5, 1].asBag.sortedElements = [1 -> 3, 3 -> 1, 5 -> 2]
let c1 = [2, 3, 3, 4, 4, 4].asBag; let c2 = c1.copy; let s2 = c2.size; c1.removeAll; c1.size = 0 & { c2.size = s2 }
let c = Bag(); let x = 'x'; c.add(x); c.remove(x); c.size = 0
let c = ['x', 'x'].asBag; c.remove('x'); c.remove('x'); c.size = 0
let c = Bag(); { c.remove('x') }.ifError { true }
[2, 3, 3, 4, 4, 4].asBag.occurrencesOf(3) = 2 {- number of occurrences of element in collection -}
[2, 3, 3, 4, 4, 4].asBag.occurrencesOf(4) = 3
[2, 3, 3, 4, 4, 4].asBag.occurrencesOf(5) = 0
[2, 3, 3, 4, 4, 4].asBag.occurrencesOf(nil) = 0
[nil].asBag.occurrencesOf(nil) = 1 {- count occurrences of nil -}
let c = [2, 3, 3, 4, 4, 4].asBag; c.copy = c {- copy answers new equal Bag -}
let c = [2, 3, 3, 4, 4, 4].asBag; c.copy ~~ c {- copy does not answer argument -}
let c = Bag(); c.addWithOccurrences('x', 4); c.occurrencesOf('x') = 4
[2, 3, 3, 4, 4, 4].asBag.asSet.size = 3 {- number of unique elements -}
[2, 3, 3, 4, 4, 4].asBag.asSet.occurrencesOf(3) = 1
let s = Bag(); 250.timesRepeat { s.add([1 .. 4].shuffled.asString) }; s.asSet.size = 24
[1, 2, 3, 1, 4].asBag.isIndexable = false {- bags are not indexable -}
[1, 2, 3, 1, 4].asBag.indices = nil {- sets are not indexable -}
let a = [1, 1, 2, 1, 2, 3, 1, 1, 2, 3, 4]; a.sum = a.asBag.sum {- sum may be optimised -}
[1, 2, 3, 1, 3, 4].asBag.valuesAndCounts = [1 -> 2, 2 -> 1, 3 -> 2, 4 -> 1].asMap {- contents -}
[1, 1, 1, 1, 1, 2, 2, 2, 2, 3].asBag.cumulativeCounts = [50 -> 1, 90 -> 2, 100 -> 3]
[1, 2, 2, 3, 3, 3].histogramOf { :each | each }.asArray = [1, 2, 2, 3, 3, 3]
[1, 2, 2, 3, 3, 3].histogramOf { :each | each } = [1, 2, 2, 3, 3, 3].asBag
let c = [1, 2, 3, 1]; c.asBag = c.histogramOf(identity:/1)
let c = [1, 2, 3, 1]; c.asBag = c.histogramOf { :each | each }
[1, 2, 3, 1].asBag = ['x' -> 1, 'y' -> 2, 'y' -> 3, 'z' -> 1].histogramOf { :each | each.value }
['x', 'y', 'y', 'z'].asBag = ['x' -> 1, 'y' -> 2, 'y' -> 3, 'z' -> 1].histogramOf { :each | each.key }
(x: 1, y: 2, z: 1).histogramOf { :each | each } = [1, 2, 1].asBag
(x: 1, y: 2, z: 1).values.histogramOf { :each | each } = [1, 2, 1].asBag
(x: 1, y: 2, z: 1).indices.histogramOf { :each | each } = ['x', 'y', 'z'].asBag
[1.1, 2.1, 3.1, 1.9, 2.9, 1.1].histogramOf { :each | each.rounded } = [1, 2, 3, 2, 3, 1].asBag
[1, 3, 5].asBag.select { :x | x > 1 } = [3, 5].asBag
let b = [1, 2, 3, 2, 1].asBag; b.removeAll([1, 2, 3]); b = [2, 1].asBag {- only remove first instance -}
```

## Binary -- numeric trait
```
system.includesPackage('Binary') {- binary package -}
16 << 3 = 128 {- left shift small float -}
23 << 7 = 2944 {- left shift small float -}
7 << 23 = 58720256 {- left shift small float -}
16 >> 3 = 2 {- right shift small float -}
2r1111.bitAnd(2r1001) = 2r1001 {- bitwise and -}
(2 ^ 30).bitAnd(2 ^ 30 - 1) = 0 {- bitwise and of a power of two and one less is zero -}
2r1111.bitOr(2r1001) = 2r1111 {- bitwise or -}
2r1111.bitXor(2r1001) = 2r0110 {- bitwise exclusive or -}
(1 .. 8).collect { :each | 2r10010110.bitAt(each) } = [0 1 1 0 1 0 0 1] {- bit at index -}
```

## Binary -- counting & testing
```
2r0.bitCount = 0 {- count number of bits set -}
2r1.bitCount = 1
2r101.bitCount = 2
2r101001000100101.bitCount = 6
{ -2.bitCount }.ifError { true } {- negative integers have an infinite number of leading ones -}
32.highBit = 6 {- high bit, the number of bits required to represent an integer -}
32 = 2r00100000 & { 2r00100000.highBit = 6 } {- high bit -}
2r00101000.highBit = 6 {- high bit -}
{ 2r00101000.negated.highBit }.ifError { true } {- high bit is not defined for negative integers -}
2r00101000.lowBit = 4 {- low bit -}
2r00101000.negated.lowBit = 4 {- low bit -}
0.lowBit = 0 & { 0.highBit = 0 } {- the low and high bits of zero are zero -}
```

## Bitset -- collection type
```
system.includesPackage('Bitset') {- bitset package -}
Bitset(64).isBitset {- bitset predicate -}
Bitset(64).size = 0 {- a new bitset is empty -}
Bitset(64).capacity = 64 {- the capacity of a bitset is set when initialized -}
Bitset(64).isEmpty {- a new bitset is empty -}
Bitset(64).bytes.allSatisfy { :each | each = 0 } {- all bytes at the empty bitset are zero -}
[1, 3, 9].asBitset.capacity = 16 {- bitset from array, capacity is rounded up to nearest byte -}
let b = Bitset(64); b.add(1); b.add(3); b.add(9); b.size = 3 {- add three integers to bitset -}
let b = Bitset(64); b.add(5); b.add(5); b.add(5); b.size = 1 {- adding the same integer over again -}
let b = [1, 3, 9].asBitset; b.includes(3) {- does bitset include element -}
let b = [1, 3, 9].asBitset; [1, 3 .. 9].collect { :each | b.includes(each) } = [true, true, false, false, true]
let b = Bitset(64); b[1] := 1; b[3] := 1; b[9] := 1; b.size = 3 {- a three element bitset, atPut -}
let b = [1, 3, 9].asBitset; [1, 3 .. 9].collect { :each | b[each] } = [1, 1, 0, 0, 1] {- at -}
let a = []; let b = Bitset(64); let c = [1, 3, 9, 27]; b.addAll(c); b.do { :each | a.add(each) }; a = c
let b = [1, 3].asBitset; let c = b.copy; c.add(7); b ~= c & { c = [1, 3, 7].asBitset } {- copy bitset -}
[1, 3, 9].asBitset.bitAt(3) = 1 {- bitAt is equal to at -}
Bitset(64).with { :b | b.setBitAt(3); b.bitAt(3) = 1 } {- setBitAt is equal to add -}
[1, 3, 9].asBitset.with { :b | b.clearBitAt(3); b.asArray = [1, 9] } {- clearBitAt is equal to remove -}
```

## Bitwise Manipulation
```
2.bitAnd(3) = 2 {- and bits -}
2.bitOr(3) = 3 {- or bits -}
2.bitXor(3) = 1 {- xor bits -}
3.bitNot = -4 {- invert bits -}
2.bitShiftLeft(3) = 16 {- left shift (higher) -}
16.bitShiftRight(3) = 2 {- right shift (lower) -}
2.bitShift(3) = 16 {- left shift (higher) -}
16.bitShift(-3) = 2 {- right shift (lower) -}
(1 .. 4).select { :bit | 6.bitTest(bit) } = [2, 3] {- bit at position (0|1) [!Squeak] -}
2 << 3 = 16 {- left shift operator -}
16 >> 3 = 2 {- right shift operator -}
{ 1.bitAnd(nil) }.ifError { true } {- operand not adaptable to number -}
{ 1 << nil }.ifError { true } {- operand not adaptable to number -}
0.bitAnd(0) = 0 {- and bits -}
```

## Blob -- system type
```
system.includesPackage('Blob') {- blob package -}
[].Blob.typeOf = 'Blob' {- type of Blob -}
[].Blob.size = 0 {- empty Blob has size zero -}
[].Blob.isEmpty {- empty Blob is empty -}
```

## Boolean -- logic type
```
system.includesPackage('Boolean') {- boolean package -}
true = true {- true constant, unicode = ⊤ -}
false = false {- false constant, unicode = ⊥ -}
true ~= false {- true is not false, unicode = ≠ -}
false ~= true {- false is not true -}
true == true {- true is identical to true, unicode = ≡ -}
false == false {- false is identical to false -}
1 = 1 = true {- equality predicate (operator) -}
1 ~= 2 = true {- inequality predicate (operator) -}
(1 == 1) = true {- identical -}
(1 ~~ 2) = true {- not identical, unicode = ≢ -}
true.and { true } {- logical and -}
true & { true } {- logical and (operator) -}
false & { '&'.error } = false {- & is equal to and and is not strict (unlike in Smalltalk) -}
true.and { false } = false {- logical and, unicode = ∧ -}
true & { false } = false {- logical and (operator) -}
true.or { false } = true {- logical or, unicode = ∨ -}
true | { false } = true {- logical or (operator) -}
false | { true } = true {- logical or (operator) -}
true | { '|'.error } = true {- | is equal to or and is not strict (unlike in Smalltalk) -}
true.ifTrue { 'T' } = 'T' {- if then, c.f. conditional statements -}
true.ifTrue { 1.toDo(2) { :unused | nil } } = 1 {- conditional iteration -}
false.if { 'T' } { 'F' } = 'F' {- if then else (do) -}
true.if { 'T' } { 'F' } = 'T' {- if then else (value) -}
true.not = false {- not true is false, unicode = ¬ -}
false.not = true {- not false is true -}
true.not.not = true {- not of not is the identity -}
1.isNumber = true {- test if object is a number -}
1.isInteger = true {- test if object is an integer -}
1.respondsTo(sqrt:/1) = true {- test if object responds to message -}
23.respondsTo(+) {- test if object responds to message -}
23.respondsTo(plus:/2) {- with operator written out -}
nil.isNil = true {- test if object is nil -}
0.positive = (0 >= 0) {- test if number is non-negative -}
0.strictlyPositive = (0 > 0) {- test if number is greater than zero -}
-1.negative = true {- test if number is negative -}
2.even = true {- test if number is even -}
1.even = false {- one is not even -}
1073741825.even = false {- a large odd number is not even -}
1073741824.even = true {- a large even number is even -}
1.odd = true {- test if number is odd -}
2.odd = false {- two is not odd -}
'A'.isUppercase = true {- test if upper case character -}
'a'.isLowercase = true {- test if lower case character -}
false.asBit = 0 {- boolean as bit, false is zero -}
true.asBit = 1 {- boolean as bit, true is one -}
true.asInteger > false.asInteger {- boolean as integer, c.f. asBit -}
true.asNumber > false.asNumber {- boolean as number, c.f. asBit -}
true.printString = 'true' {- true print string -}
true.storeString = 'true' {- true store string -}
false.printString = 'false' {- false print string -}
false.storeString = 'false' {- false store string -}
true.typeOf = 'Boolean' {- type of true is Boolean -}
false.typeOf = 'Boolean' {- type of false is Boolean -}
true.isInteger.not {- true is not an integer -}
true.isBoolean {- true is a Boolean -}
false.isBoolean {- false is a Boolean -}
true & { false } = false {- logical and operator -}
true.and { false } = false {- logical and block -}
false & { 'false &'.postLine; false } = false
true | { 'true |'.postLine; true } = true
false | { true } = true {- logical or operator -}
false.or { true } = true {- logical or block -}
{ true & false }.ifError { true } {- & applies the rhs, which must be a block -}
true && true = true {- non-evaluating form of & (requires boolean operand) -}
{ true && 'true' }.ifError { true } {- it is an error if operand is not a boolean -}
{ false | false }.ifError { true } {- | applies the rhs, which must be a block -}
false || true = true {- non-evaluating form of | (requires boolean operand) -}
{ false || 'true' }.ifError { true } {- it is an error if operand is not a boolean -}
[true.json, false.json] = ['true', 'false'] {- booleans have json encodings -}
['true', 'false'].collect(parseJson:/1) = [true, false] {- parse json booleans -}
true.ifTrue { true }
false.ifFalse { true }
(4.factorial > 20).if { 'bigger' } { 'smaller' } = 'bigger'
true.copy == true {- copy is identity -}
false.xor(true) = true {- exclusive or -}
true.xor(false) = true {- exclusive or -}
false.xor(false) = false
true.xor(true) = false
false.xor { true } = true
false.xor { false } = false
{ false.xor(1) }.ifError { true }
{ false.xor { 1 } }.ifError { true }
true ==> { true } = true {- material implication -}
true ==> { false } = false {- material implication -}
false ==> { true } = true {- material implication -}
false ==> { false } = true {- material implication -}
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
system.includesPackage('ByteArray') {- byte array package -}
ByteArray(0).typeOf = 'ByteArray' {- byte array type name -}
ByteArray(0).species = ByteArray:/1 {- byte array species -}
ByteArray(0).isArray = false {- byte arrays are arrays -}
ByteArray(0).isByteArray {- byte array predicate -}
ByteArray(0).isIndexable {- byte arrays are indexable -}
ByteArray(0).isSequenceable {- byte arrays are sequenceable -}
ByteArray(0).size = 0 {- size of byte array (number of elements) -}
ByteArray(8).size = 8
ByteArray(8).at(1) = 0 {- lookup element at index -}
ByteArray(8).atPut(1, 179) = 179 {- set element at index, answer element -}
let a = ByteArray(8); a.atPut(1, 179) = 179 & { a.at(1) = 179 }
(1 .. 9).asByteArray.isByteArray = true {- array of numbers in 0-255 to byte array -}
{ [-1].asByteArray }.ifError { true } {- out of range element error -}
{ ['1'].asByteArray }.ifError { true } {- not a number element error -}
(1 .. 9).asByteArray.reversed = (9 .. 1).asByteArray
(1 .. 3).asByteArray.printString = '[1, 2, 3].asByteArray'
(1 .. 3).asByteArray.storeString = '[1, 2, 3].asByteArray'
ByteArray(4).hex = '00000000'
'text'.asciiByteArray[1] = 116 {- ByteArray subscript -}
let b = ByteArray(4); b[1] := 15; b[3] := 240; b.hex = '0f00f000'
let b = ByteArray(4); b[2] := 15; b[4] := 240; b.hex = '000f00f0'
(1 .. 4).asByteArray.hex = '01020304'
'string'.asciiByteArray.hex = '737472696e67' {- hexadecimal string of ByteArray -}
'737472696e67'.parseHexString.asciiString = 'string' {- ByteArray of hexadecimal string -}
let b = ByteArray(4); b.atAllPut(15); b.hex = '0f0f0f0f'
'string'.asciiByteArray.asArray = [115, 116, 114, 105, 110, 103] {- array from ByteArray -}
'0f00f010'.parseHexString = [15, 0, 240, 16].asByteArray
{ [1, 2, 3].asByteArray.add(4) }.ifError { true } {- ByteArrays are not Extensible -}
(1 .. 9).asByteArray.select { :each | false } = [].asByteArray {- select nothing -}
(1 .. 9).asByteArray ~= [1 .. 9] {- ByteArray and Array of equal elements are not equal -}
(1 .. 9).asByteArray.hasEqualElements((1 .. 9)) {- ByteArray and Array of equal elements -}
[1, 13 .. 253].asByteArray.base64Encoded = 'AQ0ZJTE9SVVhbXmFkZ2ptcHN2eXx/Q==' {- base 64 encoding -}
'AQ0ZJTE9SVVhbXmFkZ2ptcHN2eXx/Q=='.base64Decoded = (1, 13 .. 253).asByteArray {- base 64 decoding -}
'SGVsbG8gV29ybGQ='.base64Decoded.asciiString = 'Hello World' {- answer is a ByteArray -}
[1, 3 .. 9].asByteArray.indices = (1 .. 5) {- indices of byte array (an interval) -}
let b = [1, 3 .. 9].asByteArray; b.copy = b & { b.copy ~~ b } {- copies are equal & not identical -}
let b = [1 .. 9].asByteArray; let c = b.copy; c[1] := 9; c[1] = 9 & { b[1] = 1 } {- copies are distinct -}
[115, 116, 114, 105, 110, 103].asByteArray.crc16 = 58909 {- 16 bit cyclic redundancy check, crc-16/arc -}
let s = 'string'; let a = []; a.addAll(s.asciiByteArray); a.size = 6 {- add elements from ByteArray to end of Array -}
```

## CategoryDictionary -- categorization type
```
system.categoryDictionary.typeOf = 'CategoryDictionary'
system.categoryDictionary.isCategoryDictionary
system.categoryDictionary.categoryOf('atPut') = 'accessing' {- category of in any domain -}
system.categoryDictionary.categoryOf('type', 'Colour') = 'Graphics' {- category of in given domain -}
system.categoryDictionary.categoryOf('type', 'Set') = 'Collection' {- category of in given domain -}
```

## Character -- text type
```
system.includesPackage('Character') {- character package -}
'𠮷'.asCharacter.isCharacter
'𠮷'.asCharacter.string = '𠮷'
'𠮷'.asCharacter.codePoint = 134071
134071.asCharacter.string = '𠮷'
'䶰䶱䶲䶳䶴䶵'.characterArray.collect(codePoint:/1) = [19888 .. 19893]
'x'.asCharacter = 120.asCharacter {- characters are comparable -}
'x'.asCharacter.asInteger = 120
'x'.asCharacter.printString = '$x'
'x'.asCharacter.storeString = '120.asCharacter'
'x'.asCharacter == 120.asCharacter {- characters are identical -}
'𠮷'.asCharacter == '𠮷'.asCharacter {- characters are identical -}
'x'.asCharacter.asciiValue = 120 {- ascii code point of character -}
{ '𠮷'.asCharacter.asciiValue }.ifError { true } {- it is an error is the character is not ascii -}
'xyz'.asArray = ['x'.asCharacter, 'y'.asCharacter, 'z'.asCharacter]
'xyz'.asArray.collect(codePoint:/1) = [120, 121, 122]
32.asCharacter.string = ' ' {- 32 is space -}
' '.asCharacter.codePoint = 32 {- space is 32 -}
97.asCharacter.string = 'a' {- 92 is a -}
'a'.asCharacter.printString = '$a' {- print using smalltalk notation, despite not being a literal -}
'a'.asCharacter.asString = 'a' {- single element string of Character -}
{ 'xy'.asCharacter }.ifError { true } {- it is an error is the string is not a single Character -}
let c = '𠮷'.asCharacter; c = c.copy & { c ~~ c.copy } {- copy is equal but not identical -}
92.asCharacter.string = '\\' {- escaped character -}
'0123456789abcdef'.characterArray.collect(digitValue:/1) = [0 .. 15] {- digit value of character -}
(0 .. 15).collect(digitValue:/1).join = '0123456789ABCDEF' {- character of given digit value -}
{ 36.digitValue }.ifError { true } {- error if integer is out of range -}
'x'.asCharacter.asUppercase = 'X'.asCharacter {- to upper case -}
'X'.asCharacter.asLowercase = 'x'.asCharacter {- to lower case -}
let s = 'string'; let a = []; a.addAll(s); a.size = 6 {- add elements from String to end of Array -}
'fgaguzst'.characterArray.minMax = ['a'.asCharacter, 'z'.asCharacter] {- character minMax -}
'alphabet'.characterArray.collect(isVowel:/1) = [true, false, false, false, true, false, true, false] {- is character a vowel -}
```

## Circle -- geometric type
```
system.includesPackage('Circle') {- package -}
Circle(Point(0, 0), 1).typeOf = 'Circle' {- type of -}
Circle(Point(0, 0), 1).isCircle {- predicate -}
Circle(Point(0, 0), 1).center = Point(0, 0) {- center -}
Circle(Point(0, 0), 1).radius = 1 {- radius -}
Circle(Point(0, 0), 1).diameter = 2 {- diameter -}
Circle(Point(0, 0), 1).circumference = 2.pi {- circumference -}
Circle(Point(0, 0), 1).area = 1.pi {- area -}
```

## Clock -- temporal type
```
Clock().typeOf = 'Clock' {- type of clock -}
Clock().isClock {- clock predicate -}
Clock().priorityQueue.isPriorityQueue {- priority queue of clock -}
Clock().priorityQueue.isEmpty {- priority queue is initially empty -}
let c = Clock(); let i = 3; c.schedule(i) { :t | t.postLine; nil }; c.nextEntryTime <= (system.systemTimeInSeconds + i)
let c = Clock(); let i = 3; c.schedule(i) { :t | t.postLine }; c.removeAll; c.nextEntryTime = nil
```

## Collection -- collection trait
```
system.includesPackage('Collection') {- collection package -}
[].isEmpty = true {- is collection empty -}
[].isCollection = true {- collection predicate -}
[].size = 0 {- the empty array has no elements -}
[1, 2, 3] = [1, 2, 3] {- are collections equal -}
[9, 4, 5, 7, 8, 6].size = 6 {- size of collection -}
[9, 4, 5, 7, 8, 6].max = 9 {- maximum item in collection -}
[9, 4, 5, 7, 8, 6].min = 4 {- minimum item in collection -}
[9, 4, 5, 7, 8, 6].maxBy(negated:/1) = 4 {- comparison of translated values -}
[9, 4, 5, 7, 8, 6].minBy(negated:/1) = 9 {- comparison of translated values -}
[9, 4, 5, 7, 8, 6].sum = 39 {- sum of collection -}
[9, 4, 5, 7, 8, 6].mean = 6.5 {- sum of collection divided by size -}
(1 .. 9).mean = 5 {- sum of collection divided by size -}
let c = (1 .. 9); c.sum / c.size = 5 {- sum of collection divided by size -}
[9, 4, 5, 7, 8, 6].product = 60480 {- product of collection, unicode = Π -}
[9, 4, 5, 7, 8, 6].injectInto(0) { :z :e | e + z } = 39 {- sum of collection -}
[9, 4, 5, 7, 8, 6].injectInto(1) { :z :e | e * z } = 60480 {- product of collection -}
[9, 4, 5, 7, 8, 6].includes(7) = true {- is element in collection, i.e. contains -}
[9, 4, 5, 7, 8, 6].includes(3) = false {- is element in collection -}
[9, 4, 5, 7, 8, 6].count { :item | item.even } = 3 {- count elements that satisfy predicate -}
[9, 4, 5, 7, 8, 6].anySatisfy { :item | item.even } = true {- do any elements satisfy predicate -}
[].anySatisfy { :item | true } = false {- anySatisfy is false for empty collections -}
[9, 4, 5, 7, 8, 6].allSatisfy { :item | item.even } = false {- do all elements satisfy predicate -}
[].allSatisfy { :item | false } = true {- allSatisfy is true for empty collections -}
[9, 4, 5, 7, 8, 6].occurrencesOf(7) = 1 {- count elements that are equal to object -}
[1, 2, 3, 4, 5].atRandom <= 5 {- random element of collection -}
(1 .. 9).range = (9 - 1) {- maxima - minima -}
[-9, 0, 9].sign = [-1, 0, 1] {- signs of elements -}
[1, 3, 5].select { :x | x > 1 } = [3, 5]
[1, 3, 5].asSet.select { :x | x > 1 } = [3, 5].asSet
(x: 1, y: 3, z: 5).select { :x | x > 1 } = (y: 3, z: 5)
[].select { :each | 'select'.error } = []
[].species.newFrom(Set()) = []
Set().asArray = []
(1 .. 9).includesAnyOf([0, 6]) {-includes any element of a collection -}
[4 .. 6].copyWithout(5) = [4, 6] {- copy without element -}
(4 .. 6).copyWithout(5) = [4, 6] {- copy without element, interval becomes array -}
[2, 3, 4, 5, 5, 6].copyWithout(5) = [2, 3, 4, 6] {- copy without element, removes multiples -}
[2, 3, 4, 5, 5, 6].copyWithoutAll([3, 5]) = [2, 4, 6] {- copy without element, removes multiples -}
let a = [1 .. 4]; let c = a.copyWith(5); a ~= c & { c = [1 .. 5] } {- copy with new (last) element -}
let s = [1 .. 4].asSet; let c = s.copyWith(5); s ~= c & { c = [1 .. 5].asSet } {- copy with new element -}
{ [1, 2].take(-1) }.ifError { true }
[].select { :each | each > 0 } = []
[].ifEmpty { true } {- evaluate block if collection is empty -}
[].ifEmpty { true } { false } {- evaluate emptyBlock if collection is empty -}
[1].ifEmpty { false } { true } {- evaluate notEmptyBlock if collection is not empty -}
[1].ifEmpty { false } { :c | c = [1] } {- evaluate notEmptyBlock with collection if not empty -}
(1 .. 9).detectSum(squared:/1) = 285 {- apply block to each element and sum -}
(1 .. 9).collect(squared:/1).sum = 285
let a = [1 .. 9]; a.removeAll((3 .. 7)); a = [1, 2, 8, 9] {- remove all indicated elements -}
let a = [1, 2, 3, 2, 1]; [a.removeAll([1, 2, 3]), a] = [[1, 2, 3], [2, 1]] {- answer items to remove, only remove first instance -}
{ [1 .. 3].removeAll((7 .. 9)) }.ifError { true } {- it is an error if an element to be removed is not located -}
let a = [1 .. 3]; a.removeAllFoundIn((7 .. 9)); a = [1 .. 3] {- unlike removeAll it is not an error if items are not found -}
let a = [1, 2, 3, 2, 1]; a.removeAllFoundIn([2, 3]); a = [1, 2, 1] {- removes only first matching element -}
[1 .. 6].collect { :each | each * 2 } = [2, 4 .. 12] {- apply block at each element and answer like collection -}
(1 .. 6).collect { :each | each * 2 } = [2, 4 .. 12] {- interval species is array -}
(1 .. 6).collect { :each | each * 2 } = [2, 4 .. 12] {- literal integer interval syntax -}
[2, -3, 4, -35, 4, -11].collect { :each | each.abs } = [2, 3, 4, 35, 4, 11]
[2, -3, 4, -35, 4, -11].collect(abs:/1) = [2, 3, 4, 35, 4, 11]
(1 .. 100).injectInto(0) { :sum :each | sum + each } = 5050
let a = [1 .. 5]; a.contents == a {- contents at is identity -}
((1 .. 9) / 3).rounded = [0, 1, 1, 1, 2, 2, 2, 3, 3] {- unary math operator at collection -}
[].collectThenDo { :each | 'error'.error } { :each | 'error'.error }.isEmpty {- neither block is run for empty collections -}
let n = 0; (3 .. 7).collectThenDo(squared:/1) { :each | n := n + each } = [9, 16, 25, 36, 49] & { n = 135 } {- collect then do -}
[].ifEmptyIfNotEmptyDo { true } { :aCollection | false } = true {- branch on isEmpty -}
(1 .. 9).ifEmptyIfNotEmptyDo { false } { :aCollection | aCollection.size = 9 } = true {- branch on isEmpty -}
(1 .. 9).ifNotEmptyDo { :aCollection | aCollection.size = 9 } = true {- branch on isEmpty -}
(1 .. 9).average = 5 {- mean, sum divided by size -}
(1 .. 9).average = (45 / 9) {- mean, sum divided by size -}
(x: (y: 1)).atPath(['x', 'y']) = 1 {- atPath of dictionary, depth = 2 -}
(x: (y: (z: 1))).atPath(['x', 'y', 'z']) = 1 {- atPath of dictionary, depth = 3 -}
(w: (x: (y: (z: 1)))).atPath(['w', 'x', 'y', 'z']) = 1 {- atPath of dictionary, depth = 4 -}
(p: (q: (r: 1))) @> ['p' 'q' 'r'] = 1 {- @> = atPath operator -}
(p: (q: (r: (s: 1)))) @> ['p' 'q' 'r' 's'] = 1
(p: (q: (r: 1))) @/ 'p/q/r' = 1 {- @/ = atPath of splitBy('/') -}
(p: (q: (r: (s: 1)))) @/ 'p/q/r/s' = 1
let d = (w: (x: (y: (z: 1)))); d.atPathPut(['w', 'x', 'y', 'z'], -1); d::w::x::y::z = -1 {- atPathPut of dictionary, depth = 4 -}
(x: (y: 1))::x::y = 1 {- index sequence -}
[['w', 'x'], ['y', 'z']].atPath([1, 2]) = 'x' {- atPath of arrays -}
[['w', 'x'], ['y', 'z']][1][2] = 'x' {- index sequence -}
[['w', 'x'], ['y', 'z']] @> [1 2] = 'x' {- atPath operator on array or arrays -}
(1, 3 .. 21).includes(9) {- does interval include value -}
(1, 3 .. 21).doesNotInclude(6) {- does interval include value -}
(x: 1, y: 1, z: 1).allEqualBy { :p :q | p.value = q.value } {- are all items equal by comparator -}
(x: 1, y: 2, z: 3).allEqualBy { :p :q | p.value = q.value }.not {- are all items equal by comparator -}
[1, 1, 1].allEqual {- are all items equal -}
[1, 2, 3].allEqual.not {- are all items equal -}
(1 .. 4).reduce(Association:/2) = (((1 -> 2) -> 3) -> 4) {- reduce, happens to be left associative -}
(1 .. 4).reduce(-) = (((1 - 2) - 3) - 4) {- reduce, happens to be left associative -}
(1 .. 4).reduce(minus:/2) = (((1 - 2) - 3) - 4) {- with operator written out -}
(1 .. 4).assertIsOfSize(4) = (1 .. 4) {- assert collection is of indicated size -}
{ (1 .. 4).assertIsOfSize(3) }.ifError { true } {- assert collection is of indicated size -}
(1 .. 4).assertIsCollection = (1 .. 4) {- require that an object is a collection -}
{ '1 to 4'.assertIsCollection }.ifError { true } {- a string is not a collection, hence error -}
let a = []; [1, 2].cartesianProductDo([3, 4]) { :x :y | a.add(x -> y) }; a = [1 -> 3, 1 -> 4, 2 -> 3, 2 -> 4]
[1 2].cartesianProduct([3 4]) = [1 3; 1 4; 2 3; 2 4]
[1 2].cartesianProduct([3 4 5]) = [1 3; 1 4; 1 5; 2 3; 2 4; 2 5]
[1 2].elementType = 'SmallFloat'
[1 2; 3 4; 5 6].elementType = 'Array'
```

## Extensible -- collection trait
```
system.includesPackage('Extensible') {- package -}
let r = Array(); r.add('x'); r.add('x'); r.size = 2
let r = Bag(); r.add('x'); r.add('x'); r.size = 2
let r = Map(); r.add('x' -> 1); r.add('y' -> 2); r.size = 2
let r = Record(); r.add('x' -> 1); r.add('y' -> 2); r.size = 2
let r = Set(); r.add('x'); r.add('y'); r.size = 2
let r = ''; { r.add('x') }.ifError { :err | true }
```

## Removable -- collection trait
```
system.includesPackage('Removable') {- package -}
let r = Array(); r.add('x'); r.remove('x'); r.size = 0
let r = Bag(); r.add('x'); r.remove('x'); r.size = 0
let r = Map(); r.add('x' -> 1); r.remove('x' -> 1); r.size = 0
let r = Record(); r.add('x' -> 1); r.remove('x' -> 1); r.size = 0
let r = Set(); r.add('x'); r.remove('x'); r.size = 0
{ Array().remove('x') }.ifError { true }
{ Bag().remove('x') }.ifError { true }
{ Map().remove('x' -> 1) }.ifError { true }
{ Record().remove('x' -> 1) }.ifError { true }
{ Set().remove('x') }.ifError { true }
```

## Colour -- graphics type
```
system.includesPackage('Colour') {- colour package -}
Colour(1, 0, 0, 0.5).over(Colour(0, 1, 0, 0.5)) = Colour(1 / 3, 2 / 3, 0, 3 / 4)
Colour(0, 0, 0).isBlack {- is colour black -}
Colour(1, 1, 1).isWhite {- is colour white -}
[0.1, 0.2, 0.3].Colour = Colour(0.1, 0.2, 0.3) {- three element array constructor -}
[0.1, 0.2, 0.3, 0.4].Colour = Colour(0.1, 0.2, 0.3, 0.4) {- four element array constructor -}
Colour(0.5, 0.5, 0.5).isGreyOf(0.5) {- is colour grey with particular value -}
Colour(0.5, 0.5, 0.5).isGrey {- is colour grey -}
Colour(1, 0.2, 0.2).isRed {- is colour "red" -}
Colour(0.2, 1, 0.2).isGreen {- is colour "green" -}
Colour(0.2, 0.2, 1).isBlue {- is colour "blue" -}
Colour(0.9, 0.75, 0).isYellow {- is colour "yellow" -}
Colour(0, 0.75, 0.9).isCyan {- is colour "cyan" -}
Colour(0.9, 0, 0.75).isMagenta {- is colour "magenta" -}
Hsv(0, 0, 0).isBlack & { Hsv(0, 0, 1).isWhite } {- hue (in degrees) & saturation & value (in 0-1) -}
Hsv(0, 1, 1).isRed & { Hsv(120, 1, 1).isGreen } & { Hsv(240, 1, 1).isBlue }
Hsv(60, 1, 1).isYellow & { Hsv(180, 1, 1).isCyan } & { Hsv(300, 1, 1).isMagenta }
Hsv(0, 0, 0.5).isGreyOf(0.5) & { Hsv(0, 0, 0.75).isGreyOf(0.75) }
Hsv(0, 1, 0.75).isRed & { Hsv(120, 1, 0.5).isGreen } & { Hsv(240, 1, 0.5).isBlue }
0.5.srgbFromLinear = 0.7353569830524495 {- transfer function from (linear) rgb to srgb -}
0.7353569830524495.srgbToLinear = 0.5 {- transfer function from srgb to (linear) rgb -}
let c = Colour(1, 0, 0, 0.5); let z = c.copy; z.green := 1; c ~= z & { z = Colour(1, 1, 0, 0.5) } {- copy colour -}
'#f97306'.parseHexColour = Colour(16rf9 / 255, 16r73 / 255, 16r06 / 255) {- parse hex colour, here orange -}
system.colourNameTable::orange = Colour(1, 0.6, 0) {- colour name table -}
system.colourNameTable::veryLightGray.isGrey {- colour name table -}
```

## Comparing
```
1 = 1 {- 1 is equal to 1 -}
2 ~= 1 {- 2 is not equal to 1 -}
2 > 1 {- 2 is greater than 1 -}
1 < 2 {- 1 is less than 2 -}
1 >= 1 {- 1 is greater than or equal to 1 -}
2 <= 1 = false {- 2 is not less than or equal to 1 -}
'x' < 'y' {- 'x' is less than 'y' -}
{ false < true }.ifError { true } {- booleans are not magnitudes -}
```

## Comparing -- arrays
```
[1, 'zebra'] < [2, 'apple'] = [true, false ] {- pointwise? - 1 is less than 2 and 'zebra' is grater than 'apple' -}
[3, 'apple'] < [3, 'bird'] = [false, true] {- pointwise? - 3 is equal to 3 and 'apple' is less than 'bird' -}
[4, 'dog'] = [4, 'dog'] {- 4 is equal to 4 and 'dog' is equal to 'dog' -}
```

## Complex -- numeric type
```
system.includesPackage('Complex') {- complex package -}
Complex(0, 0).isComplex {- complex numbers -}
Complex(-1, 0).real = -1 {- real part of complex number -}
Complex(-1, 0).imaginary = 0 {- imaginary part of complex number -}
Complex(-1, 0) + 1 = Complex(0, 0) {- complex addition with scalar -}
1.i = Complex(0, 1) {- i makes an imaginary number -}
(5 - 6.i) + (-5 + 8.i) = (0 + 2.i)
5 * (5 - 6.i) = (25 - 30.i)
2 * [1 + 2.i, 3 + 4.i, 5 + 6.i] = [2 + 4.i, 6 + 8.i, 10 + 12.i]
5 + 5.i * [1 + 2.i, 3, 5 + 6.i] = [-5 + 15.i, 15 + 15.i, -5 + 55.i]
(5 = 5.i) = false
1 ~= 1.i
(6 - 6.i).abs = 72.sqrt
(1 + 2.i) + 1 = (2 + 2.i)
1 + (1 + 2.i) = (2 + 2.i)
((1 + 2.i) + 1) = (2 + 2.i)
(1 + (1 + 2.i)) = (2 + 2.i)
((1 + 2.i) + (2 / 3)).closeTo((5 / 3) + 2.i)
((2 / 3) + (1 + 2.i)).closeTo((5 / 3) + 2.i)
(0 + 5.i).arg = (1.pi / 2)
let c = (5 - 6.i); (c * 1.i) = c.i
(2 + 5.i).negated = (-2 - 5.i)
(2 + 5.i).reciprocal = ((2 / 29) - (5 / 29).i)
(6 - 6.i).squared = -72.i
(1 + 2.i) = (1 + 2.i) = true {- equality = same value -}
(1 + 2.i) == (1 + 2.i) = false {- identity = different objects -}
(1 + 2.i) ~= (1 + 4.i) = true {- inequality -}
let c = 2.i; let z = c.copy; z.real := 3; z ~= c & { z = (3 + 2.i) } {- copy complex -}
(0.5 * (2 + 0.i).log).exp = (0.5 * 2.log).exp {- natural logarithm -}
(3 + 5.i) ^ 0 = (1 + 0.i) {- exponent of zero answers one -}
(3 + 5.i) ^ 1 = (3 + 5.i) {- exponent of one is identity -}
(3 + 5.i) ^ 2 ~ (-16 + 30.i)
(1 + 2.i) * (2 - 3.i) = (8 + 1.i) {- complex number with complex exponent -}
(1 + 2.i) / (1 - 2.i) = (-0.6 + 0.8.i)
(1 + 2.i) + (1 - 2.i) = (2 + 0.i)
(-3 + 2.i) - (5 - 1.i) = (-8 + 3.i)
(-1 + 2.i) ^ 2 ~ (-3 - 4.i)
(-1 + 2.i) ^ 2.5 ~ (2.7296 - 6.9606.i)
(-1 + 2.i) ^ (1 + 1.i) = (-0.27910381075826657 + 0.08708053414102428.i)
3 * (2 - 5.i) = (6 - 15.i)
3 * ((2 - 5.i) ^ 2) ~ (-63 - 60.i)
3 * ((2 - 5.i) ^ -1) ~ (0.2069 + 0.5172.i)
2 * (1 - 1.i) = (2 - 2.i)
(2 + 3.i) - 1 = (1 + 3.i)
(1 + 2.i) + 0.5 = (1.5 + 2.i)
(2 + 3.i) - 0.5.i = (2 + 2.5.i)
0.75 * (1 + 2.i) = (0.75 + 1.5.i)
(2 + 3.i) / 2 = (1 + 1.5.i)
(1 - 3.i) / (2 + 2.i) = (-0.5 - 1.i)
2 * (1.i ^ 2) ~ (-2 + 0.i)
1 + (3 / 4.i) = (1 - 0.75.i)
let z = 1 + 2.i; z.real = 1 & { z.imaginary = 2 }
let z = 1 + 2.i; z.conjugated = (1 - 2.i) & { z.absSquared = 5 }
let z = 1 + 2.i; z.abs ~ 2.2361 & { z.arg ~ 1.1071 } {- absolute value (modulus, magnitude) and argument (phase) -}
1.i.sqrt ~ (0.7071 + 0.7071.i)
(1 + 2.i).sqrt ~ (1.2720 + 0.7861.i)
(1 + 2.i).cos ~ (2.0327 - 3.0519.i)
(1 + 2.i).exp ~ (-1.1312 + 2.4717.i)
(1 + 2.i).sinh ~ (-0.4891 + 1.4031.i)
(-1 + 0.i).sqrt = (0 + 1.i) {- the square root of negative one is i -}
(2 + 3.i).zero = (0 + 0.i) {- zero of same type, i.e. complex -}
(2 + 3.i).one = (1 + 0.i) {- one of same type, i.e. complex -}
1 / (1 + 2.i) = (0.2 - 0.4.i) {- reciprocal, multiplicative inverse -}
let n = (1 + 2.i); n.reciprocal * n = 1 {- multiplicative inverse -}
(1 + 0.i).isInteger = false {- a complex number is not an integer -}
(1 + 0.i).isFraction = false {- a complex number is not a fraction -}
3:2.asComplex = Complex(3:2, 0) {- fraction as complex -}
0:1.i = Complex(0, 0:1) {- complex with integral real part and fractional imaginary part -}
3:2 + 0:1.i = 3:2.asComplex
3:2.asComplex + 0:1.i = 3:2.asComplex {- add 0i to a complex number is identity -}
```

## Conditional Statements
```
true.ifTrue { 'T' } = 'T' {- if true then, answers answer of branch block or nil -}
true.ifFalse { 'F' } = nil {- if false then, answers answer of branch block or nil -}
true.if { 'T' } { 'F' } = 'T' {- if true then else if false then, answers answer of chose block -}
let x = nil; true & { x := 1 }; x = 1 {- side effect on conditional and -}
let x = nil; false & { x := 1 }; x = nil {- no side effect on conditional and -}
let x = nil; true | { x := 1 }; x = nil {- no side effect on conditional or -}
let x = nil; false | { x := 1 }; x = 1 {- side effect on conditional or -}
```

## Constants
```
true {- true constant -}
false.not {- false constant -}
nil.isNil {- nil object constant -}
inf.isNumber {- Infinity constant -}
1.pi.isNumber {- pi constant -}
1.isNumber {- integer constants -}
3.14.isNumber {- float constants -}
-1.isNumber {- negative integer constants -}
-3.14.isNumber {- negative float constants -}
'Hello'.isString {- string constant -}
[3, 2, 1].isArray {- array constants -}
['one', 2, 3.141].isArray {- mixing of types allowed -}
```

## Converting -- type conversion
```
[true, false].collect(asBit:/1) = [1, 0] {- boolean to bit (integer) -}
1.pi.asFloat = 1.pi {- small float as float is identity -}
3:4.asFloat = 0.75 {- fraction as float -}
23.asFloat = 23.0 {- integer as float -}
23n.asFloat = 23.0 {- large integer as float -}
{ '23'.asFloat }.ifError { true } {- asFloat is not a parser -}
1.pi.asSmallFloat = 1.pi {- identity -}
3:4.asSmallFloat = 0.75 {- fraction to small float -}
23.asSmallFloat = 23.0 {- integral to small float -}
true.asInteger = 1 {- boolean as integer, c.f. asBit -}
false.asInteger = 0 {- boolean as integer, asBit -}
'~'.asCharacter.asInteger = 126 {- character as integer, c.f. codePoint -}
23.asInteger = 23 {- small integer as integer, c.f. identity -}
-23.asInteger = -23 {- identity -}
1.pi.asInteger = 3 {- small float as integer, c.f. truncated -}
(0 - 1.pi).asInteger = -3 {- floating point is truncated -}
22:7.asInteger = 3 {- fraction as integer, c.f. truncated -}
-22:7.asInteger = -3 {- fraction is truncated -}
7:8.asInteger = 0 {- fraction is truncated -}
'23'.asInteger = 23 {- string is parsed, c.f. parseDecimalInteger -}
{ '3.141'.asInteger }.ifError { true } {- floating point strings are not decimal integers -}
{ '3x'.asInteger }.ifError { true } {- large radix strings are not decimal integers -}
false.asNumber = 0 {- asBit -}
true.asNumber = 1 {- asBit -}
1.pi.asNumber = 1.pi {- identity -}
23.asNumber = 23 {- identity -}
'3.141'.asNumber = 3.141 {- parse floating point -}
'-672.433244'.asNumber = -672.433244 {- parse negative floating point -}
'0.03141e2'.asNumber = 3.141 {- parse scientific -}
'23'.asNumber = 23 {- parse integer -}
'-23'.asNumber = -23 {- parse integer -}
1.pi.asFraction = 311:99 {- asFraction(100) -}
1.pi.asFraction(10) = 22:7 {- with maximum denominator -}
22:7.asFraction = 22:7 {- identity -}
23.asFraction = 23 {- identity -}
[0, 0].asPoint = (0 @ 0) {- array as point -}
(0, 0).asPoint = Point(0, 0) {- tuple as point -}
(0 @ 0).asPoint = (0 @ 0) {- identity -}
Point(0, 0).asPoint = Point(0, 0) {- identity -}
1.asComplex = Complex(1, 0) {- number to complex -}
1.i = Complex(0, 1) {- number to complex -}
(2 + 3.i).asComplex = Complex(2, 3) {- identity -}
126.asCharacter = '~'.asCharacter {- integer to character -}
'~'.asCharacter.isCharacter {- string to character -}
let c = '~'.asCharacter; c.asCharacter == c {- identity -}
let c = 126.asCharacter; c.asString = '~' & { c.printString = '$~' } {- character to string -}
'~'.asString = '~' {- identity operation -}
'~'.asString == '~' {- identity operation -}
23.asString = '23' {- Object>>printString (integral to string) -}
15.asHexDigit = 'F'.asCharacter {- integral to hex character -}
{ 16.asHexDigit }.ifError { true } {- error if out of range -}
'x'.asCharacter = 120.asCharacter {- string to character -}
120.asCharacter = 'x'.asCharacter {- small integer to character -}
let c = 'x'.asCharacter; c.asCharacter == c {- character to character -}
```

## Converting -- unit conversion
```
180.degreesToRadians = 1.pi {- convert degrees to radians -}
1.pi.radiansToDegrees = 180 {- convert radians to degrees -}
```

## Copying
```
let b = true; b.copy == b {- copy boolean, identity -}
let n = 3.141; n.copy == n {- copy small float, identity -}
let n = 23n; n.copy == n {- copy large integer, identity -}
let s = 'string'; s.copy == s {- copy string, identity -}
let a = ('x' -> 1); let c = a.copy; c.value := 2; c ~= a & { c = ('x' -> 2) } {- copy association -}
let t = (0, 0); let c = t.copy; c.first := 1; c ~= t & { c = (1, 0) } {- copy two tuple -}
let f = 3:4; let c = f.copy; c.numerator := 1; c ~= f & { c = 1:4 } {- copy fraction -}
let c = 2.i; let z = c.copy; z.real := 3; z ~= c & { z = (3 + 2.i) } {- copy complex -}
let a = [1, [2]]; let c = a.shallowCopy; c[2][1] := -2; c = a & { a = [1, [-2]] } {- shallowCopy array -}
let a = [1, [2]]; let c = a.deepCopy; c[2][1] := -2; c ~= a & { a = [1, [2]] } {- deepCopy array -}
let a = [1, [2]]; let c = a.copy; c[2][1] := -2; c = a {- copy of array is shallowCopy and postCopy -}
let b = [1, 2, 2].asBag; let c = b.copy; c.add(3); c ~= b & { c = [1, 2, 2, 3].asBag } {- copy bag -}
let b = [1, 2].asBitset; let c = b.copy; c.add(3); c ~= b & { c = [1, 2, 3].asBitset } {- copy bitset -}
let b = [1, 2].asByteArray; let c = b.copy; c[1] := 3; c[1] = 3 & { b[1] = 1 } {- copy byte array -}
```

## Date -- temporal type
```
system.includesPackage('Date') {- date package -}
Date(system).typeOf = 'Date' {- type of Date, system constructor gets current date and time -}
0.asDate.isDate {- Date type predicate, number constructor accepts time from epoch in seconds -}
(60 * 60 * 12).asDate.iso8601 = '1970-01-01T12:00:00.000Z' {- translate Date to ISO-8601 string -}
'1970-01-01T00:00:01.000Z'.parseDate.unixTimeInMilliseconds = 1000 {- parse ISO-8601 string & convert to unix time -}
let d = 0.asDate; [d.year, d.month, d.dayOfMonth] = [1970, 1, 1] {- month and day are one-indexed -}
let d = 0.asDate; [d.hours + (d.offsetSeconds / 60 / 60), d.minutes, d.seconds] = [0, 0, 0] {- hour is in local time -}
0.asDate = 0.asDate {- dates are comparable -}
0.asDate ~= Date(system) {- dates are comparable -}
0.asDate < Date(system) {- dates are magnitudes -}
Date(system) > 0.asDate {- dates are magnitudes -}
'2023-05-11'.parseDate.iso8601 = '2023-05-11T00:00:00.000Z' {- read date from partial ISO-8601 string -}
```

## Dictionary -- collection trait
```
system.includesPackage('Dictionary') {- package -}
(x: 1, y: 2, z: 3).count(even:/1) = 1 {- count elements that match predicate -}
(x: 1, y: 2).select { :each | false } = () {- select nothing -}
(x: 1, y: 2, z: 3).select(odd:/1) = (x: 1, z: 3) {- select odd values -}
(x: 1, y: 2, z: 3).select(even:/1) = (y: 2) {- select even values -}
{ ().at('x') }.ifError { true } {- indexing with an unknown key is an error -}
(x: nil).at('x') = nil {- as does indexing a field that is set to nil -}
(x: nil).size = 1 {- nil fields exist -}
(x: nil).indices = ['x'] {- nil fields exist -}
().atIfAbsentPut('x') { 1 } = 1 {- at or atPut followed by at -}
let d = (); d.atIfAbsentPut('x') { 1 } = 1 & { d::x = 1 }
(x: 1, y: 2).includes(2) {- includes, testing values for equality -}
(x: 1, y: [2, 3]).includes([2, 3])
(x: 1, y: 2).includesIdentity(2) {- includes, testing for identity not equality -}
(x: 1, y: [2, 3]).includesIdentity([2, 3]) = false
(x: 1, y: 2).includesAssociation('y' -> 2) {- includes association, testing for equality -}
(x: 1, y: [2, 3]).includesAssociation('y' -> [2, 3])
(x: 1, y: 2).includesAssociation('x' -> 2) = false
let d = (x: 1); let a = 'y' -> 2; d.add(a) = a & { d = (x: 1, y: 2) } {- add association -}
{ (x: 1).add('y') }.ifError { true } {- only associations may be added -}
{ (x: 1).add('x' -> 2) }.ifError { true } {- add can only add associations for keys that are not already included -}
let d = (x: 1, y: 2); d.includeAll(y: 3, z: 4); d = (x: 1, y: 3, z: 4) {- includeAll replaces existing entries -}
let p = (x: 1); let q = (y: 2); p.declareFrom('y', q); [p, q] = [(x: 1, y: 2), ()]
let p = (x: 1); let q = (x: 2); p.declareFrom('x', q); [p, q] = [(x: 1), (x: 2)]
let p = (); let q = (x: 1); p.declareFrom('x', q); [p, q] = [(x: 1), ()]
let p = (); let q = (x: 1); p.declareFrom('y', q); [p, q] = [(y: nil), (x: 1)]
(x: 1, y: 2, z: 3).collect(squared:/1) = (x: 1, y: 4, z: 9)
let d = (x: 1, y: 2, z: 3); d.replace(squared:/1); d = (x: 1, y: 4, z: 9) {- replace value at each key, in place collect -}
{ (x: 1).remove }.ifError { true } {- should not implement, see removeKey -}
(x: 1, y: 2) ++ (x: 2, y: 1) = (x: 2, y: 1) {- appending two dictionaries is right-biased, unicode = ⧺ -}
(x: 1, y: 2) ++ ['z' -> 3] = (x: 1, y: 2, z: 3) {- append an array of associations to a dictionary -}
{ (x: 1, y: 2) ++ [3] }.ifError { true } {- right hand side must be associations -}
(x: 1, y: 2).anySatisfy(even:/1) {- collection predicates at dictionary consider values not associations -}
(x: 1, y: 2, z: 3).detect(even:/1) = 2 {- detect value -}
let n = 0; (x: 1, y: 2, z: 3).do { :each | n := n + each }; n = 6 {- do iterates over values, not associations -}
let n = 0; (x: 1, y: 2, z: 3).valuesDo { :each | n := n + each }; n = 6 {- iterate over values -}
let a = []; (x: 1, y: 2, z: 3).indicesDo { :each | a.add(each) }; a = ['x', 'y', 'z'] {- iterate over indices (keys) -}
let n = 0; (x: 1, y: 2, z: 3).associationsDo { :each | n := n + each.value }; n = 6 {- iterate over associations -}
let n = 0; (x: 1, y: 2, z: 3).withIndexDo { :value :key | n := n + value }; n = 6 {- iterate over keys and values -}
(x: 'x', y: '.', z: 'z').associationsSelect { :each | each.key = each.value } = (x: 'x', z: 'z') {- select querying associations -}
(x: 1, y: 2, z: 3).indices = ['x', 'y', 'z'] {- indices of dictionary (an array) -}
let d = (a: 1, b: 2, c: 1); d.indexOf(2) = 'b' {- lookup key (index) given value -}
let d = (a: 1, b: 2, c: 1); let k = d.indexOf(1); k = 'a' | { k = 'c' } {- many keys with value -}
{ (a: 1, b: 2, c: 1).indexOf(3) }.ifError { true } {- error if no such value -}
let d = (x: 1, y: 2, z: 3); d.removeAllSuchThat { :each | each.key = 'y' | { each.value = 3 } }; d = (x: 1)
let d = (x: 1, y: 2, z: 3); d.associationsRemove { :each | each.key = 'y' | { each.value = 3 } }; d = (x: 1)
let d = (x: 1, y: 2, z: 3); d.keysAndValuesRemove { :key :value | key = 'y' | { value = 3 } }; d = (x: 1)
let d = (x: 1, y: 2, z: 3); d.removeKey('y') = 'y' & { d = (x: 1, z: 3) }
{ (x: 1, y: 2, z: 3).removeKey('?') }.ifError { true }
let d = (x: 1, y: 2, z: 3); d.removeAt('y') = 2 & { d = (x: 1, z: 3) }
{ (x: 1, y: 2, z: 3).removeAt('?') }.ifError { true }
let d = (x: 1, y: 2); d.atAllPut(3) = 3 & { d = (x: 3, y: 3) } {- set all values to indicated object -}
(x: 1, y: 2, z: 3).associations = ['x' -> 1, 'y' -> 2, 'z' -> 3] {- array of associations -}
(x: 1, y: 2, z: 3).basicAt('x') = 1 {- unchecked lookup -}
(x: 1, y: 2, z: 3).basicAt('u') = nil {- unchecked lookup, nil on absent key -}
let a = Array(9); a.indicesDo { :each | a[each] := 10 - each }; a = [9 .. 1] {- iterate indices -}
let d = (x: 1, y: 2); d.removeAssociation('x' -> 1); d = (y: 2) {- remove association -}
let d = (x: 1, y: 2); d.removeAssociationIfAbsent('z' -> 3) { }; d = (x: 1, y: 2) {- remove association, if absent clause -}
{ (x: 1, y: 2).removeAssociation('z' -> 3) }.ifError { true } {- remove association, error if absent -}
let d = (x: 1, y: 2); d.removeAll; d.isEmpty {- remove all entries -}
(x: 1, y: 2).keyAtValue(2) = 'y' {- dictionary name for indexOf -}
let d = (x: 1, y: 2); d.keyAtValue(2) = d.indexOf(2) {- dictionary name for indexOf -}
(x: 1, y: 2, z: 3).keys = ['x' 'y' 'z'] {- array of keys at dictionary -}
(x: 1, y: 2, z: 3).values = [1 2 3] {- array of values at dictionary -}
let d = (c: 3, parent: (b: 2, parent: (a: 1))); ['a', 'b', 'c'].collect { :each | d.atDelegateTo(each, 'parent') } = [1, 2, 3]
let d = (c: 3, parent: (b: 2, parent: (a: 1))); ['a', 'b', 'c'].collect { :each | d.messageSend(each, 'parent', []) } = [1, 2, 3]
let d = (x: 1, parent: (y: 2, parent: (z: 3))); d.atPutDelegateTo('z', -3, 'parent'); d.atDelegateTo('z', 'parent') = -3
```

## Duration -- temporal type
```
system.includesPackage('Duration') {- duration package -}
2.seconds.typeOf = 'Duration' {- make duration from number of seconds -}
5.hours.isDuration = true {- make duration from number of hours -}
0.25.seconds = 250.milliseconds {- make duration from number of milliseconds, durations are comparable -}
3.hours.seconds = 10800 {- convert duration to seconds -}
1.5.seconds.milliseconds = 1500 {- convert duration to milliseconds -}
0.5.seconds + 750.milliseconds = 1.25.seconds {- addition of durations -}
2.weeks - 12.days = 48.hours {- subtraction of durations -}
0.25.seconds + 500.milliseconds = 750.milliseconds
500.milliseconds + 0.25.seconds = 0.75.seconds
let f = { :t0 | let t1 = 2.randomFloat.seconds; f:/1.valueAfterWith(t1, t1) }; f(2.seconds).cancel = nil
2.minutes < 2.hours {- durations are magnitudes -}
2.hours > 2.minutes {- durations are magnitudes -}
60.seconds.milliseconds = 60000 {- convert duration to milliseconds -}
60.seconds.seconds = 60 {- convert duration to seconds -}
60.seconds.minutes = 1 {- convert duration to minutes -}
3.days.hours = 72 {- convert duration to hours -}
3.weeks.days = 21 {- convert duration to days -}
'P1W1DT1H1M1S'.parseDuration.seconds = 694861 {- parse ISO-8601 duration string -}
'P2DT2H2M2S'.parseDuration.seconds = 180122 {- parse ISO-8601 duration string -}
'P3DT4H'.parseDuration = (3.days + 4.hours)
(2.days + 2.hours + 2.minutes + 2.seconds).seconds = ((2 * 24 * 60 * 60) + (2 * 60 * 60) + (2 * 60) + 2)
let d = 2.seconds; let c = d.copy; d ~~ c & { d = c } {- copy duration -}
1.siderealMonths = 27.321661.days {- as defined with respect to the celestial sphere -}
1.synodicMonths = 29.53059.days {- as define with respect to the line joining the sun and earth -}
(29.days + 12.hours + 44.minutes + 2.9.seconds - 1.synodicMonths).abs = 76.milliseconds
27.days + 7.hours + 43.minutes + 11.6.seconds - 1.siderealMonths < 1.seconds
1.julianYears = 365.25.days
3.minutes * 3 = 9.minutes {- multiply duration by number -}
9.minutes / 3 = 3.minutes {- divide duration by number -}
-3.seconds.abs = 3.seconds {- absolute value -}
(3.minutes - 2.hours).abs = (1.hours + 57.minutes) {- absolute value -}
7:8.milliseconds.seconds = 7:8000 {- fraction as duration -}
2.minutes.asSeconds = 120.asSeconds {- seconds of duration, or identity of number -}
```

## Error -- exception type
```
system.includesPackage('Error') {- package -}
Error().isError = true {- an error with no message is an error -}
Error().isException = true {- an error is an exception -}
Error('Error message').isError = true {- error with message is an error -}
Error('Error message').name = 'Error' {- an error has a name -}
Error('Error message').messageText = 'Error message' {- an error has a message -}
{ Error('Error message').signal }.ifError { true } {- signal error -}
{ 'Error message'.error }.ifError { true } {- generate and signal an error -}
{ Error('message').copy }.ifError { true } {- cannot copy errors -}
let x = nil; { x := false }.ensure { x := true }; x {- ensure termination block is evaluated -}
let x = nil; { { ''.error }.ensure { x := true } }.ifError { }; x {- ensure termination block is evaluated -}
```

## Float64Array -- collection type
```
system.includesPackage('Float64Array') {- package -}
Float64Array(0).typeOf = 'Float64Array' {- type of -}
Float64Array(0).species = Float64Array:/1 {- species -}
Float64Array(0).isFloat64Array {- type predicate -}
Float64Array(0).isEmpty {- is empty predicate -}
Float64Array(8).size = 8 {- size of -}
Float64Array(8).at(1) = 0 {- at protocol, initialized to zero -}
Float64Array(8).atPut(1, 1.pi) = 1.pi {- atPut protocol, answer value put -}
let a = Float64Array(8); a.atPut(1, 1.pi) = 1.pi & { a.at(1) = 1.pi }
let a = Float64Array(8); (a[1] := 1.pi) = 1.pi & { a[1] = 1.pi }
(1 .. 9).asFloat64Array.isFloat64Array = true {- interval as array -}
(1 .. 9).asFloat64Array.reversed = (9 .. 1).asFloat64Array {- reversed copy -}
let a = [1 .. 9].asFloat64Array; a.reverse; a = (9 .. 1).asFloat64Array {- reverse in place -}
let a = (9 .. 1).asFloat64Array; a.sort; a = (1 .. 9).asFloat64Array {- sort in place -}
{ Float64Array(1).atPut(3, 'x') }.ifError { true } {- out of bounds error -}
let a = Float64Array(1); a.basicAtPut(1, 'x'); a.at(1).isNaN = true {- unsafe mutation inserts NaN -}
let a = Float64Array(1); a.basicAtPut(3, 'x'); a.basicAt(3) = nil {- unsafe mutation does not extend array -}
(1 .. 3).asFloat64Array.printString = '[1, 2, 3].asFloat64Array'
(1 .. 3).asFloat64Array.storeString = '[1, 2, 3].asFloat64Array'
let a = (1 .. 3).asFloat64Array; let c = a.copy; c[1] := 3; c ~= a & { c.asArray = [3, 2, 3] } {- copy -}
```

## Floating point
```
1.0 * 3.0 > 3.0 = false {- integral floating point math -}
0.1 * 3.0 > 0.3 = true {- general floating point math -}
1.0 * 3.0 = 3.0 = true {- integral floating point math -}
0.1 * 3.0 = 0.3 = false {- general floating point math -}
1.0 + 1.0 + 1.0 = 3.0 = true {- integral floating point math -}
0.1 + 0.1 + 0.1 = 0.3 = false {- general floating point math -}
'-1.4'.asNumber = -1.4 {- parse float -}
```

## Fraction -- numeric type
```
system.includesPackage('Fraction') {- fraction package -}
2:3.isFraction {- literal syntax for fractions is numerator:denominator -}
Fraction(2, 3).isFraction {- fractional type -}
2:3 = Fraction(2, 3) {- literal syntax -}
Fraction(4, 6).reduced = 2:3 {- reduced fraction -}
Fraction(4, 6) ~= 2:3 {- non-reduced fraction -}
2:3 = 4:6 {- literals are reduced by construction -}
2 / 3:4 = 8:3 {- division -}
2:3 + 2:3 = 4:3 {- addition -}
2/3 + 2/3 = (8/9) {- (2 / 3 + 2) / 3 -}
2:3 + 1:2 = 7:6 {- reduction to common denominator -}
2:3 + 4:3 = 2 {- addition to integer -}
1:2 - 1:2 = 0 {- subtraction -}
3:4 - 1:2 = 1:4 {- subtraction -}
3:2.ceiling = 2 {- ceiling -}
-3:2.ceiling = -1 {- ceiling -}
4:3.denominator = 3 {- denominator -}
4:3.gcd(7:5) = 1:15 {- greatest common denominator -}
4:3.lcm(7:5) = 28 {- least common multiple -}
4:3.negated = -4:3 {- negation -}
4:3.negative.not {- is negative predicate -}
4:3.numerator = 4 {- numerator -}
2:3.raisedToInteger(5) = 32:243 {- fractions also can be exponentiated -}
2:3 ^ 5 = 32:243 {- fractions also can be exponentiated using infix operator -}
{ 2:3 ^ 3:4 }.ifError { true } {- only integer exponents are implemented -}
9:5.reciprocal = 5:9 {- reciprocal, mutiplicative inverse -}
let n = 9:5; n.reciprocal * n = 1 {- mutiplicative inverse -}
7:5.squared = 49:25 {- square of -}
3:2.truncated = 1 {- truncation -}
1:2 < 0.5 = false
1:3 > 0.25
0.5 < 1:2 = false
0.25 < 1:3
0.5 < 1:4 = false
0.5 < 1:2 = false
0.5 < 3:4
0.5 <= 1:4 = false {- less than or equal to, unicode = ≤ -}
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
23.denominator = 1 {- denominator of integer is one -}
1:3 + 1:7 = 10:21
Fraction(3, 1) = 3:1
-3:2.negated = 3:2
-3:2.abs = 3:2
3:2.ceiling = 2
-3:2.ceiling = -1
3:2.floor = 1
-3:2.floor = -2
353:359.printString = '353:359' {- Fraction print string -}
59:61.storeString = 'Fraction(59, 61)' {- Fraction store string -}
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
3:2.rounded = 2 {- in case of tie, round to upper magnitude -}
-3:2.rounded = -2
1.pi.roundUpTo(0.01) = 3.15 {- round up to nearest 1/100th -}
1.pi.roundUpTo(0.1) = 3.2 {- round up to nearest 1/10th -}
1923.roundUpTo(10) = 1930 {- round up to nearest multiple of 10 -}
1.pi.roundUpTo(0.005) = 3.145 {- round up to nearest 5/1000th -}
1.pi.negated.roundUpTo(0.01) = -3.14 {- rounding up a negative number rounds towards zero -}
1.pi.roundUp = 4 {- round up to nearest integer -}
-3:2.numerator.negative {- numerator of negative fraction is negative -}
-3:2.denominator.positive {- denominator of negative fraction is positive -}
4:6.numerator = 2 {- literal fractions are reduced -}
4:6.denominator = 3 {- literal fractions are reduced -}
4:2 = 2
Fraction(4, 6).numerator = 4 {- Fraction is not initially reduced -}
Fraction(4, 6).denominator = 6 {- Fraction is not initially reduced -}
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
3:2.asSmallFloat = 1.5 {- fraction as float -}
0.5 < 2:3 = true
2:3 > 0.5 = true
1 < 3:2 = true
3:2 > 1 = true
3:4.unicode = '¾' {- unicode character for fraction, else error -}
2:3.unicode = '⅔' {- unicode character for fraction, else error -}
{ 9:11.unicode }.ifError { true } {- unicode character for fraction, else error -}
system.unicodeFractionsTable.isDictionary = true
system.unicodeFractionsTable.associations.isArray = true
let n = system.unicodeFractionsTable.associations.collect(value:/1); n = n.sorted
'4:3'.parseFraction = 4:3 {- parse fraction -}
'4/3'.parseFraction('/') = 4:3 {- parse fraction given delimiter -}
'4:3'.asNumber = 4:3 {- the fraction module modifies asNumber to parse fractions -}
let x = Fraction(2 ^ 55, 2); x ~= (x - 1) = false {- fractions of large small floats behave strangely -}
let x = Fraction(2n ^ 55n, 2); x ~= (x - 1) {- fractions of large large integers behave ordinarily -}
2:3 ~= 3:4 {- unequal fractions -}
(2:3 == 2:3).not {- non-identical fractions (equal fractions need not be the same object) -}
2:3 ~~ 2:3 {- non-identical fractions -}
2:3 ~~ 3:4 {- non-identical fractions -}
355:113.limitDenominator(77) = 223:71
223:71.limitDenominator(7) = 22:7
22:7.limitDenominator(5) = 16:5
355:113.limitDenominator(7) = 22:7
[1:2, 5:10, 10:20, 50:100, 500:1000].collect { :n | n.limitDenominator(5) } = [1:2, 1:2, 1:2, 1:2, 1:2]
[10, 100].collect { :n | 0.367879.asFraction(n) } = [3:8, 32:87]
(1 .. 5).collect { :n | 1.pi.asFraction(10 ^ n) } = [22:7, 311:99, 2862:911, 9563:3044, 313842:99899]
1.pi.asFraction = 311:99 {- with maximumDenominator set to one hundred -}
(1 / [2, 3, 5, 7, 11, 13, 17]).collect(asFraction:/1) = [1:2, 1:3, 1:5, 1:7, 1:11, 1:13, 1:17]
6:8 * 4 = 3 {- answer integer -}
7:8 / 3 = 7:24 {- division by integer is fraction -}
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
(3:4).asSmallFloat = 0.75
(1:2).asSmallFloat = (1 / 2)
-1:3.typeOf = 'Fraction'
3:5 + 1 = 8:5
3:5 - 0.5 ~ 0.1
0.5 ~ 1:2
0.3333 ~ 1:3
0.33 < (1:3)
1:3 - 0.33 ~ 0.003333
1:3.zero = Fraction(0, 1) {- zero of same type, i.e. fraction -}
1:3.one = Fraction(1, 1) {- one of same type, i.e. fraction -}
1:3 ~ (1 / 3) {- a fraction is close the floating point division it represents -}
1:2 * 2 = 1 {- multiply to integer -}
4:2 / 2 = 1 {- divide to integer -}
1:2 + 1:2 = 1 {- sum to integer -}
3:2 - 1:2 = 1 {- subtract to integer -}
2:7 * (1 + 2.i) = (2:7 + 4:7.i)
2:7 * (1.5 + 2.i) ~ (0.4286 + 0.5714.i)
3:2 / (1 + 2.i) ~ (3:10 - 3:5.i)
1:2 + 2.i ~ (1:2 + 2:1.i)
(1:2 + 1:2).isInteger {- fractions with unit denominators are integers -}
1:2.fractionPart = 1:2 {- the fractional part of a number between zero and one is identity -}
4:3.fractionPart = 1:3 {- fraction math is exact -}
64:33.primeLimit = 11 {- the prime limit of a fraction is maximum of the limit of each part -}
1:1.primeLimit = 0 {- by convention the prime limit of one is zero -}
64:33.primeFactors = [2, 2, 2, 2, 2, 2, 1:3, 1:11] {- the factors of the denominator are fractions -}
64:33.primeFactors.product = 64:33 {- the product of the factors is the fraction -}
3:8.primeFactorization = [2 -> -3, 3 -> 1] {- factors of fraction -}
```

## Frequency -- temporal type
```
system.includesPackage('Frequency') {- frequency package -}
1.hertz.typeOf = 'Frequency' {- frequency from hertz (cyles per second) -}
1.hertz.isFrequency {- frequency predicate -}
1.hertz.printString = '1.hertz' {- frequency print string -}
10.hertz.asDuration = (1 / 10).seconds {- duration is the reciprocal of frequency -}
(1 / 10).seconds.asFrequency = 10.hertz {- frequency is the reciprocal of duration -}
44.1.kilohertz = 44100.hertz {- frequencies are eq, kilohertz (thousands of cycles per second) -}
1.kilohertz.asDuration = 1.milliseconds {- the period of 1kHz is 1ms -}
44.1.hertz < 44.1.kilohertz {- frequencies are magnitudes -}
1.kilohertz.asHertz = 1000.asHertz {- hertz of frequency, or identity of number -}
```

## Graph -- collection type
```
system.includesPackage('Graph') {- graph package -}
Graph(0, []).typeOf = 'Graph' {- graph type -}
Graph(0, []).isGraph {- graph predicate -}
let g = Graph(3, [1 2; 2 3; 3 1]); g.size = 3 & { g.edges.size = 3 }
Graph(3, [1 2; 2 3; 3 1], ['x' 'y' 'z'], ['i', 'j', 'k']).isValid {- query coherence -}
```

## Hash -- murmur hash
```
'String Input'.murmur3(2166136261) = [2006581733, 2651545595, 2673830536, 2103835251]
```

## Heap -- collection type
```
system.includesPackage('Heap') {- heap package -}
Heap().isHeap {- an empty heap is a heap -}
Heap().size = 0 {- an empty heap has size 0 -}
Heap().isEmpty {- an empty heap is empty -}
let h = Heap(); h.add(3); h.size = 1 {- add element to heap, size is one -}
let h = Heap(); h.add(3); h.first = 3 {- add element to heap, it is the first element -}
let h = Heap(); h.add(3); h[1] = 3 {- at protocol -}
let h = Heap(); h.add(3); h.add(2); [h.size, h.first, h[2]] = [2, 2, 3] {- add elements to heap -}
let h = Heap(); { h[1] }.ifError { true } {- out of bounds -}
let h = Heap(); h.add(3); { h[2] }.ifError { true } {- out of bounds -}
let h = Heap(); h.add(5); h.add(12); h.add(1); h.first = 1 {- add out of order -}
let h = Heap(); h.addAll([5, 12, 1]); h.first = 1 {- add all out of order -}
let h = Heap(); h.add(5); h.removeFirst; h.isEmpty {- add & remove -}
let h = Heap(); h.addAll([5, 12, 1]); [h.removeFirst, h.first] = [1, 5] {- remove first -}
let h = Heap(); h.addAll([5, 12, 1]); [h.removeFirst, h.removeFirst, h.first] = [1, 5, 12] {- remove first -}
let h = Heap(); { h.removeFirst }.ifError { true } {- remove an element that does not exist -}
let h = Heap(); h.add(5); [h.removeFirst, h.size] = [5, 0] {- add & remove -}
let h = Heap(); h.addAll([1 .. 9].shuffled); h.first = 1 {- add shuffled, first is always 1 -}
let h = Heap(); h.addAll([1 .. 9].shuffled); 8.timesRepeat { h.removeFirst }; h.first = 9
let h = Heap(); h.addAll([1 .. 9].shuffled); 8.timesRepeat { h.removeAt(2) }; h.first = 1
let h = [1, 3, 5].asHeap; let a = []; h.do { :each | a.add(each) }; a = [1, 3, 5]
let h = Heap(>); h.addAll([1, 3, 5]); h.first = 5
let h = Heap(greaterThan:/2); h.addAll([1, 3, 5]); h.first = 5 {- with operator written out -}
let h = Heap { :p :q | p > q }; h.addAll([1, 3, 5]); [h.removeFirst, h.first] = [5, 3]
let h = (1 .. 4).asHeap; let c = h.copy; c.add(5); h ~= c & { c = [1 .. 5].asHeap }
```

## Identity -- literals
```
nil == nil {- nil identity -}
true == true & { false == false } {- boolean identity -}
3.141 == 3.141 & { 23 == 23 } & { 5n == 5n } {- number identity -}
'str' == 'str' {- string identity -}
(x: 1) ~~ (x: 1) {- record non-identity -}
[1] ~~ [1] {- array non-identity -}
```

## Integer -- numeric trait
```
system.includesPackage('Integer') {- integer package -}
1.isInteger = true {- integer predicate -}
123.printString = '123' {- integer print string -}
123.storeString = '123' {- integer store string -}
-987654321.printString = '-987654321' {- negative integer print string -}
4 / 2 = 2 {- integer division with integer result -}
let n = 2; 3.timesRepeat { n := n * n }; n = 256 {- iteration -}
(0 .. 15).collect(asHexDigit:/1).join = '0123456789ABCDEF' {- integer to hex character -}
let a = []; 1.upToDo(5) { :each | a.add(each) }; a = [1 .. 5] {- iterate over integer sequence -}
{ 5.upToDo(1) { :each | nil } }.ifError { true } {- non-ascending sequences are an error -}
let a = []; 5.downToDo(1) { :each | a.add(each) }; a = [5 .. 1] {- iterate over integer sequence -}
{ 1.downToDo(5) }.ifError { true } {- non-descending sequences are an error -}
let a = []; 1.toByDo(5, 1) { :each | a.add(each) }; a = [1 .. 5] {- with step -}
let a = []; 5.upOrDownToDo(1) { :each | a.add(each) }; a = [5 .. 1] {- iterate over integer sequence -}
let a = []; 1.toDo(5) { :each | a.add(each) }; a = [1 .. 5] {- toDo is upToDo if ascending -}
let a = []; 5.toDo(1) { :each | a.add(each) }; a = [] {- non-ascending sequences are empty -}
(0 .. 255).collect { :each | each.digitAt(1) } = [0 .. 255]
(0 .. 255).collect { :each | each.digitAt(2) }.allSatisfy { :each | each = 0 }
(256 .. 511).collect { :each | each.digitAt(1) } = [0 .. 255]
(256 .. 511).collect { :each | each.digitAt(2) }.allSatisfy { :each | each = 1 }
(512 .. 1023).collect { :each | each.digitAt(2) }.asBag.sortedElements = [2 -> 256, 3 -> 256]
[1, 8, 16, 24, 32n, 40n, 48n, 56n, 64n].collect { :each | (2 ^ each).digitLength } = [1 .. 9]
(2 ^ 128n - 1).digitLength = 16
123456n.fnv1aHash = 2230130162n
(1 << 30) == 1073741824 {- equal integers are identical -}
6.take(3) = 20 {- n choose k -}
6.take(3) = ((6 * 5 * 4) / (1 * 2 * 3))
3.take(6) = 0 {- if k is greater than n answer is zero -}
58909.printStringHex = 'E61D' {- hexadecimal representation -}
let a = []; 3.tuplesIndicesDo(2) { :each | a.add(each.copy) }; a = [1 1; 1 2; 1 3; 2 1; 2 2; 2 3; 3 1; 3 2; 3 3]
let a = []; 3.tuplesIndicesDo(2) { :each | a.add(each.sum) }; a = [2 3 4 3 4 5 4 5 6]
let a = []; 2.tuplesIndicesDo(3) { :each | a.add(each.sum) }; a = [3 4 4 5 4 5 5 6]
let a = []; 2.tuplesIndicesDo(4) { :each | a.add(each.sum) }; a = [4 5 5 6 5 6 6 7 5 6 6 7 6 7 7 8]
let c = 0; let k = 3; let n = 4; k.tuplesIndicesDo(n) { :each | c := c + 1 }; c = (k ^ n)
let c = 0; 4.tuplesIndicesDo(7) { :each | c := c + 1 }; c = 16384
(-2 .. 7).collect { :each | each.foldIndex(5) } = [4 3 2 1 2 3 4 5 4 3]
(-2 .. 7).collect { :each | each.wrapIndex(5) } = [3 4 5 1 2 3 4 5 1 2]
```

## Integer -- prime numbers
```
9.primesArray = [2, 3, 5, 7, 11, 13, 17, 19, 23] {- first elements of prime number sequence -}
9.nthPrime = 23 {- lookup prime by index in sequence -}
system.cache::primesArray[9] = 23 {- the primes array is cached (memoized) by the system -}
5.nthPrime = 11 {- the nth entry in the sequence of prime numbers -}
23.nthPrime = 83 {- the nth entry in the sequence of prime numbers -}
system.cache::primesArray[23] = 83 {- nthPrime extends the primesArray cache as required -}
23.primesArray = system.primesArray.first(23) {- the k primesArray is the first k elements of the cached array -}
(2 .. 20).select { :each | each.isPrime } = [2, 3, 5, 7, 11, 13, 17, 19]
(2 .. 20).reject { :each | each.isPrime } = [4, 6, 8, 9, 10, 12, 14, 15, 16, 18, 20]
60.primeFactors = [2, 2, 3, 5] {- prime factors -}
[2, 2, 3, 5].product = 60 {- product is the inverse of primeFactors -}
1.primeFactors = [] {- the prime factors of one is empty -}
60.primeFactors.product = 60 {- product of prime factors is identity -}
315.primeFactors.asSet = [3, 5, 7].asSet {- prime factors, set -}
2588.primeFactors = [2, 2, 647] {- prime factors -}
(2 .. 15).select { :each | each.primeFactors.max <= 5 } = [2, 3, 4, 5, 6, 8, 9, 10, 12, 15]
(2 .. 999).allSatisfy { :each | each = each.primeFactors.product } = true {- equality with product of factors -}
10071203840.primeFactors.asBag.sortedElements = [2 -> 13, 5 -> 1, 19 -> 1, 12941 -> 1] {- prime factor histogram -}
6606028800.primeFactors.asBag.sortedCounts = [22 -> 2, 2 -> 5, 2 -> 3, 1 -> 7]
8589298611.primeFactors = [3, 2863099537] {- large prime factors -}
120.primeFactorization = [2 -> 3, 3 -> 1, 5 -> 1]
60.primeFactorization = [2 -> 2, 3 -> 1, 5 -> 1]
36.primeFactorization = [2 -> 2, 3 -> 2]
20.factorial.primeFactorization = [2 -> 18, 3 -> 8, 5 -> 4, 7 -> 2, 11 -> 1, 13 -> 1, 17 -> 1, 19 -> 1]
2401.primeFactorization = [7 -> 4]
2434500.primeFactorization.collect(key:/1) = [2, 3, 5, 541] {- prime divisors -}
2434500.primeDivisors = [2, 3, 5, 541] {- prime divisors -}
6.factorial.primeFactorization = [2 -> 4, 3 -> 2, 5 -> 1]
324.primeFactorization = [2 -> 2, 3 -> 4] {- powerful numbers are numbers whose prime factors are all repeated -}
2401.isPrimePower {- the factorization has one place and the base is a prime number -}
(2 .. 49).select(isPrimePower:/1) = [2 3 4 5 7 8 9 11 13 16 17 19 23 25 27 29 31 32 37 41 43 47 49] {- A246655 in the OEIS -}
1.isPrimePower = false {- one is not a prime power -}
[7, 9, 64].allSatisfy(isPrimePower:/1)
[6, 12, 36].noneSatisfy(isPrimePower:/1)
(1 .. 19).select { :each | each.isAlmostPrime(1) } = [2, 3, 5, 7, 11, 13, 17, 19] {- A000040 -}
(1 .. 22).select { :each | each.isAlmostPrime(2) } = [4, 6, 9, 10, 14, 15, 21, 22] {- A001358 -}
(1 .. 449).select { :each | each.isAlmostPrime(7) } = [128, 192, 288, 320, 432, 448] {- A046308 -}
(1 .. 5121).select { :each | each.isAlmostPrime(11) } = [2048, 3072, 4608, 5120] {- A069272 -}
(10 ^ 12 + 3).primeFactorization = [61 -> 1, 14221 -> 1, 1152763 -> 1] {- moderately large number -}
(2 .. 30).select { :each | each.primeFactors.max <= 5 } = [2, 3, 4, 5, 6, 8, 9, 10, 12, 15, 16, 18, 20, 24, 25, 27, 30]
(2 .. 15).select { :each | each.primeLimit <= 5 } = [2, 3, 4, 5, 6, 8, 9, 10, 12, 15]
1.primeLimit = 0{- by convention the prime limit of one is zero -}
23.isPrime = true {- prime number predicate -}
2971215073.isPrime = true {- prime number predicate -}
2971215073.nextPrime = 2971215083 & { 2971215083.isPrime } {- find next prime -}
13.primesUpTo = [2, 3, 5, 7, 11, 13] {- primes up to limit, if limit is prime it is the last element -}
42.primesUpTo = [2, 3, 5, 7,11, 13, 17, 19, 23, 29, 31, 37, 41] {- if limit is not prime, the last element is the previous prime -}
35.isCoprime(64)
1173.isCoprime(1547).not
17.isPrime = true {- is number prime -}
17.indexOfPrime = 7 & { 18.indexOfPrime = 0 } {- index of prime number in prime number sequence, or zero if not prime -}
1.nthPrime = 2 & { 7.nthPrime = 17 } {- index into the prime number sequence -}
18.nextPrime = 19 & { 19.nextPrime = 23 } {- next integer that is greater than self and is prime number -}
19.leastPrimeGreaterThanOrEqualTo = 19 {- next prime or self if prime -}
1000.previousPrime = 997 & { 997.previousPrime = 991 } {- previous prime -}
```

## Integer -- integer names
```
[1 .. 10].collect(threeDigitName:/1) = ['one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten']
[11 .. 20].collect(threeDigitName:/1) = ['eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen', 'twenty']
[21, 25, 29].collect(threeDigitName:/1) = ['twenty-one', 'twenty-five', 'twenty-nine']
[111, 333, 999].collect(threeDigitName:/1) = ['one hundred eleven', 'three hundred thirty-three', 'nine hundred ninety-nine']
(921 * (10 ^ 12)).asWords = 'nine hundred twenty-one trillion'
504606846975.asWords = 'five hundred four billion, six hundred six million, eight hundred forty-six thousand, nine hundred seventy-five'
123456789.asWords = 'one hundred twenty-three million, four hundred fifty-six thousand, seven hundred eighty-nine'
13579.asWords = 'thirteen thousand, five hundred seventy-nine'
```

## Integer -- roman numerals
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
Interval(0, 12, 3).asArray = [0, 3, 6, 9, 12] {- elements of interval as array -}
Interval(0, 12, 3).size = 5 {- number of elements in interval -}
Interval(0, 9, -1).isEmpty {- intervals may be empty -}
2.toBy(14, 4).collect { :x | x * x } = [4, 36, 100, 196] {- toBy method at Integer -}
(2, 6 .. 14).collect { :x | x * x } = [4, 36, 100, 196] {- toBy syntax -}
Interval(-1, 1, 0.000001).size = 2000001 {- 2000001 places between -1 and 1 -}
Interval(-1, 1, 0.000001).at(1000001) = 0 {- access value at 1000001st place -}
Interval(5, 10, 1).isInterval {- create interval object -}
Interval(5, 10, 1) = 5.to(10) {- interval from 5 to 10 -}
Interval(5, 10, 2).last = 9 {- create interval object with specified increment -}
5.toBy(10, 2).last = 9 {- interval from 5 to 10 by 2 -}
(1 .. 5).isEmpty.not {- test if empty -}
(1 .. 5).size = 5 {- number of elements -}
let i = (1 .. 9); i.copy ~~ i & { i.copy = i } {- copy is equal not identical -}
(1 .. 9).includes(9) {- test if element is in collection, interval is inclusive -}
(1 .. 9).includes(11).not {- test if element is in collection -}
(1 .. 9).includesIndex(3) {- does interval include index -}
(1 .. 9).select { :item | item > 7 } = [8, 9] {- return elements that pass test -}
(1 .. 9).reject { :item | item < 7 } = [7, 8, 9] {- return elements that fail test -}
(1 .. 9).collect { :item | item + item }.last = 18 {- transform each element -}
(1 .. 9).detect { :item | item > 3 } = 4 {- detect first element that passes test -}
(9 .. 1).detect(even:/1) = 8 {- detect first element that passes test -}
{ (9, 7 .. 1).detect(even:/1) }.ifError { true } {- if no element is detected, raise error -}
{ [].detect { :item | true } }.ifError { true } {- detect at an empty collection raises an error -}
(1 .. 9).injectInto(0) { :sum :item | sum + item } = 45 {- sum elements -}
(1 .. 9).asArray = [1 .. 9] {- convert to array -}
(1 .. 9) = (1 .. 9) {- equality -}
(1 .. 9) ~= (9 .. 1) {- inequality -}
(1 .. 9) ~= [1 .. 9] {- intervals are not equal to arrays -}
10.toBy(90, 10).includes(30)
10.toBy(90, 10) = (10, 20 .. 90)
(0, 1:10 .. 1).size = 11
(0, 1:10 .. 1).last = 1
(9 .. 1).asArray = [9 .. 1]
(5 .. 1).asArray = [5 .. 1]
(5, 3 .. 1).asArray = [5, 3 .. 1]
5.toBy(1, -1).asArray = [5, 4, 3, 2, 1]
5.toBy(1, -2).asArray = [5, 3, 1]
(1.5 .. 4.5).asArray = [1.5, 2.5, 3.5, 4.5] {- non-integer start and end -}
(1 .. 9).min = 1 & { (9 .. 1).min = 1 } {- minima -}
(1 .. 9).max = 9 & { (9 .. 1).max = 9 } {- maxima -}
(1 .. 9).species = Array:/1 {- species of Interval is Array -}
1.to(9).isInterval = true {- to generates an Interval -}
to(1, 9).size = 9 {- to generates an Interval -}
(1 .. 9) = 1.to(9)
Interval(-2, 2, 1).collect(even:/1) = [true, false, true, false, true]
(-2 .. 2).collect(odd:/1) = [false, true, false, true, false]
1 + 1.to(9).collect(squared:/1) = [2, 5, 10, 17, 26,37, 50, 65, 82]
2 * (1 .. 9).collect(squared:/1) = [2, 8, 18, 32, 50,72, 98, 128, 162]
1.to(9).asArray = [1, 2, 3, 4, 5, 6, 7, 8, 9]
(1 .. 9).copyFromTo(3, 7) = (3 .. 7) {- copy from start to end indices, inclusive -}
(1 .. 16).copyFromTo(1, 8) = (1 .. 8) {- copy from start to end indices, inclusive -}
let i = 1; 1.to(9).do { :each | i := i + each }; i = 46
Interval(-1, 1, 1).printString = '(-1 .. 1)'
Interval(-1, 1, 1).storeString = 'Interval(-1, 1, 1)'
Interval(1, 9, 1) = (1 .. 9)
Interval(1, 10, 3).size = 4
Interval(1, 10, 3).asArray = [1, 4, 7, 10]
1.to(6).reversed = (6 .. 1)
1.to(6).first = 1 {- first element of interval -}
{ 1.upTo(0).first }.ifError { true } {- first element of empty interval -}
(1 .. 6).second = 2 {- second element of interval -}
to(1, 6).last = 6 {- last element of interval -}
let i = (1 .. 9); i.first = i[1] {- one-indexed -}
let i = (1 .. 9); i.last = i[9] {- one-indexed -}
(1 .. 6).sum = 21
Interval(-1, 1, 1).asArray = [-1, 0, 1]
1.to(99).asString = '(1 .. 99)'
(1 .. 99).asString = '(1 .. 99)'
downTo(1, -1).asString = 'Interval(1, -1, -1)'
1.to(99).sum = 4950
1.to(99).asArray.sum = 4950
(1 .. 9).size = 9
(1 .. 9).sum = 45
(1 .. 9999).sum = 49995000
(1 .. 9999).asArray.sum = 49995000
to(1, 9) = Interval(1, 9, 1)
to(9, 1) = Interval(9, 1, 1)
downTo(9, 1) = Interval(9, 1, -1)
1.thenTo(3, 9) = Interval(1, 9, 2)
(1 .. 9) = (1 .. 9)
[1 .. 9] = (1 .. 9).asArray {- array interval syntax -}
[9 .. 1] = (9 .. 1).asArray {- array interval syntax -}
[3 - 2 .. 7 + 2] = (3 - 2 .. 7 + 2).asArray {- array interval syntax -}
let l = []; Interval(9, 1, -1).do { :each | l.add(each) }; l = [9 .. 1]
collect(1.to(9)) { :each | each * each } = [1, 4, 9, 16, 25, 36, 49, 64, 81]
1.to(9).collect { :each | each * each } = [1, 4, 9, 16, 25, 36, 49, 64, 81]
Interval(1, 6, 2).asArray = [1, 3, 5]
Interval(1, 6, 2).last = 5
(1 .. 9).reversed.asArray = [9, 8, 7, 6, 5, 4, 3, 2, 1]
Interval(1, 6, 2).reversed.asArray = [5, 3, 1]
1.to(9).step = 1 {- get step size of interval -}
(1, 3 .. 9) = Interval(1, 9, 2)
(9, 7 .. 1) = Interval(9, 1, -2)
(3 .. 7).anyOne = 3 {- any element, chooses first -}
(3 .. 7).any(3) = [3 .. 5] {- any three elements, chooses first -}
(1 .. 9).max = 9
(1 .. 0).size = 2
3.to(5) = (3 .. 5)
1.to(0).size = 0
3.upTo(5) = (3 .. 5)
{ 1.upTo(0) }.ifError { true } {- upTo must be ascending -}
{ 0.downTo(1) }.ifError { true } {- downTo must be descending -}
0.toBy(1, -1).size = 0 {- toBy is the correct way to write a downTo that may be empty -}
5.downTo(3) = (5 .. 3)
3.upOrDownTo(5) = 5.upOrDownTo(3).reversed
let s = ''; (1, 3 .. 9).reverseDo { :x | s := s ++ x }; s = '97531' {- do from end -}
(1 .. 9) + 3 = (4 .. 12) {- plus with a number answers an Interval -}
(1 .. 9) - 2 = (-1 .. 7) {- minus with a number answers an Interval -}
3 + (1 .. 9) = [4 .. 12]
(1 .. 5) + (1, 3 .. 9) = [2, 5 .. 14]
(1 .. 5) - (9, 7 .. 1) = [-8, -5 .. 4]
(0.5, 1 .. 4.5) = Interval(0.5, 4.5, 0.5) {- non-integer (fractional) step -}
(0.5, 1 .. 4.5).size = 9 {- fractional step size -}
(1, 1 + 1:3 .. 3).size = 7 {- fractional step size -}
(1:3 .. 7:3).size = 3 {- fractional start and end, integral step size -}
(1:3, 2:3 .. 3).size = 9 {- fractional step size -}
1:3.thenTo(2:3, 3).middle = 5:3
Interval(1, 100, 1) = 1.to(100)
Interval(1, 100, 0.5).size = 199
(1, 1.5 .. 100).at(198) = 99.5
(1 / 2).toBy(54 / 7, 1 / 3).last = (15 / 2)
1:2.toBy(54:7, 1:3).last = 15:2
(1 .. 3) ++ ['4', '5'] = [1, 2, 3, '4', '5'] {- append array to interval -}
let i = (1, 3 .. 9); i.removeFirst = 1 & { i = (3, 5 .. 9) } {- remove first element -}
let i = (9, 7 .. 1); i.removeFirst = 9 & { i = (7, 5 .. 1) } {- remove first element -}
let i = (1, 3 .. 9); i.removeLast = 9 & { i = (1, 3 .. 7) } {- remove first element -}
let i = (9, 7 .. 1); i.removeLast = 1 & { i = (9, 7 .. 3) } {- remove first element -}
(1 .. 9).sorted = (1 .. 9) {- ascending intervals are sorted -}
(9 .. 1).sorted = (1 .. 9) {- reverse interval if descending -}
let n = 0; (1 .. 5).permutationsDo { :each | n := n + 1 }; n = 120 {- interval permutations -}
(1, 3 .. 17).copyFromTo(3, 6) = (5, 7 .. 11) {- copy from start index to end index -}
(17, 15 .. 1).copyFromTo(3, 6) = (13, 11 .. 7) {- copy from start index to end index -}
(1, 3 .. 17).copyFromTo(6, 3).isEmpty {- if indices are out of order the interval is empty -}
(1 .. 99).printStringConcise(8) = 'an Interval' {- consise printer -}
```

## Iterable -- collection trait
```
system.includesPackage('Iterable') {- Iterable package -}
(1 .. 9).count(odd:/1) = 5
(1 .. 9).count(even:/1) = 4
(1 .. 9).countAll = 9
```

## Iteration
```
let n = 0; 4.timesRepeat { n := n + 1 }; n = 4 {- times repeat loop (int) -}
let n = 0; -4.timesRepeat { n := nil }; n = 0 {- times repeat loop (zero or negative values are allowed) -}
let n = 0; 1.toDo(4) { :x | n := n + x }; n = 10 {- for loop (int) -}
let n = 0; 1.toDo(4) { :x | n := n + x }; n = 10 {- for loop (int) -}
let s = ''; 1.toDo(4) { :x | s := s ++ x }; s = '1234' {- for loop (int) -}
let s = ''; (1 .. 5).do { :x | s := s ++ x }; s = '12345' {- for loop (interval) -}
let s = ''; 1.toDo(5) { :x | s := s ++ x }; s = '12345' {- for loop (start & end indices) -}
let s = ''; 1.toDo(0) { :x | 'error'.error }; s = '' {- for loop (end less than start) -}
let s = ''; (1 .. 3).reverseDo { :x | s := s ++ x }; s = '321' {- for loop (interval, reversed) -}
let s = ''; [1, 3, 5].do { :x | s := s ++ x }; s = '135' {- for loop (collection) -}
let n = 9; { n > 3 }.whileTrue { n := n - 1 }; n = 3 {- while true loop -}
let n = 9; { n < 7 }.whileFalse { n := n - 1 }; n = 6 {- while false loop -}
10.timesRepeat { nil } = 10 {- timesRepeat answers the receiver) -}
1.toDo(10) { :unused | nil } = 1 {- toDo answers the receiver -}
let a = []; (1 .. 9).rejectThenDo(even:/1) { :each | a.add(each * 3) }; a = [3, 9, 15, 21, 27] {- avoid intermediate collection -}
let a = []; (1 .. 9).selectThenDo(even:/1) { :each | a.add(each * 3) }; a = [6, 12, 18, 24] {- avoid intermediate collection -}
```

## LargeInteger -- numeric type
```
system.includesPackage('LargeInteger') {- LargeInteger package -}
23n.typeOf = 'LargeInteger' {- syntax for large integer literals -}
(2 ^ 54).asLargeInteger.squared.printString = '324518553658426726783156020576256'
(2 ^ 37).asLargeInteger.squared.storeString = '18889465931478580854784n'
'324518553658426726783156020576256'.parseLargeInteger.isLargeInteger = true
2971215073.asLargeInteger.isPrime = true
23n.factorial = 25852016738884976640000n {- factorial of LargeInteger -}
100n.factorial = 93326215443944152681699238856266700490715968264381621468592963895217599993229915608941463976156518286253697920827223758251185210916864000000000000000000000000n {- factorial of LargeInteger -}
170n.factorial = 7257415615307998967396728211129263114716991681296451376543577798900561843401706157852350749242617459511490991237838520776666022565442753025328900773207510902400430280058295603966612599658257104398558294257568966313439612262571094946806711205568880457193340212661452800000000000000000000000000000000000000000n {- factorial of LargeInteger -}
[-1n, 0n, 1n].collect(sign:/1) = [-1n, 0n, 1n]
6n / 8n = Fraction(3n, 4n)
2 / 3n = Fraction(2n, 3n)
4n / 2n = 2n {- reduced -}
let x = (2n ^ 54n); x ~= (x - 1) {- large integers behave ordinarily -}
5n % 3n = 2n {- modulo -}
[10n % 5n, -4n % 3n, 4n % -3n, -4n % -3n] = [0n, 2n, -2n, -1n] {- modulo, negative operands -}
13n % 7n % 4n = 2n {- left assocative -}
13n + 1n % 7n = 0n {- equal precedence -}
(2n ^ 170 - 1).isPowerOfTwo = false {- LargeInteger power of two test -}
324518553658426726783156020576256n.even = true {- is large integer even -}
324518553658426726783156020576257n.odd = true {- is large integer odd -}
100n.factorial / 99n.factorial = 100n {- large integer factorial, c.f. small float -}
1000n.factorial / 999n.factorial = 1000n {- large integer factorial -}
8589298611n.primeFactors.last = 2863099537n
5n == 5n {- large integer identity -}
(1n << 100n) == 1267650600228229401496703205376n {- equal large integers are identical -}
92233720368n * 100000000n + 54775807n = 9223372036854775807n {- reader for large integer literals -}
2n ^ 100n = 1267650600228229401496703205376n {- raised to -}
let n = 2n; n.copy == n {- copy is identity -}
23n.asSmallFloat = 23 {- large integer to small float -}
let a = [9 .. 1]; { a[5n] }.ifError { true } {- large integers are not valid indices -}
58909n.printStringHex = 'E61D' {- hexadecimal representation -}
20n.factorial = 2432902008176640000n {- large integer factorial -}
7n << 23 = 58720256n {- left shift large integer -}
7n << 71 = 16528282690043758247936n {- left shift large integer -}
16n >> 3 = 2n {- right shift large integer -}
4n // 2n = 2n {- quotient -}
4n.quotient(2n) = 2n {- quotient -}
```

## Length -- geometry type
```
system.includesPackage('Length') {- Length package -}
1.metres.typeOf = 'Length' {- metre constructor, type of -}
1.metres.isLength {- length predicate -}
10.centimetres.printString = '0.1.metres'
12.inches ~ 1.feet {- there are approximately twelve inches in a foot -}
1.yards.feet = 3 {- there are three feet in a yard -}
1.miles = 5280.feet {- lengths can be tested for equality -}
1.nauticalMiles = 1852.metres {- a nautical mile is defined in terms of metres -}
1.astronomicalUnits.kilometres.rounded = 149597871 {- 149,597,871 -}
1.astronomicalUnits.miles.rounded = 92955807 {- 92,955,807 -}
1.lightYears.kilometres.rounded = 9460700000000 {- 9,460,700,000,000 -}
1.lightYears.astronomicalUnits.rounded = 63241 {- 63,241 -}
1.parsecs.lightYears ~ 3.2615
1.parsecs.astronomicalUnits.rounded = 206266
1.picometres.picometres = 1
12.point = 4.2336.millimetres {- a point is approximately four millimetres -}
12.point.inches ~ (12 / 72) {- a point is approximately 1/72 of an inch -}
12.point ~ 1.picas {- twelve point is approximately a pica -}
10.centimetres.asMetres = 0.1.asMetres {- metres of length, or identity of number -}
```

## LinkedList -- collection type
```
system.includesPackage('LinkedList') {- LinkedList package -}
LinkedList().typeOf = 'LinkedList' {- type of linked list -}
LinkedList().isLinkedList = true {- type predicate for linked list -}
LinkedList().size = 0 {- empty linked list -}
LinkedList().isEmpty {- empty linked list -}
LinkedList:/0.ofSize(3).size = 3 {- linked list of three nil values -}
[1, 2, 3].asLinkedList.size = 3 {- linked list from array -}
let l = LinkedList(); l.addFirst(1); l.addFirst(2); l.asArray = [2, 1] {- add to start -}
let l = LinkedList(); l.addLast(1); l.addLast(2); l.asArray = [1, 2] {- add to end -}
let l = LinkedList(); 1.toDo(5) { :each | l.add(each) }; l.asArray = [1 .. 5] {- add to end -}
(1 .. 9).asLinkedList.collect { :each | 10 - each } = [9 .. 1].asLinkedList {- collect -}
let l = [1 .. 9].asLinkedList; l.removeFirst; l.first = 2 {- remove first -}
let l = [1 .. 9].asLinkedList; l.removeLast; l.last = 8 {- remove last -}
let l = [1].asLinkedList; l.removeFirst = 1 & { l.isEmpty } {- remove first -}
let l = [1].asLinkedList; l.removeLast = 1 & { l.isEmpty } {- remove last -}
let l = [1 .. 5].asLinkedList; l.removeAllSuchThat(odd:/1); l.asArray = [2, 4] {- in place reject -}
let l = (1 .. 99).asLinkedList; l.removeAll; l.isEmpty {- remove all -}
(1 .. 99).asLinkedList.select(even:/1).asArray = [2, 4 .. 98] {- select -}
(1 .. 9).asLinkedList.selectThenCollect(even:/1, squared:/1).asArray = [4, 16, 36, 64] {- avoid intermediate collection -}
(1 .. 9).asLinkedList.collectThenSelect(squared:/1) { :each | each > 36 }.asArray = [49, 64, 81] {- avoid intermediate collection -}
(1 .. 9).asLinkedList.reversed = [9 .. 1] {- reversed, species is Array -}
{ LinkedList().removeFirst }.ifError { :error | true } {- remove first, error if empty -}
{ LinkedList().removeLast }.ifError { :error | true } {- remove last, error if empty -}
let l = (1 .. 5).asLinkedList; l[3] = 3 {- index into -}
let l = (1 .. 5).asLinkedList; l[1] := -1; l.asArray = [-1, 2, 3, 4, 5] {- mutate at index -}
let l = (1 .. 5).asLinkedList; l[3] := -3; l.asArray = [1, 2, -3, 4, 5] {- mutate at index -}
(1 .. 9).asLinkedList.firstLink.value = 1 {- first link -}
(1 .. 9).asLinkedList.firstLink.nextLink.value = 2 {- second link -}
(1 .. 9).asLinkedList.lastLink.value = 9 {- last link -}
let l = (1 .. 3).asLinkedList; l.firstLink.value := -1; l.asArray = [-1, 2, 3] {- mutate link value -}
(1 .. 9).asLinkedList.isSorted = true {- are elements in sequence -}
(9 .. 1).asLinkedList.isSortedBy(>) = true {- are elements in sequence by predicate -}
(9 .. 1).asLinkedList.isSortedBy(greaterThan:/2) = true {- with operator written out -}
[1, 3 .. 9].asLinkedList.indices = (1 .. 5) {- indices of linked list (an interval) -}
let l = (1 .. 9).asLinkedList; l.copy = l & { l.copy ~~ l } {- copy is equal but not identical -}
let l = (1 .. 9).asLinkedList; let c = l.copy; c[1] := 9; c[1] = 9 & { l[1] = 1 } {- copies are distinct -}
```

## Magnitude -- numeric trait
```
system.includesPackage('Magnitude') {- magnitude package -}
1 < 3 = true {- less than -}
1.lessThan(3) = true
2 < 2 = false
3 < 1 = false
1 <= 3 = true {- less than or equal to, unicode = ≤ -}
2 <= 2 = true
3 <= 1 = false
3 > 1 = true {- greater than -}
2 > 2 = false
1 > 3 = false
3 >= 1 = true {- greater than or equal to -}
2 >= 2 = true
1 >= 3 = false
2 = 2 = true {- equal to -}
[0, 4].collect { :i | [2, 3, 5].at(i.clamp(1, 3)) } = [2, 5] {- clamp index to valid range -}
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
system.includesPackage('Map') {- Map package -}
let r = Map(); r.add('x' -> 1); r.size = 1 {- add Association to Dictionary -}
let d = Map(); d.add('x' -> 1); d.add('y' -> 2); d.size = 2 {- add two Associations to Dictionary -}
let d = ['x' -> 1, 'y' -> 2].asMap; d.indices = ['x', 'y'] {- answer Array of indices (keys) at Dictionary -}
let d = ['x' -> 1, 'y' -> 2].asMap; d.values = [1, 2] {- answer Array of values at Dictionary -}
let d = ['x' -> 1, 'y' -> 2].asMap; d.at('x') = 1 {- answer value at key in Dictionary -}
let d = ['x' -> 1, 'y' -> 2].asMap; d['x'] = 1 {- at (subscript) syntax -}
let d = Map(); d.add('x' -> 1); d.removeKey('x'); d.isEmpty = true {- remove Association from Dictionary given key -}
let d = Map(); (d['x'] := 1) = 1 & { d['x'] = 1 } {- atPut (subscript mutation) syntax -}
let d = Map(); d[1] := 'x'; d[1] = 'x'
let d = Map(); d['x'] := 1; d.removeKey('x'); d.isEmpty = true
let d = (f: { :i | i * i }); d::f.value(9) = 81
{ Map().removeKey('unknownKey') }.ifError { true }
(x: 1, y: 1).copyWithoutDuplicates = (x: 1)
let d = Map(); 1.toDo(100) { :i | d[i] := i; (i > 10).ifTrue { d.removeKey(i - 10) } }; d.size = 10
let c = Map(); c[2] := 'two'; c[1] := 'one'; c.removeKey(2); c[1] := 'one'; c.removeKey(1); c.includesIndex(1) = false
(x: 1, y: 2).asMap.includesIndex('x') {- Record to Map, map includes key predicate -}
(x: 1, y: 2).asMap ++ (x: 2, y: 1) = (x: 2, y: 1).asMap {- appending a record to a Map answers a Map, biases right -}
(x: 1, y: 2, z: 3).asMap ++ (x: 2, y: 1) = (x: 2, y: 1, z: 3).asMap {- append record to Map -}
(x: 1, y: 2).asMap ++ (x: 2, y: 1, z: 3) = (x: 2, y: 1, z: 3).asMap {- append record to Map -}
(x: 1, y: 2).asMap.json = '{"x":1,"y":2}' {- maps with string keys are encoded as records -}
(x: 1, y: 2, z: 3).asMap.indices = ['x', 'y', 'z'] {- indices of map (an array) -}
let m = (x: 1, y: 2).asMap; m.removeAssociation('x' -> 1); m = (y: 2).asMap {- remove association -}
let m = (x: 1, y: 2).asMap; m.removeAll; m.isEmpty {- remove all entries -}
(x: 1, y: 2).asMap = (x: 1, y: 2).asMap {- key sequence and equality -}
(x: 1, y: 2).asMap ~= (y: 2, x: 1).asMap {- key sequence and equality -}
```

## Math
```
-3.abs = 3 {- absolute value -}
1.5.ceiling = 2 {- ceiling (round up) -}
0.cos = 1 {- cosine -}
180.degreesToRadians = 1.pi {- degreesToRadians -}
2.even = true {- eveness predicate -}
1.exp.veryCloseTo(2.718281828459045) {- base e exponent function -}
1.5.floor = 1 {- floor (round down) -}
1.exp.log = 1 {- base e (natural) logarithm -}
1.2.isNumber = true {- is x a number -}
0.isInteger = true {- is x an integer -}
3.positive = true {- is x > 0 -}
1.max(2) = 2 {- maximum -}
1.min(2) = 1 {- minimum -}
3.negated = -3 {- negation -}
3.odd = true {- oddness predicate -}
1.pi.veryCloseTo(3.1415926535898) {- constant pi (Float pi) -}
inf.isNumber {- constant positive infinity (is a number) -}
2 ^ 3 = 8 {- i to the power of j -}
5.reciprocal = 0.2 {- 1 / x -}
(1.pi / 2).sin = 1 {- sine -}
9.sqrt = 3 {- square root -}
3.squared = 9 {- x * x -}
1.pi.radiansToDegrees = 180 {- radiansToDegrees -}
{ 1 / nil }.ifError { true } {- operand not apatable to number -}
0.9.rounded = 1
1.rounded = 1
1.1.rounded = 1
-1.9.rounded = -2
-2.rounded = -2
-2.1.rounded = -2
1.5.rounded = 2 {- in case of tie, round to +infinity -}
-1.5.rounded = -1
let n = 10 ^ 6; n ~ (n + 1) & { 1 !~ 2 } {- a million is close to a million and one, but one is not close to two -}
```

## Matrix22 -- geometry type
```
system.includesPackage('Matrix22') {- two by two matrix package -}
Matrix22(1, 0, 0, 1).typeOf = 'Matrix22' {- two square matrix type -}
Matrix22(1, 0, 0, 1).isMatrix22 {- matrix predicate -}
Matrix22(1, 4, -1, 9).determinant = 13 {- determinant -}
Matrix22(-1, 3/2, 1,-1).inverse = Matrix22(2, 3, 2, 2) {- inverse, answers new matrix -}
let m = Matrix22(-1, 3/2, 1,-1); m.invert; m = Matrix22(2, 3, 2, 2) {- inverse, in place -}
Matrix22().rotation(1.pi / 2).applyTo(RectangularCoordinate(0, 1)).closeTo(1 @ 0)
Matrix22(1, 2, 3, 4).transposed = Matrix22(1, 3, 2, 4) {- transpose, answers new matrix -}
let m = Matrix22(1, 2, 3, 4); m.transpose; m = Matrix22(1, 3, 2, 4) {- transpose, in place -}
```

## Matrix33 -- geometry type
```
system.includesPackage('Matrix33')
Matrix33(1, 1, 1, 1, 0, 0, 0, 1, 0).inverse = Matrix33(0, 1, 0, 0, 0, 1, 1, -1, -1)
```

## Method
```
system.includesPackage('Method') {- method package -}
{ true + false }.ifError { true } {- boolean does not implement + -}
let f = { :x :y | x + y }; { f(true, false) }.ifError { true } {- boolean does not implement + -}
```

## Nil -- kernel type
```
system.includesPackage('Nil') {- package -}
nil.typeOf = 'Nil' {- type of nil is Nil -}
nil.isNil = true {- is nil predicate -}
nil = nil {- nil equality -}
nil == nil {- nil identity -}
nil.ifNil { true } = true {- nil conditional -}
nil.ifNil { true } { false } = true {- nil conditional -}
nil.ifNotNil { true } = nil {- nil conditional -}
false.ifNotNil { true } {- nil conditional -}
0.ifNil { false } = 0 {- nil conditional, answer receiver if not nil -}
0.ifNil { false } { true } {- nil conditional -}
ifNil(nil) { true } = true {- nil conditional -}
ifNil(0) { false } = 0 {- nil conditional -}
nil.printString = 'nil' {- nil print string -}
nil.storeString = 'nil' {- nil store string -}
nil.json = 'null' {- nil has a Json representation -}
'null'.parseJson = nil {- nil has a Json representation -}
let c = nil; c ? { 'red' } = 'red' {- nil-coalescing operator, if lhs is nil evaluate rhs -}
let c = 'blue'; c ? { 'red' } = 'blue' {- nil-coalescing operator -}
let c = nil; c ?? 'red' = 'red' {- evaluating nil-coalescing operator, if lhs is nil answer rhs -}
let c = 'blue'; c ?? 'red' = 'blue' {- nil-coalescing operator -}
nil ? { 'notNil' } = 'notNil' {- right hand side if left hand side is nil -}
'notNil' ? { nil } = 'notNil' {- left hand side unless nil -}
nil ~? { 1 } = nil {- left hand side if nil, else right hand side -}
1 ~? { 2 } = 2 {- right hand side if left hand side is not nil -}
```

## Number -- numeric trait
```
system.includesPackage('Number') {- package -}
1 + 2.5 = 3.5 {- addition of two numbers -}
10 - 8.5 = 1.5 {- subtraction of two numbers -}
3.4 * 5 = 17 {- multiplication of two numbers -}
8 / 2 = 4 {- division of two numbers -}
2 ^ 3 = 8 {- exponentiation of a number -}
12 = 11 = false {- equality between two numbers -}
12 ~= 11 = true {- test if two numbers are different -}
12 > 9 = true {- greater than -}
12 >= 10 = true {- greater or equal than -}
12 < 10 = false {- smaller than -}
2.718.truncated = 2 {- truncate to integer -}
2.718.rounded = 3 {- round to integer -}
2.718.roundTo(0.01) = 2.72 {- round to a given precision -}
123456789.asStringWithCommas = '123,456,789'
123456.789.asStringWithCommas = '123,456.789'
13579.asStringWithCommas = '13,579'
159.asStringWithCommas = '159'
-9876543210.asStringWithCommas = '-9,876,543,210'
-987654.321.asStringWithCommas = '-987,654.321'
-97.531.asStringWithCommas = '-97.531'
-951.asStringWithCommas = '-951'
let i = 1; 1.toDo(5) { :each | i := i + each.squared }; i = 56 {- iterate over numbers from start to end -}
let i = 1; 1.toByDo(5, 2) { :each | i := i + each.squared }; i = 36 {- iterate over numbers from start to end by step -}
let i = 1; (1 .. 3).do { :each | i := i + each.squared }; i = 15 {- iterate over numbers from one to end -}
{ 23.size }.ifError { true } {- numbers do not have a size -}
{ 23.at(1) }.ifError { true } {- numbers are not indexable -}
{ 23.do { :each | nil } }.ifError { true } {- numbers are not iterable -}
-23.absSquared = 23.absSquared {- see Complex -}
```

## Object -- kernel trait
```
system.includesPackage('Object') {- package -}
[1, 3, 5].typeOf = 'Array' {- name of type of object -}
[1, 3, 5].species = Array:/1
[1, 3, 5].asSet.species = Set:/0
[1, 3, 5].asBag.species = Bag:/0
(x: 1, y: 3, z: 5).species = Record:/0
'b'.caseOf(['a' -> 1, 'b' -> 2, 'c' -> 3]) = 2
{ 'd'.caseOf(['a' -> 1, 'b' -> 2, 'c' -> 3]) }.ifError { true }
'b'.caseOfOtherwise(['a' -> 1, 'b' -> 2, 'c' -> 3]) { :notFound | false } = 2
'd'.caseOfOtherwise(['a' -> 1, 'b' -> 2, 'c' -> 3]) { :notFound | notFound = 'd' }
let z = [{ 'a' } -> { 1 + 1 }, { 'b' } -> { 2 + 2 }, { 'c' } -> { 3 + 3 } ]; 'b'.caseOf(z) = 4
{ let z = [{ 'a' } -> { 1 + 1 }, { 'b' } -> { 2 + 2 } ]; 'c'.caseOf(z) }.ifError { true }
3:2.perform('numerator') = 3 {- perform named unary method, name is not qualified -}
(3 -> 2).perform('key') = 3
3.perform('plus', 4) = 7 {- perform named binary method, name is not qualified -}
4:3.slotNameArray = ['numerator', 'denominator']
4:3.slotArray = ['numerator' -> 4, 'denominator' -> 3]
4:3.numerator = 4:3.slotRead('numerator') {- slot read -}
let n = 4:3; n.slotWrite('denominator', 5); n = 4:5 {- slot write -}
1.pi.in { :x | x.rounded + 20 } = 23 {- evaluate block with object -}
1.pi.notify('pi') = 1.pi {- user notification -}
1.pi.warning('pi') = 1.pi {- user warning -}
{ 1.pi.error('pi') }.ifError { true } {- user error -}
```

## Operator -- adverbs
```
[1 2 3] +.e [4 5 6] = [5 7 9] {- e = equal, operands must be of equal size -}
[1 2 3] +.s [4 5 6 7] = [5 7 9] {- s = small, right operand is truncated -}
[1 2 3] *.s [4 5 6 7] = [4 10 18] {- s = small -}
[1 2 3] +.w [4 5 6 7] = [5 7 9 8] {- w = wrap, left operand indexed using atWrap -}
[1 2 3] +.f [4 5 6 7] = [5 7 9 9] {- f = fold, left operand indexed using atFold -}
[1 2 3 4] +.s [5 6 7] = [6 8 10] {- s = small, left operand is truncated -}
[1 2 3 4] +.w [5 6 7] = [6 8 10 9] {- w = wrap, right operand indexed using atWrap -}
[1 2 3 4] +.f [5 6 7] = [6 8 10 10] {- f = fold, right operands indexed using atFold -}
[1 2 3] +.t [4 5 6] = [5 6 7; 6 7 8; 7 8 9] {- t = table -}
[1 2 3] +.x [4 5 6] = [5 6 7 6 7 8 7 8 9] {- x = cross -}
[1 .. 5] +.s [6 .. 9] = [7 9 11 13] {- s = small -}
[1 .. 5] +.f [6 .. 8] = [7 9 11 11 11] {- f = fold -}
[1 2 3 4] *.x [5 6 7] = [5 6 7 10 12 14 15 18 21 20 24 28] {- x = cross -}
{ [1 2 3] +.e [4 5] }.ifError { true } {- e = equal, error if non-equal operand sizes -}
```

## Ordered -- collection trait
```
system.includesPackage('Ordered') {- package -}
let a = [1, 2, 4]; a.addBefore(3, 4); a = [1 .. 4] {- insert value before existing value -}
let a = [1, 2, 4]; a.addAfter(3, 2); a = [1 .. 4] {- insert value after existing value -}
let a = ['w', 'x', 'z']; a.addAfterIndex('y', 2); a = ['w', 'x', 'y', 'z'] {- insert value after index -}
let a = [2, 3]; a.addFirst(1) = 1 & { a = [1, 2, 3] } {- insert value at start -}
let a = [4, 5]; a.addAllFirst([1 .. 3]); a = [1 .. 5] {- add sequence at start -}
let a = [1, 2]; a.addLast(3) = 3 & { a = [1, 2, 3] } {- insert value at end -}
let a = [1, 2]; a.addAllLast([3 .. 5]); a = [1 .. 5] {- add sequence at end -}
let a = [1 .. 5]; a.removeAt(3); a = [1, 2, 4, 5] {- remove element at index -}
let a = [1 .. 5]; a.removeFirst; a = [2 .. 5] {- remove first element -}
let a = [1 .. 5]; a.removeLast; a = [1 .. 4] {- remove last element -}
```

## Package
```
system.includesPackage('Package') {- package -}
system.packageDictionary::Date.typeOf = 'Package' {- type of package -}
system.packageDictionary::Date.isPackage {- package type predicate -}
Package('Category', 'Name', ['Requires'], 'Category/Name.sl', 'Code').isPackage
(Name: 'Set').Package.isPackage {- package from dictionary, name is the only required field, package predicate -}
(Category: 'Time', Name: 'Date').Package.url = 'Time/Date.sl' {- derive url -}
system.packageDictionary::Date.name = 'Date' {- name of package -}
system.packageDictionary::Date.category = 'Time' {- category of package -}
system.includesPackage('Date')
'{- Package: Collection-ByteArray -}'.parsePackageHeader = (Category: 'Collection', Name: 'ByteArray')
'{- Requires: ColumnBrowser SmallKansas -}'.parsePackageHeader = (Requires: ['ColumnBrowser', 'SmallKansas'])
system.indexedPackages.size - system.loadedPackages.size = system.availablePackages.size
system.packageDictionary.select { :each | each.requires.notEmpty }.size > 10
system.packageDictionary::PackageBrowser.dependencies.collect(name:/1).includesAllOf(['Event' 'SmallKansas' 'Window' 'ColumnBrowser'])
'Time-Date'.isQualifiedPackageName
'Time-Date'.parseQualifiedPackageName = ['Time', 'Date']
system.packageDictionary.size > 100 {- number of packages -}
system.package('Array').isPackage {- lookup package by unqualified name -}
system.package('Collection-Array') == system.package('Array') {- lookup package by qualified name -}
{ system.package('Kernel-Array') }.ifError { true } {- for qualified names the system checks the category -}
system.package('BounceBenchmark').dependencies.collect(name:/1) = ['Benchmark', 'SomRandom']
```

## PriorityQueue -- collection type
```
system.includesPackage('PriorityQueue') {- PriorityQueue package -}
PriorityQueue().isPriorityQueue = true
PriorityQueue().isEmpty = true
let p = PriorityQueue(); p.pushWithPriority('a', 1); p.pop = 'a'
let p = PriorityQueue(); p.pushWithPriority('a', 1); p.pushWithPriority('b', 0); p.pop = 'b'
let p = PriorityQueue(); p.pushAllWithPriority(['a' -> 3, 'b' -> 2, 'c' -> 1]); p.size = 3 & { p.pop = 'c' }
let p = PriorityQueue(); p.peekPriority = nil
```

## Block -- behaviour type
```
system.includesPackage('Block') {- package -}
{ }.typeOf = 'Block'
typeOf:/1.typeOf = 'Block'
let i = 1; { i < 5 }.whileTrue { i := i + 1 }; i = 5 {- mutate outer temporary -}
let i = 1; whileTrue { i < 5 } { i := i + 1 }; i = 5 {- trailing closure syntax -}
{ }.numArgs = 0 {- block arity -}
{ :x | x }.numArgs = 1
{ :i :j | i }.numArgs = 2
{ :i :j :k | i }.numArgs = 3
{ :i :j :k :l | i }.numArgs = 4
collect:/2.numArgs = 2 {- method arity -}
{ { :i | i = nil }.value }.ifError { true } {- too few arguments, c.f. non-strict -}
{ { :x | 0 - x }.value(3, 4) = -3 }.ifError { true } {- too many arguments, c.f. non-strict -}
collect:/2.name = 'collect:/2'
let f = { :x | x * x }; [f(5), f:/1.(5)] = [25, 25]
let f = { :x | x * x }; let d = (p: f:/1); d::p.value(5) = 25
{ 0 }.cull(23) = 0 {- ignore one argument -}
{ 0 }.cull(23, 3.141) = 0 {- ignore two arguments -}
{ :x | x }.cull(23) = 23 {- recognise one argument -}
{ :x | x }.cull(23, 3.141) = 23 {- recognise one argument, ignore one argument -}
{ :x :y | x * y }.cull(23, 3.141) = 72.243 {- recognise two arguments -}
let f = { :x | x * x }; f(3) = 9
{ let f = { :x | x * x }; [3, 5, 7].collect(f) = [9, 25, 49] }.ifError { true } {- f not bound -}
let f = { :x | x * x }; [3, 5, 7].collect(f:/1) = [9, 25, 49]
{ :x | x * x }.map([3, 5, 7]) = [9, 25, 49] {- map is flipped collect -}
{ :x :y | x * y + y }.apply([3.141, 23]) = 95.243
{ { :x | x }.apply(0) }.ifError { true }
{ { :x | x }.apply([]) }.ifError { true }
9.with { :x | x.sqrt; x.negated } = -9 {- evaluate block with self and answer answer of block -}
9.also { :x | x.sqrt; x.negated } = 9 {- evaluate block with self and answer self -}
let d = (c: 1); d.with { :x | x::c := 2; 0 } = 0 & { d = (c: 2) }
let d = (c: 1); d.also { :x | x::c := 2; 0 } == d & { d = (c: 2) }
let d = (c: 1); let r = d.with { :x | x::c := 2; 0 }; d = (c: 2) & { r = 0 }
let d = (c: 1); let r = d.also { :x | x::c := 2; 0 }; d = (c: 2) & { r == d }
let x = { }; x:/0.isBlock {- blocks are objects and may be assigned to a variable -}
{ nil; 1 }.value = 1 {- value is last expression evaluated -}
{ { 1 }.value }.value = 1 {- blocks may be nested -}
{ :x | let y = x; y }.value(1) = 1 {- specification { arguments localvars expressions } -}
{ 'x' }.value = 'x' {- simple block usage -}
{ :p1 :p2| p1 ++ ' & ' ++ p2 }.value('x', 'y') = 'x & y' {- block with argument passing -}
{ :x | x + 1 }.numArgs = 1 {- the number of arguments can be retrieved -}
{ :x | x := nil }.value(42).isNil {- arguments are mutable -}
let f = { :x :y | x := y; x }; f(1, 3) = 3 {- arguments are mutable -}
{ } ~= { } {- inequality -}
({ } = { }).not {- inequality -}
{ 1 } ~= { 1 } {- inequality -}
{ 1 } ~= 1 {- inequality -}
{ } ~~ { } {- non-identity -}
let f = { }; f:/0 == f:/0 {- identity -}
{ }.printString = 'a Block'
{ :x | x }.printString = 'a Block'
{ }.typeOf = 'Block'
{ }.value = nil {- empty block evaluates to nil -}
{ | x | }.value = nil {- empty block with unused temporary evaluates to nil -}
{ let x = 1; }.value = nil {- empty block with unused initialised temporary evaluates to nil -}
{ | c a | c := [1]; a := { | a | a := 4; a }.value; { | a | a := 2; c.add(a); { | a | a := 3; c.add(a) }.value }.value; c.add(a); c }.value = [1, 2, 3, 4]
1.toDo(10) { :index | nil } = 1 {- answers start index -}
valueWithReturn { :return:/1 | 1.toDo(10) { :index | (index = 5).ifTrue { 5.return } } } = 5 {- non-local return -}
1.pi.assert { true } = 1.pi {- assert that block evaluates to true, answers self -}
{ 1.pi.assert { false } }.ifError { true } {- raise an error if block does not evaluate to true -}
{ true }.assert = nil {- assert that block evaluates to true, answers nil -}
{ { false }.assert }.ifError { true } {- raise an error if block does not evaluate to true -}
valueWithReturn { :return:/1 | { (9.atRandom > 7).ifTrue { true.return } }.repeat } {- repeat a block until it "returns" -}
{ 1.anUnknownMessage }.ifError { :err | err }.isError = true {- evaluate error block on error -}
{ 1.anUnknownMessage }.ifError { true } = true {- error block is culled (i.e. may elide error argument) -}
let f = { let x = 0; { x := x + 1; x } }; let g = f:/0.value; [g.value, g.value] = [1, 2] {- closure -}
let f = { let x = 0; { x := x + 1; x } }; [f:/0.value.value, f:/0.value.value] = [1, 1] {- closures -}
let f = { :n | (n = 1).if { 1 } { f(n - 1) * n } }; (7 .. 9).collect(f:/1) = [5040, 40320, 362880]
let f = { system.nextRandomFloat }; f:/0.once = f:/0.once {- evaluate block once and cache result -}
let f = { (1 .. 9).atRandom }; f:/0.once = f:/0.once & { f:/0.once = f:/0.once } {- the cache is kept in a weak map -}
'3'.replicate(3) = ['3', '3', '3'] {- answer an array of n places each having the same value -}
'3'.replicate(3) = Array(3, '3') {- constructor with fill value -}
let m = { system.nextRandomFloat }.duplicate(9).mean; m > 0 & { m < 1 }
{ 1 }.duplicate = [1, 1] {- evaluate a block twice and collect the answers in an array -}
{ '3' }.duplicate(3) = ['3', '3', '3'] {- evaluate block indicated number of times and collect answers in an array -}
{ 9.atRandom }.duplicate(9).allSatisfy(isInteger:/1) {- evaluate a block n times and collect answers in an array -}
{ '3' } ! 3 = ['3', '3', '3'] {- operator form of duplicate -}
({ system.nextRandomFloat } ! 9).size = 9 {- the size of the answer is as requested -}
({ system.nextRandomFloat } ! 3).allSatisfy(isNumber:/1) = true
at:/2.parameterNames = ['self', 'index']
json:/3.parameterNames = ['self', 'replacer', 'space']
randomFloat:/2.parameterNames = ['self', 'aNumber']
system.methodDictionary::at[2]::Map.information.parameterNames = ['self', 'key']
let c = []; let a = []; (1 .. 3).do { :i | c.add { a.add(i) } }; c.do(value:/1); a = [1, 2, 3]
let x = [1]; let f = { :n | x[1] := n }; f(3); x = [3] {- closure -}
{ { }.deepCopy }.ifError { true } {- blocks cannot be deep copied -}
let f = -.flip; f.value(3, 1) = -2 {- flip of two argument block -}
```

## BlockStream
```
system.includesPackage('BlockStream') {- package -}
let n = 1; let s = BlockStream { let r = n; n := n + 1; r } { }; s.next(9) = [1 .. 9]
(1 .. 9).asStream.collect(squared:/1).upToEnd = [1 4 9 16 25 36 49 64 81]
(1 .. 9).asStream.select(even:/1).upToEnd = [2 4 6 8]
(1 .. 9).asStream.reject(even:/1).upToEnd = [1 3 5 7 9]
(1 .. inf).asStream.select(even:/1).next(4) = [2 4 6 8]
(1 .. inf).asStream.reject(even:/1).next(5) = [1 3 5 7 9]
```

## Promise -- scheduling type
```
system.includesPackage('Promise') {- package -}
{ Promise() }.ifError { true } {- there is no void contructor -}
Error('f').Promise.catch { :err | (err.messageText = 'f').postLine }; true {- construct a rejected promise -}
1.resolvedPromise.then { :n | (n = 1).postLine }; true {- construct a resolved promise -}
let p = Promise { :t:/1 :f | t('t') }; p.then { :t | (t = 't').postLine }; p.isPromise
let p = Promise { :t :f:/1 | f('f') }; p.thenElse { :t | t.postLine } { :f | (f = 'f').postLine }; p.isPromise
let p = Promise { :t :f:/1 | f('f') }; p.then { :t | t.postLine }.catch { :f | (f = 'f').postLine }; p.isPromise
let p = Promise { :t :f:/1 | f('f') }; p.thenElse { :t | t.postLine } { :f | (f = 'f').postLine }.finally { 'true'.postLine }; p.isPromise
let f = { :c | Promise { :t:/1 :f | { t(c) }.valueAfter(0.15.randomFloat) } }; [1.f, 2.f, 3.f].anyResolved.then { :t | [1, 2, 3].includes(t).postLine }; true
let f = { :c | Promise { :t:/1 :f | { t(c) }.valueAfter(0.05.randomFloat) } }; ['x'.f, 'y'.f, 'z'.f].allResolved.then { :t | (t = ['x', 'y', 'z']).postLine }; true
```

## Pseudo variables
```
false.isBoolean {- constant -}
false.isBoolean {- constant -}
nil.isNil {- constant -}
1.pi.isNumber {- constant -}
inf.isNumber {- constant (infinity) -}
```

## Random -- trait and system random number generator
```
system.includesPackage('Random') {- package -}
let r = Random(); r.isStream = true
let r = Random(); randomInteger(1, 9).isInteger {- random integer between 1 and 9 inclusive -}
9.randomInteger.isInteger {- random integers (1 to self) -}
let s = Set(); 729.timesRepeat { s.include(9.randomInteger) }; s.minMax = [1, 9] {- check distribution -}
let s = Set(); 729.timesRepeat { s.include(9.randomInteger) }; s = (1 .. 9).asSet {- check distribution -}
let s = Set(); 729.timesRepeat { s.include(3.randomIntegerBipolar) }; s = (-3 .. 3).asSet {- check distribution -}
9.randomFloat.isNumber {- random floating point number (0 to self) -}
let s = Set(); 729.timesRepeat { s.include(9.randomFloat.rounded) }; s.minMax = [0, 9] {- check distribution -}
3.randomInteger(9).isInteger {- random integer in range -}
3.randomFloat(9).isNumber {- random float in range -}
let b = Bag(); 5000.timesRepeat { b.add(5.atRandom) }; b.contents.values.allSatisfy { :each | (each / 5000 * 5 - 1).abs < 0.1}
{ [].atRandom = nil }.ifError { true } {- random element of empty collection (nil if unsafe indexing is allowed) -}
[1].atRandom = 1 {- random element of one-element collection -}
let c = [1 .. 5]; c.includes(c.atRandom) {- answer random element from a collection -}
let a = [1 .. 5].asSet; let b = Bag(); 250.timesRepeat { b.add(a.atRandom) }; a = b.asSet {- random element of collection -}
```

## Random -- Sfc32
```
system.includesPackage('Sfc32') {- Sfc32 package -}
let r = Sfc32(98765); r.typeOf = 'Sfc32' {- type -}
let r = Sfc32(98765); r.isSfc32 {- predicate -}
let r = Sfc32(98765); r.isRandom {- predicate -}
let r = Sfc32(98765); r.nextRandomFloat = 0.49556130869314075 {- random number in [0, 1) -}
let r = Sfc32(98765); r.nextRandomFloat(10) = 4.9556130869314075 {- random number in [0, 10) -}
let r = Sfc32(98765); r.nextRandomFloat(0, 100) = 49.556130869314075 {- random number in [0, 100) -}
let r = Sfc32(98765); r.nextRandomInteger(1000) = 496 {- random integer in [1, 1000] -}
let r = Sfc32(98765); r.nextRandomInteger(1, 10000) = 4956 {- random integer in [1, 10000] -}
let r = Sfc32(); let n = r.nextRandomFloat; n >= 0 & { n < 1 } {- seed from system clock -}
let r = Sfc32(); let s = Set(); 729.timesRepeat { s.include(r.nextRandomInteger(9)) }; s.minMax = [1, 9] {- check distribution -}
let r = Sfc32(); let s = Set(); 729.timesRepeat { s.include(r.nextRandomInteger(9)) }; s.asArray.sorted = [1 .. 9] {- check distribution -}
let r = Sfc32(98765); r.isStream {- stream predicate -}
let r = Sfc32(98765); let a = r.next(9); r.reset; r.next(9) = a {- stream interface, next(k) answers next k items, reset resets -}
```

## Random -- Mersenne
```
system.includesPackage('Mersenne') {- Mersenne package -}
let m = Mersenne(98765); m.typeOf = 'Mersenne' {- type of -}
let m = Mersenne(98765); m.isMersenne {- predicate -}
let m = Mersenne(98765); m.isRandom {- predicate -}
let m = Mersenne(98765); m.nextRandomFloat = 0.088898599949636 {- random number in [0, 1) -}
let m = Mersenne(98765); m.nextRandomFloat(10) = 0.88898599949636 {- random number in [0, 10) -}
let m = Mersenne(98765); m.nextRandomFloat(0, 100) = 8.8898599949636 {- random number in [0, 100) -}
let m = Mersenne(98765); m.nextRandomInteger(1000) = 89 {- random integer in [1, 1000] -}
let m = Mersenne(98765); m.nextRandomInteger(1, 10000) = 889 {- random integer in [1, 10000] -}
let m = Mersenne(); let r = m.nextRandomFloat; r >= 0 & { r < 1 } {- seed from system clock -}
Mersenne(123456).nextRandomFloat = 0.12696983303810094 {- test from standard tests -}
let m = Mersenne(); let s = Set(); 729.timesRepeat { s.include(m.nextRandomInteger(9)) }; s.minMax = [1, 9] {- check distribution -}
let m = Mersenne(); let s = Set(); 729.timesRepeat { s.include(m.nextRandomInteger(9)) }; s.asArray.sorted = [1 .. 9] {- check distribution -}
let m = Mersenne(98765); m.isStream {- stream predicate -}
let m = Mersenne(98765); let a = m.next(9); m.reset; m.next(9) = a {- stream interface, next(k) answers next k items, reset resets -}
```

## Random -- SplitMix
```
system.includesPackage('SplitMix') {- SplitMix package -}
let r = SplitMix(98765); r.typeOf = 'SplitMix' {- type of -}
let r = SplitMix(98765); r.isSplitMix {- predicate -}
let r = SplitMix(98765); r.isRandom {- predicate -}
let r = SplitMix(98765); r.nextRandomFloat = 0.08824091404676437 {- random number in [0, 1) -}
let r = SplitMix(98765); r.nextRandomFloat(10) = 0.8824091404676437 {- random number in [0, 10) -}
let r = SplitMix(98765); r.nextRandomFloat(0, 100) = 8.824091404676437 {- random number in [0, 100) -}
let r = SplitMix(98765); r.nextRandomInteger(1000) = 89 {- random integer in [1, 1000] -}
let r = SplitMix(98765); r.nextRandomInteger(1, 10000) = 883 {- random integer in [1, 10000] -}
let r = SplitMix(98765); r.isStream {- stream predicate -}
let r = SplitMix(98765); let a = r.next(9); r.reset; r.next(9) = a {- stream interface, next(k) answers next k items, reset resets -}
```

## Random -- LinearCongruential
```
system.includesPackage('LinearCongruential') {- LinearCongruential package -}
let r = LinearCongruential(42); r.typeOf = 'LinearCongruential' & { r.isLinearCongruential } & { r.isRandom }
let r = LinearCongruential(42); [r.nextRandomFloat, r.nextRandomFloat] = [0.3746499199817101, 0.729023776863283]
let r = LinearCongruential(42); r.isStream {- stream predicate -}
let r = LinearCongruential(42); let a = r.next(9); r.reset; r.next(9) = a {- stream interface, next(k) answers next k items, reset resets -}
```

## Iterator -- collection trait
```
system.includesPackage('Iterator') {- Iterator package -}
[].asIterator.typeOf = 'CollectionStream' {- type of iterator -}
[].asIterator.isIterator {- iterator predicate -}
(1 .. 5).asIterator.upTo(3) = (1 .. 2) {- read up to, but not including, an element, answer is of species of collection -}
(1 .. 5).asIterator.upTo(9) = (1 .. 5) {- read up to end if element is not located -}
let r = [1 .. 5].asIterator; [r.next, r.next(3), r.next, r.next] = [1, [2, 3, 4], 5, nil] {- next answers nil at end -}
let r = [1 .. 3].asIterator; [r.next, r.upToEnd] = [1, [2, 3]] {- read up to end -}
let r = (1 .. 5).asIterator; r.upTo(3) = (1 .. 2) & { r.next = 4} {- matching element is consumed -}
let r = (9 .. 1).asIterator; [r.upTo(3), r.upToEnd] = [(9 .. 4), (2 .. 1)] {- matching element is consumed -}
[].asIterator.next = nil {- next at an empty read iterator answers nil -}
let r = '.....ascii'.asciiByteArray.asIterator; let a = ByteArray(5); r.next(5); r.nextInto(a); a.asciiString = 'ascii'
(1 .. 9).asIterator.nextSatisfy { :each | each >= 5 } = 5 {- read until element satisfies predicate -}
(1 .. 9).asIterator.nextOrUpToEnd(23) = [1 .. 9] {- take at most n items from iterator -}
let r = (1 .. 9).asIterator; [r.nextMatchFor(1), r.next] = [true, 2] {- predicate at consumed item -}
let r = (1 .. 9).asIterator; [r.nextMatchAll([1, 2, 3]), r.next] = [true, 4] {- predicate at consumed items -}
```

## Sphere -- geometric type
```
system.includesPackage('Sphere') {- package -}
Sphere(Point(0, 0, 0), 1).typeOf = 'Sphere' {- type of -}
Sphere(Point(0, 0, 0), 1).isSphere {- predicate -}
Sphere(Point(0, 0, 0), 1).center = Point(0, 0, 0) {- center -}
Sphere(Point(0, 0, 0), 1).radius = 1 {- radius -}
Sphere(Point(0, 0, 0), 1).diameter = 2 {- diameter -}
Sphere(Point(0, 0, 0), 1).surfaceArea = 4.pi {- surface area -}
Sphere(Point(0, 0, 0), 1).volume = (4.pi / 3) {- volume -}
```

## Stream -- collection trait
```
system.includesPackage('Stream') {- Stream package -}
[].asStream.typeOf = 'CollectionStream' {- type of stream -}
[].asStream.isStream {- stream predicate -}
let s = (1 .. 9).asStream; let a = s.next(9); s.reset; s.next(9) = a {- reset stream -}
```

### PositionableStream -- collection trait
```
system.includesPackage('PositionableStream') {- PositionableStream package -}
[].asStream.atEnd = true {- at end predicate -}
let r = (1 .. 1000).asIterator; [r.next, r.next, r.atEnd] = [1, 2, false] {- at end predicate -}
[].asStream.position = 0 {- initially the position is zero -}
let r = (1 .. 5).asStream; [r.peek, r.next] = [1, 1] {- peek at the next item -}
let r = (1 .. 5).asStream; [r.peekFor(1), r.next] = [true, 2] {- peek or read next item -}
let r = (1 .. 5).asStream; [r.peekFor(nil), r.next] = [false, 1] {- peek or read next item -}
let r = (1 .. 5).asStream; r.position(3); r.next = 4 {- move to indicated position, which is the index before the next element -}
let r = (1 .. 5).asStream; r.position(3); r.skip(-1); r.next = 3 {- relative re-positioning -}
let r = (1, 3 .. 9).asStream; r.skip(2); r.upToEnd = (5, 7 .. 9) {- skip to a position -}
let r = (1 .. 9).asStream; r.skipTo(7); r.upToEnd = (8 .. 9) {- skip to an object -}
{ [].asStream.position := -1 }.ifError { true } {- it is an error to move the position out of bounds -}
{ [].asStream.position := 1 }.ifError { true } {- it is an error to move the position out of bounds -}
let r = (9 .. 1).asStream; [r.upToPosition(3), r.upToEnd] = [(9 .. 7), (6 .. 1)] {- read from current up to indicated position -}
let r = (1 .. 9).asStream; [r.next, r.back, r.next] = [1, 1, 1] {- go back one element and return it (by peeking) -}
```

### CollectionStream -- collection trait
```
(1 .. 5).asStream.size = 5 {- stream from interval, stream size -}
(1 .. 5).asStream.contents = (1 .. 5) {- contents of finite stream (a copy of the collection) -}
let a = [1 .. 5]; a.asStream.contents ~~ a {- contents of finite stream (a copy of the collection) -}
let i = (1 .. 5); i.asStream.originalContents == i {- original contents of stream (the actual collection -}
let r = (1 .. 5).asStream; r.upToEnd; r.contents = (1 .. 5) {- contents of consumed stream -}
(1 .. 9).asStream.collection = Interval(1, 9, 1) {- read stream over interval collection -}
let i = (1 .. 9); let s = i.asStream; let c = s.copy; c.next; s.next = 1 & { c.next = 2 } {- copy -}
```

## Record -- collection type
```
system.includesPackage('Record') {- package -}
().typeOf = 'Record' {- literal empty record syntax, typeOf query -}
().isRecord {- record predicate -}
().species = Record:/0 {- record species -}
Record().isRecord {- empty record constructor -}
Record().includesIndex('x') = false {- includes key predicate -}
(w: 0, x: 1).includesIndex('x') = true {- includes key predicate -}
{ Record().at('x') }.ifError { true } {- lookup for non-existing key raises an error -}
{ ()['x'] }.ifError { true } {- lookup for non-existing key is an error -}
let d = Record(); d.atPut('x', 1) = 1 & { d.at('x') = 1 }
let d = Record(); (d['x'] := 1) = 1 & { d['x'] = 1 }
let d = Record(); d['x'] := 1; d['y'] := 2; d.size = 2
let d = Record(); d::x := 1; d::y := 2; d.size = 2
['x' -> 1, 'y' -> 2].asRecord = (x: 1, y: 2) {- association array to record -}
['x' -> 1, 'y' -> 2].asRecord['y'] = 2 {- association array to record -}
{ Record().atPut(1, 1) }.ifError { true }
(x: 3.141, y: 23).json = '{"x":3.141,"y":23}' {- records have a json encoding where values do -}
'{"x":3.141,"y":23}'.parseJson = (x: 3.141, y: 23) {- parse json record -}
let d = (x: 1, y: 2); let i = 9; d.associationsDo { :each | i := i - each.value }; i = 6 {- iterate over associations -}
let d = (x: 1, y: 2); d.collect { :each | each * 9 } = (x: 9, y: 18)
(x: 23, y: 3.141).isDictionary
(x: 1.pi)::x = 1.pi
(x : 1.pi) :: x = 1.pi
let d = (x: 23, y: 3.141); d::x = 23
let d = (x: 23, y: 3.141); d::x := 42; d = (x: 42, y: 3.141)
(x: 1).copy = (x: 1) {- a copy of record is a record -}
let d = (x: 23, y: 3.141); let c = d.copy; d ~~ c & { d = c } {- copy is equal to but not identical to -}
let d = (x: 1, y: 2); let c = d.copy; c::x := 3; c::x = 3 & { d::x = 1 } {- copies are distinct -}
(x:1, y:2) ++ (z:3) = (x:1, y:2, z:3) {- white space after colon is optional -}
(x: 1, y: 2).associations = ['x' -> 1, 'y' -> 2] {- array of associations at record -}
(x: 1, y: 2).asArray = [1, 2] {- values as Array -}
let d = (x:1, y:2, z:3); let (x, z) = d; [x, z] = [1, 3]
let (x, y) = { let n = system.nextRandomFloat; (x: n, y: n) }.value; x = y
(x:1, y:2, z:3).select(even:/1) = (y: 2)
(x:1, y:2, z:3).sum = 6
let d = (x: 9); d::x.sqrt = 3
size (x: 1, y: 2, z: 3) = 3
let c = (y: 2, z: 3); let r = (x: 1); r.addAll(c); r = (x: 1, y: 2, z: 3) {- add all elements of a Dictionary to a Dictionary -}
let c = (y: 2, z: 3); (x: 1).addAll(c) = c {- answer is argument -}
(x: 1) = ('x': 1) {- records with quoted keys -}
('font-size': '11pt', 'font-style': 'italic').indices = ['font-size', 'font-style'] {- records with quoted keys that are not identifiers -}
(x: 1).asMap.asRecord = (x: 1) {- record to map to record is identity -}
(x: true)::x = true {- true value answers true -}
(x: false).includesIndex('x') = true {- includes index at false value answers true -}
(x: false)::x = false {- at at key with false value answers false -}
(x: false)::x ~= nil {- at at key with false value does not answer nil -}
(x: nil)::x = nil {- at at key with nil value answers nil -}
(x: 1, y: 2) = (x: 1, y: 2) {- Record equality -}
(x: 1, y: 2) ~= (x: 2, y: 1) {- Record in-equality -}
let r = (x: 1, y: 2); r == r {- Record identity -}
(x: 1, y: 2) ~~ (x: 1, y: 2) {- Record non-identity -}
(x: 1, y: 2, z: 3).indices = ['x', 'y', 'z'] {- indices of record (an array) -}
(x: 1, y: 2) = (x: 1, y: 2) {- key sequence and equality -}
(x: 1, y: 2) ~= (y: 2, x: 1) {- key sequence and equality -}
Record().hasEqualElements(Record()) {- key sequence and equality -}
(x: 1, y: 2).hasEqualElements(x: 1, y: 2) {- key sequence and equality -}
(x: 1, y: 2).hasEqualElements(y: 2, x: 1) {- key sequence and equality -}
(x: 1, y: 2).hasEqualElements(x: 1, z: 2) = false {- has equal keys and values -}
(x: 1, y: 2).hasEqualElements(x: 2, y: 1) = false {- has equal keys and values -}
(x: 1, z: 2).hasEqualElements(z: 1, y: 2) = false {- has equal keys and values -}
(x: 1, y: 2).hasEqualElements(x: 1, y: 2, z: 3) = false {- has equal keys and values -}
(x: 1, y: 2, z: 3).hasEqualElements(x: 1, y: 2) = false {- has equal keys and values -}
```

## Rectangle -- geometry type
```
system.includesPackage('Rectangle') {- Rectangle package -}
Rectangle(0@0, 1@1).printString = 'Rectangle(0@0, 1@1)'
Rectangle(0@0, 1@1).storeString = 'Rectangle(RectangularCoordinate(0, 0), RectangularCoordinate(1, 1))'
Rectangle(0@0, 2@2).intersect(Rectangle(1@1, 4@4)) = Rectangle(1@1, 2@2)
Rectangle(1@1, 3@3).area = 4
Rectangle(1@1, 3@3).center = Point(2, 2)
Rectangle(1@1, 3@3).containsPoint(2@2) = true
let o = 0@0; let p = 10@10; let q = 0 - p; [Rectangle(q, o), Rectangle(o, p)].rectangleMerging = Rectangle(q, p)
let r = (0@0).extent(10@20); r.area = (10 * 20) {- area is width by height -}
let r = (0@0).extent(10@20); r.translateBy(-20@10).area = (10 * 20) {- translation preserves area -}
let r = (10@20).corner(0@0); r.area = 0 {- the area of an empty rectangle is zero -}
let r = (10@20).corner(0@20); r.area = 0 {- the area of an empty rectangle is zero -}
let r = (0@20).corner(10@0); r.area = 0 {- the area of an empty rectangle is zero -}
let r = (0@0).extent(10@20); let c = r.center; r.containsPoint(c) {- the center is inside the rectangle -}
let r = (0@0).extent(10@20); let c = r.center; r.topLeft.distance(c) = r.bottomRight.distance(c)
let r = (0@0).extent(10@20); let c = r.center; r.bottomLeft.distance(c) = r.topRight.distance(c)
let r = (0@0).extent(10@20); let c = r.center; r.topLeft.distance(c) = r.bottomLeft.distance(c)
let r = (0@0).extent(10@20); let c = r.center; r.translateBy(-20@10).center = c.translateBy(-20@10) {- the center is translated with the rectangle -}
let r = (30@10).corner(10@20); let c = r.center; r.containsPoint(c).not {- an empty rectangle does not contain any point -}
let r = (0@0).extent(50@50); [r.center, 1.5@1.5, r.topLeft, r.topRight, r.bottomLeft, r.bottomRight].collect { :each | r.containsPoint(each) } = [true, true, true, false, false, false]
let r = (10@10).extent(20@30); r.containsPoint(r.origin) {- a rectangle does contain its origin -}
let r = (10@10).extent(20@30); r.containsPoint(r.corner).not {- a rectangle does not contain its corner -}
let r = (0@0).extent(50@50); let pt = r.randomPoint; r.containsPoint(pt) {- a rectangle contains any random point in it -}
let r = (0@0).extent(50@50); r.pointAtFraction(0.5@0.5) = r.center {- pointAtFraction can find the center -}
let r = (10@20).corner(30@50); (10@20).corner(30@35) = r.topHalf & { (10@20).corner(30@27.5) = r.topHalf.topHalf }
let r = (10@20).corner(30@50); (10@20).corner(20@35) = r.topLeftQuadrant
let r = (10@20).corner(30@50); (10@20).corner(15@27.5) = r.topLeftQuadrant.topLeftQuadrant
let r = (10@20).corner(30@50); (20@20).corner(30@35) = r.topRightQuadrant
let r = (10@20).corner(30@50); (25@20).corner(30@27.5) = r.topRightQuadrant.topRightQuadrant
```

## RegExp -- text type
```
system.includesPackage('RegExp') {- regular expression package -}
RegExp('ab+c').typeOf = 'RegExp' {- type of, single argument constructor -}
RegExp('ab+c').isRegExp = true {- type predicate -}
RegExp('x.x').source = 'x.x' {- retrieve source -}
RegExp('x.x', 'g').flags = 'g' {- retreive flags -}
RegExp('x.x', 'g').isGlobal = true {- is global flag set -}
RegExp('x.x', 'g').printString = "RegExp('x.x', 'g')" {- print string is contructor -}
RegExp('x.x', 'g').stringLiteral = '/x.x/g' {- a string indicating both source and flags -}
RegExp('ab*c').search('abc') = true {- predicate to determine if a string contains a match for a regular expression -}
RegExp('ab*c').search('-abc-') = true {- the entire string is not required to match -}
RegExp('ab*c').matches('abc') = true {- predicate to determine if a string exactly matches a regular expression -}
RegExp('ab*c').matches('-abc-') = false {- predicate to determine if a string exactly matches a regular expression -}
RegExp('^ab*c$').search('abc') = true {- ^ matches the start of the string and $ the end -}
RegExp('^ab*c$').search('-abc-') = false {- searching for a regular expression with ^ and $ requires an exact match -}
RegExp('c(a|d)+r').matches('caddar') = true {- test if a string exactly matches a regular expression -}
RegExp('c(a|d)+r').matches('-caddar-') = false {- test if a string exactly matches a regular expression -}
RegExp('c(a|d)+r').search('caddar') = true {- test if a string contains a match for a regular expression -}
RegExp('c(a|d)+r').search('-caddar-') = true {- test if a string constains a match for a regular expression -}
RegExp('c(a|d)+r').match('car') = 'car' {- get match for regular expression -}
RegExp('c(a|d)+r').match('cdr') = 'cdr' {- get match for regular expression -}
RegExp('c(a|d)+r').match('-car-') = 'car' {- get match for regular expression -}
RegExp('c(a|d)+r').match('-cdr-') = 'cdr' {- get match for regular expression -}
RegExp('c(a|d)+r').match('xyz') = nil {- if there is no match answer nil -}
let r = RegExp('ab*c'); ['ac', 'abc', 'abbc'].collect { :each | r.matches(each) } = [true, true, true] {- test input string against regexp -}
{ RegExp('ab*c').matches(1.pi) }.ifError { true } {- test parameter must be a string -}
RegExp('c(a|d)+r', 'g').matchAll('car cdr cadr') = ['car', 'cdr', 'cadr']
RegExp('c(a|d)+r', 'g').matchAll('does not') = []
RegExp('ab*c', 'g').matchAll('ab abc ac') = ['abc', 'ac']
RegExp('-|:').split('a-b:c') = ['a', 'b', 'c'] {- split string at matching tokens -}
RegExp('x|z').replaceWith('x y z', '-') = '- y z'
RegExp('x|z', 'g').replaceAllWith('x y z', '-') = '- y -'
{ RegExp('x|z').replaceAllWith('x y z', '-') }.ifError { true } {- requires 'g' flag -}
'ab abc ac'.allRegExpMatches(RegExp('ab*c', 'g')) = ['abc', 'ac']
'a-b:c'.splitRegExp('-|:') = ['a', 'b', 'c'] {- split string at matching tokens -}
'x y z'.replaceRegExp('x|z', '-') = '- y z'
'x y z'.replaceRegExp(RegExp('x|z', 'g'), '-') = '- y -'
RegExp('x|z').replaceModifying('x y z', toUppercase:/1) = 'X y z' {- instead of a replacement string, allows for a block to process the match -}
RegExp('x|z', 'g').replaceAllModifying('x y z', toUppercase:/1) = 'X y Z'
'A short sentence of six words'.wordAtIndex(23) = 'six' {- get word looking backwards and forwards from index for non-word characters -}
```

## Regular Expressions -- matches
```
'car'.matchesRegExp('c(a|d)+r'.RegExp) {- test if a string matches a regular expression -}
'cdr'.matchesRegExp('c(a|d)+r'.asRegExp) {- asRegExp compiles a string -}
'caar'.matchesRegExp('c(a|d)+r') {- a string parameter is compiled using asRegExp -}
'cadr'.matchesRegExp('c(a|d)+r')
'caddar'.matchesRegExp('c(a|d)+r')
'-car-'.matchesRegExp('c(a|d)+r') = false {- incomplete match for regular expression -}
'-cdr-'.matchesRegExp('c(a|d)+r') = false {- incomplete match for regular expression -}
'-car-'.searchRegExp('c(a|d)+r') {- search for incomplete match regular expression -}
'-cdr-'.searchRegExp('c(a|d)+r') {- search for incomplete match for regular expression -}
'aabbcc'.matchesRegExp('a+b+c+')
'aabbcc'.matchesRegExp('a+$').not
'aabbcc'.matchesRegExp('^b+c+').not
'aabbcc'.matchesRegExp('a+b+c+')
'car'.matchRegExp('c(a|d)+r') = 'car' {- retrieve match for regular expression -}
'cdr'.matchRegExp('c(a|d)+r') = 'cdr' {- retrieve match for regular expression -}
'-car-'.matchRegExp('c(a|d)+r') = 'car' {- retrieve match for regular expression -}
'-cdr-'.matchRegExp('c(a|d)+r') = 'cdr' {- retrieve match for regular expression -}
```

## RegExp -- testing
```
'23'.isDecimalIntegerString
'23.0'.isDecimalIntegerString.not
'23x'.isDecimalIntegerString.not
''.isDecimalIntegerString.not
'x'.isDecimalIntegerString.not
'3.141'.isFloatString
'-3.141'.isFloatString
'23'.isFloatString
'-23'.isFloatString
'.23'.isFloatString.not
'23.'.isFloatString.not
'0.00012'.isFloatString
'0E-10'.isFloatString
'1.2e3'.isFloatString
'1.2E3'.isFloatString
'-1.2e3'.isFloatString
'1.2e-3'.isFloatString
'-1.2e-3'.isFloatString
'3.141x'.isFloatString.not
'-3.141x'.isFloatString.not
'23x'.isFloatString.not
'-23x'.isFloatString.not
'1.2e-4x'.isFloatString.not
''.isFloatString.not
'x'.isFloatString.not
```

## RunArray -- collection type
```
system.includesPackage('RunArray') {- RunArray package -}
let a = RunArray([1, 3, 5], ['a', 'b', 'c']); a.isRunArray & { a.size = 9 } {- from runs and values, size is sum of runs -}
let a = RunArray([1, 3, 5], ['a', 'b', 'c']); a.size = 9 & { a.asArray.join = 'abbbccccc' } {- as array -}
let a = [1 -> 'a', 3 -> 'b', 5 -> 'c'].associationArrayToRunArray; a.size = 9 & { a.asArray.join = 'abbbccccc' } {- from associations -}
let a = RunArray([1 4 2 1], [9 7 5 3]); a.size = 8 & { a.asArray = [9 7 7 7 7 5 5 3] }
{ let a = RunArray([1 3], ['a' 'b']); a[5] }.ifError { true } {- invalid index -}
let a = RunArray([1, 4, 2, 1], 'abca'.split); a.first = 'a' & { a.last = 'a' } {- first and last are optimized -}
let a = RunArray([1, 4, 2], 'abc'.split); a.includes('c') & { a.isSorted } {- includes and isSorted are optimized -}
RunArray([1, 4, 2], ['a', 'b', 'c']).reversed = [2 -> 'c', 4 -> 'b', 1 -> 'a'].associationArrayToRunArray {- reversed is optimized -}
let a = RunArray([23, 34, 45], ['a', 'b', 'a']); (a.allocatedSize / a.size * 100).rounded = 9 {- space saving, in % -}
RunArray([1, 3, 5], ['a', 'b', 'c']).asArray.join = 'abbbccccc' {- from runs and values, as array -}
[1 -> 'a', 3 -> 'b', 5 -> 'c'].associationArrayToRunArray.asArray.join = 'abbbccccc' {- from associations, as array -}
[4 3 3 2 2 2 1 1 1 1].asRunArray = RunArray([1 2 3 4], [4 3 2 1]) {- from sequence -}
'abbbccccc'.asArray.asRunArray.runs = [1 3 5]
```

## Sequenceable -- collection trait
```
system.includesPackage('Sequenceable') {- package -}
[1, 3, 2] ++ [4, 5] = [1, 3, 2, 4, 5] {- append sequences -}
[1, 3, 2, 4, 5].reversed = [5, 4, 2, 3, 1] {- reverse sequence (anwer new array) -}
[1, 3, 2, 4, 5].sorted = [1, 2, 3, 4, 5] {- sort using default comparison (answer new array) -}
[1, 3, 2, 4, 5].sorted { :i :j | i > j } = [5 .. 1] {- sort using provided comparison (answer new array) -}
[3, 3, 3, 2, 2, 1].sorted.size = 6 {- sort retains duplicates -}
let c = [3, 2, 1]; c.sort; c = [1, 2, 3] {- sort is in place (mutating) -}
let a = [3, 2, 1]; a.sort = a {- sort is in place (mutating) -}
let a = [3, 2, 1]; a.sorted ~= a {- sorted answers a new array -}
let c = [3, 2, 1]; let r = c.sorted; c ~= r {- sorted (answer a new array) -}
[1 .. 5].isSorted {- is sequence sorted -}
[1, 3 .. 11].isSorted {- is sequence sorted -}
[].isSorted {- an empty sequence is sorted -}
[1].isSorted {- a one element sequence is sorted -}
[11, 9 .. 1].isSortedBy { :i :j | i > j } {- is sequence sorted by predicate -}
[1, 5, 3, 7, 9].isSorted.not {- is sequence sorted -}
[1, 3, 5, 7, 9].copyFromTo(3, 5) = [5, 7, 9] {- copy part of collection, one-indexed, inclusive -}
[1, 3, 5, 7, 9].indexOfSubCollection([5, 7, 9]) = 3 {- locate index of subsequence -}
[1, 3, 5, 7, 9].indexOf(5) = 3 {- index of element (compared using =) -}
[1, 3, 5, 7, 9].first = 1 {- first element of sequence -}
(1 .. 9).first(5) = (1 .. 5) {- first n elements of sequence -}
{ (1 .. 9).first(11) }.ifError { true } {- error if too few elements -}
let a = (1 .. 9); a.first = a[1] {- one-indexed -}
[1, 3, 5, 7, 9].last = 9 {- last element of -}
(1 .. 9).last(5) = (5 .. 9) {- last n elements of -}
{ (1 .. 9).last(11) }.ifError { true } {- too few elements -}
let i = (1 .. 9); i.last = i[9] {- intervals are one-indexed sequences -}
[1, 3, 5, 7, 9].middle = 5 {- middle element of -}
[1 .. 4].beginsWith([1, 2]) = true {- is prefix of -}
[1 .. 4].beginsWith([]) = true {- empty prefix answers true -}
let n = 0; let i = (1 .. 4); i.permutationsDo { :each | n := n + 1 }; n = 24 {- interval permutations do -}
let n = 0; let a = [1 .. 4]; a.permutationsDo { :each | n := n + 1 }; n = 24 & { a = [1 .. 4] } {- array permutations do -}
let a = [1 .. 3].permutations; a = [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 2, 1], [3, 1, 2]] {- permutations -}
let i = (4, 7 .. 13); let p = i.permutations; p.size = i.size.factorial & { p.asSet.size = p.size }
let i = (4, 7 .. 13); i.permutations.allSatisfy { :e | e.sorted.hasEqualElements(i) }
let a = [1, 1, 3, 4]; a @* [2, 4, 3, 1] = [1, 4, 3, 1] {- atAll as permutation -}
let a = [1 1 3 4]; a @* [2 4 3 1] = [1 4 3 1] {- atAll as permutation -}
[1, 9, 2, 8, 3, 7, 4, 6].pairsCollect { :i :j | i + j } = [10, 10, 10, 10]
let s = ''; [1, 9, 2, 8, 3, 7, 4, 6].pairsDo { :i :j | s := s ++ (i + j).printString }; s = '10101010'
let s = ''; [1, 9, 2, 8, 3, 7, 4, 6].reverseDo { :i | s := s ++ i.printString }; s = '64738291' {- do from end -}
[1, 2, 2, 3, 3, 3, 4, 4, 4, 4].copyWithoutDuplicates = [1, 2, 3, 4] {- copy without duplicates, retain order -}
([1, 3 .. 9] ++ [1, 3 .. 9] ++ [2, 4 .. 10] ++ [2, 4 .. 10]).copyWithoutDuplicates = [1, 3, 5, 7, 9, 2, 4, 6, 8, 10]
(1 .. 9).hasEqualElements((1 .. 9)) {- an array is not equal to an interval, but can have equal elements -}
(1 .. 9).hasEqualElements((1 .. 9)) {- an interval is not equal to an array, but can have equal elements -}
[1 .. 9] ~= (1 .. 9) {- an array is not equal to an interval -}
(1 .. 9) ~= [1 .. 9] {- an interval is not equal to an array -}
[1 .. 9] ~= (1 .. 9) {- an array is not equal to an interval -}
(1 .. 9) ~= [1 .. 9] {- an interval is not equal to an array -}
[1.5 .. 9.5].middle = 5.5 {- range start need not be an integer -}
let c = [1 .. 5]; c.swapWith(1, 4); c = [4, 2, 3, 1, 5] {- swap elements at indices in place -}
{ [1 .. 5].swapWith(1, 9) }.ifError { true } {- it is an error if an index is invalid -}
[1, [2, [3, [4, [5], 6], 7], 8], 9].flattened = [1 .. 9] {- concatenation removing all nesting -}
[1, [2, [3, ['45', 6], '78']], 9].flattened = [1, 2, 3, '45', 6, '78', 9] {- strings are not flattened to sequences of characters -}
[3, 4, [2, 4, ['xy'], 'wz']].flattened = [3, 4, 2, 4, 'xy', 'wz']
(1 .. 9).rotatedLeft(3) = ([4 .. 9] ++ [1 .. 3]) {- rotate left -}
let a = [1 .. 9]; a.rotatedLeft(3) ~~ a {- rotation is not in place -}
(1 .. 9).rotatedRight(3) = ([7 .. 9] ++ [1 .. 6]) {- rotate right -}
let d = []; (3 .. 1).withDo((1 .. 3)) { :p :q | d.add(p -> q) }; d = [3 -> 1, 2 -> 2, 1 -> 3] {- do with elements from a second sequence of equal size -}
let d = []; (3 .. 1).reverseWithDo((1 .. 3)) { :p :q | d.add(p -> q) }; d = [1 -> 3, 2 -> 2, 3 -> 1]
let d = []; (3 .. 1).withIndexDo { :each :index | d.add(each -> index) }; d = [3 -> 1, 2 -> 2, 1 -> 3]
(9 .. 1).withCollect((1 .. 9)) { :p :q | p * 2 + q } = [19 .. 11]
(9 .. 1).withIndexCollect { :each :index | each * 2 + index } = [19 .. 11]
[1, 3, 5, 7, 11, 15, 23].findBinary { :arg | 11 - arg } = 11
[1, 3, 5, 7, 11, 15, 23].findBinaryIndex { :arg | 11 - arg } = 5
{ [1, 3, 5, 7, 11, 15, 23].findBinaryIndex { :arg | 12 - arg } }.ifError { true }
[1, 3, 5, 7, 11, 15, 23].findBinaryIndexIfNone { :arg | 12 - arg } { :a :b | [a, b] } = [5, 6]
[1, 3, 5, 7, 11, 15, 23].findBinaryIndexIfNone { :arg | 0.5 - arg } { :a :b | [a, b] } = [0, 1] {- note 0 is not a valid index -}
[1, 3, 5, 7, 11, 15, 23].findBinaryIndexIfNone { :arg | 25 - arg } { :a :b | [a, b] } = [7, 8] {- note 8 is not a valid index -}
[1, 3, 5, 7, 11, 15, 23].findBinaryIfNone { :arg | 11 - arg } { :a :b | [a, b] } = 11
[1, 3, 5, 7, 11, 15, 23].findBinaryIfNone { :arg | 12 - arg } { :a :b | [a, b] } = [11, 15]
[1, 3, 5, 7, 11, 15, 23].findBinaryIfNone { :arg | 0.5 - arg } { :a :b | [a, b] } = [nil, 1]
[1, 3, 5, 7, 11, 15, 23].findBinaryIfNone { :arg | 25 - arg } { :a :b | [a, b] } = [23, nil]
let a = []; (0 .. 1).asDigitsToPowerDo(2) { :each | a.add(each.copy) }; a = [[0, 0], [0, 1], [1, 0], [1, 1]]
['one', 'two', 'three', 'four'].atAll([3, 2, 4]) = ['three', 'two', 'four'] {- at each index -}
(1 .. 9).atAll((3 .. 5)) = [3 .. 5] {- at all indices -}
(1 .. 9) @* (3 .. 5) = [3 .. 5] {- @* atAll operator -}
let a = Array(9); a.atAllPut(0); a = [0, 0, 0, 0, 0, 0, 0, 0, 0] {- set all elements to a single value -}
let a = [1 .. 9]; a.atAllPut([3 .. 7], 0); a = [1, 2, 0, 0, 0, 0, 0, 8, 9] {- set all selected indices to a value -}
let a = [1 .. 9]; a.atAllPut((3 .. 7), 0); a = [1, 2, 0, 0, 0, 0, 0, 8, 9] {- set all selected indices to a value -}
let a = [1 .. 9]; a.atAllPutAll([3 .. 7], [7 .. 3]); a = [1, 2, 7, 6, 5, 4, 3, 8, 9] {- set all selected indices to corresponding values -}
let a = [1 .. 9]; a.atAllPutAll((3 .. 7), (7 .. 3)); a = [1, 2, 7, 6, 5, 4, 3, 8, 9] {- set all selected indices to corresponding values -}
let a = [1 .. 9]; a.replace { :each | each * each }; a = [1, 4, 9, 16, 25, 36, 49, 64, 81] {- in place collect -}
let c = [7, 2, 6, 1]; c.sorted = [1, 2, 6, 7] & { c.sorted ~= c } {- sorted copy -}
let c = [7, 2, 6, 1]; c.sort = [1, 2, 6, 7] & { c = [1, 2, 6, 7] } {- sort in place -}
[7, 2, 6, 1].asSortedArray.contents = [1, 2, 6, 7]
[7, 2, 6, 1].sorted(>) = [7, 6, 2, 1]
[7, 2, 6, 1].sorted(greaterThan:/2) = [7, 6, 2, 1] {- with operator written out -}
let n = 0; [3 .. 7].allButFirstDo { :each | n := n + each }; n = [4 .. 7].sum {- iterate skipping first element -}
let n = 0; [3 .. 7].allButLastDo { :each | n := n + each }; n = [3 .. 6].sum {- iterate skipping last element -}
let a = []; (1 .. 4).combinationsAtATimeDo(3) { :each | a.add(each.copy) }; a = [[1, 2, 3], [1, 2, 4], [1, 3, 4], [2, 3, 4]]
let a = []; (1 .. 5).combinationsAtATimeDo(3) { :each | a.add(each.sum) }; a = [6, 7, 8, 8, 9, 10, 9, 10, 11, 12]
let a = []; (1 .. 9).fromToDo(3, 7) { :each | a.add(each) }; a = [3 .. 7] {- partial iterator -}
let a = []; [1 / 3, 1 / 4, 1 / 4, 0.9, 1 / 3, 1].groupsDo { :p :q :r | a.add(p.roundTo(q) = r) }; a = [true, true]
let a = []; (9 .. 1).indicesDo { :index | a.add(index * 2) }; a = [2, 4 .. 19] {- indexed -}
let a = []; (9 .. 1).withIndexDo { :value :index | a.add(index * 2 + value) }; a = [11 .. 19] {- keys are indices -}
let a = []; (9 .. 7).withIndexDo { :value :index | a.add(index -> value) }; a = [1 -> 9, 2 -> 8, 3 -> 7] {- keys are indices -}
let a = []; (9 .. 7).withIndexDo { :each :index | a.add(index -> each) }; a = [1 -> 9, 2 -> 8, 3 -> 7]{- index is second argument -}
let a = [1 .. 5]; a.atIncrementBy(3, 6); a = [1, 2, 9, 4, 5] {- increment value at index by -}
let a = [1 .. 9]; a.atLastPut(3, -7); a = [1, 2, 3, 4, 5, 6, -7, 8, 9] {- set at index from end -}
'string'.split.sorted = ['g', 'i', 'n', 'r', 's', 't']
'string'.split.sortedWithIndices = ['g' -> 6, 'i' -> 4, 'n' -> 5, 'r' -> 3, 's' -> 1, 't' -> 2]
let a = 'string'.split; a.atAll([6, 4, 5, 3, 1, 2]) = a.sorted
[1, 3, 2, 5, 4].sortedWithIndices = [1 -> 1, 2 -> 3, 3 -> 2, 4 -> 5, 5 -> 4]
[1, 3, 2, 5, 4].atAll([1, 3, 2, 5, 4]) = [1 .. 5]
let a = [2 .. 5]; let b = a.copyWithFirst(1); a ~= b & { b = [1 .. 5] } {- copy with new first element -}
let a = [1 .. 7]; a.replaceFromToWith(3, 5, [-3, -4, -5]); a = [1, 2, -3, -4, -5, 6, 7]
{ [1 .. 7].replaceFromToWith(3, 5, [-3, -4]) }.ifError { true } {- replacement must be of equal size -}
let a = [1 .. 7]; a.replaceFromToWithStartingAt(3, 5, [-3, -4, -5], 1); a = [1, 2, -3, -4, -5, 6, 7]
[1 .. 7].forceToPaddingWith(9, 0) = [1, 2, 3, 4, 5, 6, 7, 0, 0] {- copy of sequence with required length and initializer -}
[1 .. 7].forceToPaddingWith(5, 0) = [1 .. 5] {- partial copy -}
let a = [1 .. 4]; a += 8; a = [9 .. 12] {- in place array/scalar addition -}
let a = [1 .. 4]; a += [4 .. 1]; a = [5, 5, 5, 5] {- in place array/array addition -}
let a = [5 .. 8]; a -= 4; a = [1 .. 4] {- in place array/scalar subtraction -}
let a = [5 .. 8]; a -= [4 .. 1]; a = [1, 3 .. 7] {- in place array/array subtraction -}
let a = [1 .. 4]; a *= 2; a = [2, 4 .. 8] {- in place array/scalar multiplication -}
let a = [1 .. 4]; a *= [4 .. 1]; a = [4, 6, 6, 4] {- in place array/array multiplication -}
let a = [2, 4 .. 8]; a /= 2; a = [1, 2 .. 4] {- in place array/scalar division -}
let a = [2, 4 .. 8]; a /= [1 .. 4]; a = [2, 2, 2, 2] {- in place array/array division -}
let a = [9 .. 1]; a.withReplace((1 .. 9)) { :p :q | p * 2 + q }; a = [19 .. 11] {- in place withCollect -}
[7 .. 4].indexValueAssociations = [1 -> 7, 2 -> 6, 3 -> 5, 4 -> 4] {- the (index -> value) associations of a sequence -}
let a = []; (x: 1, y: 2, z: 3).indicesDo { :each | a.add(each) }; a = ['x', 'y', 'z'] {- iterate indices -}
(1 .. 4).foldLeft(Association:/2) = (((1 -> 2) -> 3) -> 4) {- fold, left associative -}
(1 .. 4).foldRight(Association:/2) = (1 -> (2 -> (3 -> 4))) {- fold, right associative -}
(1 .. 4).foldLeft(-) = (((1 - 2) - 3) - 4) {- fold, left associative -}
(1 .. 4).foldLeft(minus:/2) = (((1 - 2) - 3) - 4) {- with operator written out -}
(1 .. 4).foldRight(-) = (1 - (2 - (3 - 4))) {- fold, right associative -}
(1 .. 4).foldRight(minus:/2) = (1 - (2 - (3 - 4))) {- with operator written out -}
let a = [1 3 5 3 5 7]; a.replaceAllWith(3, -3); a = [1 -3 5 -3 5 7] {- replace each occurence of an item with another -}
[0, 1].tuples(2) = [[0, 0], [0, 1], [1, 0], [1, 1]] {- all n-tuples, of two elements is binary counting -}
[0 1].tuples(3) = [0 0 0; 0 0 1; 0 1 0; 0 1 1; 1 0 0; 1 0 1; 1 1 0; 1 1 1] {- all n-tuples -}
[0 1 2].tuples(2) = [0 0; 0 1; 0 2; 1 0; 1 1; 1 2; 2 0; 2 1; 2 2] {- of three elements is ternary counting -}
[0 1 2].tuples(3).first(6) = [0 0 0; 0 0 1; 0 0 2; 0 1 0; 0 1 1; 0 1 2]
[3 5].tuples(3) = [3 3 3; 3 3 5; 3 5 3; 3 5 5; 5 3 3; 5 3 5; 5 5 3; 5 5 5]
[3 5 7].tuples(3).first(9) = [3 3 3; 3 3 5; 3 3 7; 3 5 3; 3 5 5; 3 5 7; 3 7 3; 3 7 5; 3 7 7]
let x = [0 1 2]; x.tuples(2) = x.cartesianProduct(x) {- two-tuples are the self cartesian product -}
let x = [0 1]; x.cartesianProduct(x) = [0 0; 0 1; 1 0; 1 1] {- self cartesian product -}
[0 1].cartesianProduct([2 3]) = [0 2; 0 3; 1 2; 1 3] {- cartesian product of collections of equal size -}
[0 1].cartesianProduct([2 3 4]) = [0 2; 0 3; 0 4; 1 2; 1 3; 1 4] {- cartesian product of collections of unequal size -}
[1 2 3].withCrossedCollect([4 5 6], * ) = [4 5 6 8 10 12 12 15 18]
[1 2 3].withCrossedCollect([4 5 6], times:/2) = [4 5 6 8 10 12 12 15 18] {- with operator written out -}
[1 2 3].crossedMultiply([4 5 6]) = [4 5 6 8 10 12 12 15 18]
[1 2 3].withTruncatingCollect([4 5 6 7], * ) = [4 10 18]
[1 2 3].withTruncatingCollect([4 5 6 7], times:/2) = [4 10 18] {- with operator written out -}
[1 2 3 4].withWrappingCollect([5 6 7 8 9], * ) = [5 12 21 32 9]
[1 2 3 4].withWrappingCollect([5 6 7 8 9], times:/2) = [5 12 21 32 9] {- with operator written out -}
(1 .. 9).prefixSum = [1 3 6 10 15 21 28 36 45] {- prefix sum -}
(1 .. 9).prefixProduct = [1 2 6 24 120 720 5040 40320 362880] {- prefix product -}
(1 .. 9).scan(+) = (1 .. 9).prefixSum {- scan, generalized prefix sum -}
(1 .. 9).scan(plus:/2) = (1 .. 9).prefixSum {- with operator written out -}
(1 .. 9).scan( * ) = (1 .. 9).prefixProduct
(1 .. 9).scan(times:/2) = (1 .. 9).prefixProduct {- with operator written out -}
(1 .. 16).first(4) = (1 .. 4) {- first group of n elements of sequence -}
(1 .. 16).second(4) = (5 .. 8) {- second group of n elements of sequence -}
(1 .. 16).third(4) = (9 .. 12) {- third group of n elements of sequence -}
(1 .. 16).fourth(4) = (13 .. 16) {- fourth group of n elements of sequence -}
(1 .. 16).last(4) = (13 .. 16)  {- last group of n elements of sequence -}
(1 .. 4).replicateEach(2) = [1 1 2 2 3 3 4 4]  {- replicate each element n times -}
(1 .. 4).replicateEachApplying(2, squared:/1) = [1 1 4 4 9 9 16 16] {- replicate each element -}
[{ 1 }, { 2 }].duplicateEach(2) = [1 1 2 2] {- duplicate each element n times -}
```

## Sequence arithmetic
```
[1, 3 .. 9] + 9 = [10, 12 .. 18] {- sequence + scalar -}
[1, 3 .. 9] - 9 = [-8, -6 .. 0] {- sequence - scalar -}
[1, 3 .. 9] * 9 = [9, 27 .. 81] {- sequence * scalar -}
[2, 4 .. 8] / 2 = [1 .. 4] {- sequence / scalar -}
9 + [1, 3 .. 9] = [10, 12 .. 18] {- scalar + sequence -}
9 - [1, 3 .. 9] = [8, 6 .. 0] {- scalar - sequence -}
9 * [1, 3 .. 9] = [9, 27 .. 81] {- scalar * sequence -}
72 / [2, 4 .. 8] = [36, 18, 12, 9] {- scalar / sequence -}
[1, 3 .. 9] + [1 .. 5] = [2, 5, 8, 11, 14] {- sequence + sequence -}
[1, 3 .. 9] - [1 .. 5] = [0 .. 4] {- sequence + sequence -}
[1, 3 .. 9] * [1 .. 5] = [1, 6, 15, 28, 45] {- sequence * sequence -}
[1, 6, 15, 28, 45] / [1 .. 5] = [1, 3 .. 9] {- sequence / sequence -}
{ [1 .. 5] + [6 .. 9] = [7, 9, 11, 13, 11] }.ifError { true } {- sequences must be of equal size, Sc/Lang extends this behaviour -}
[1 .. 5].squared = [1, 4, 9, 16, 25] {- unary math lifted to collection -}
[1, 4, 9, 16, 25].sqrt = [1 .. 5] {- unary math lifted to collection -}
(1 .. 3).asSet ++ (4 .. 7).asSet = (1 .. 7).asSet {- append -}
```

## Set -- collection type
```
system.includesPackage('Set') {- set package -}
Set().isSet {- set type predicate -}
Set().size = 0 {- count items in set -}
Set().isEmpty {- is set empty? -}
[1, 1, 2, 1, 2, 3].asSet.size = 3 {- array to set -}
[1, 3, 5, 3, 1].asSet.isSet = true
[1, 3, 5, 3, 1].asSet.size = 3
[1, 3, 5, 3, 1].asSet.includes(3) = true {- does set include item -}
[1, 3, 5, 3, 1].asSet.includes(7) = false
[1, 5, 3, 5, 1].asSet.asArray = [1, 5, 3] {- set from array to array -}
[1, 5, 3, 5, 1].asSet.sorted = [1, 3, 5] {- a sorted set is an array -}
let s = [1 .. 5].asSet; s ~~ s.asSet {- a Set formed from a Set is not identical to the initial set -}
let s = [1 .. 5].asSet; s = s.asSet {- a Set formed from a Set is equal to the initial set -}
let s = [1, 3, 5, 3, 1].asSet; s.remove(3) = 3; s.asArray = [1, 5] {- remove answers removed element -}
[1 .. 9].asSet.atRandom.betweenAnd(1, 9) {- inclusive -}
let s = Set(); s.add(5); s.includes(5) = true {- add element to Set -}
{ [5].asSet.add(5) }.ifError { true } {- add can only include elements if they do not already exist -}
let s = ['x', 5].asSet; let t = s.copy; t.include(5); s = t
let s = [1 .. 4].asSet; s.includes(s.atRandom) = true
let s = (1 .. 10).asSet; let t = s.collect { :each | (each >= 1).if { each } { 'no' } }; s = t
let s = (1 .. 10).asSet.collect { :each | (each >= 5).if { each } { 'no' } }; s = [5, 6, 7, 8, 9, 10, 'no'].asSet
let s = (1 .. 10).asSet; s.size = s.copy.size
let s = (1 .. 10).asSet; let t = s.copy; s.select { :each | t.includes(each).not }.isEmpty
let s = (1 .. 10).asSet; let t = s.copy; t.select { :each | s.includes(each).not }.isEmpty
let s = (1 .. 10).asSet; let t = s.copyWithout(3); s.size - 1 = t.size
let s = (1 .. 10).asSet; s.copyWithout(3).includes(3) = false
let s = (1 .. 10).asSet; let t = s.copyWithout(3); s.select { :each | t.includes(each).not } = [3].asSet
let s = (1 .. 5).asSet; let n = 0; s.do { :each | n := n + each }; n = 15
let s = [].asSet; s.addAll(['x', 'y', 'z']); s.size = 3 {- add all elements of an Array to a Set -}
let s = [].asSet; s.includeAll(['x', 'y', 'y', 'z', 'z', 'z']); s.size = 3 {- include all elements of an Array to a Set -}
let c = 'xyyzzz'.split; let r = Set(); r.includeAll(c); r.size = 3 {- include all characters of a String to a Set -}
let c = 'xyyzzz'; let r = Set(); r.includeAll(c); r.size = 3 {- include all elements of a String to a Set -}
let s = [].asSet; s.addAll([1 .. 99]); s.size = 99 {- add all from array -}
let s = ['x', 5].asSet; ['x', 5, 3].collect { :each | s.includes(each) } = [true, true, false]
let s = (1 .. 5).asSet; let n = 0; s.do { :each | n := n + each }; n = 15
let s = (1 .. 9).asSet; s.intersection(s) = s {- set intersection, self intersection is identity -}
(1 .. 4).asSet.intersection((5 .. 9).asSet) = [].asSet {- set intersection, empty intersection -}
(1 .. 5).asSet.intersection((4 .. 9).asSet) = [4, 5].asSet {- set intersection -}
let s = (1 .. 9).asSet; s.remove(5); [s.includes(5), s.includes(9)] = [false, true]
let s = (1 .. 9).asSet; let t = s.copy; let n = t.size; s.removeAll; [s.size = 0, t.size = n] = [true, true]
(1 .. 4).asSet.union((5 .. 9)) = (1 .. 9).asSet {- set union, right hand side not a set -}
let s = (1 .. 4).asSet; let t = (5 .. 9); let u = s.union(t); u.size = (s.size + t.size) {- set union is not mutating -}
(1 .. 5).asSet.ifAbsentAdd(3) = false
(1 .. 9).asSet.select { :each | false } = [].asSet {- select nothing -}
let s = Set(); s.includeAll([4 / 2, 4, 2]); s.size = 2 {- 4 / 2 = 2 -}
[1, 2, 3, 1, 4].asSet = [1, 2, 3, 4, 3, 2, 1].asSet = true
(1 .. 6).union((4 .. 10)) = (1 .. 10).asSet {- set union -}
'hello'.split.intersection('there'.split) = 'he'.split {- set intersection -}
'Smalltalk'.split.includes('k') = true
[1, 2, 3, 1, 4].asSet.isIndexable = false {- sets are not indexable -}
[1, 2, 3, 1, 4].asSet.indices = nil {- sets are not indexable -}
[1, 2, 2, 3, 3, 3].asSet.occurrencesOf(3) = 1 {- number of occurrences of element in set (zero or one) -}
[1, 3, 3, 3].asSet.occurrencesOf(2) = 0 {- number of occurrences of element in set (zero or one) -}
[5 4 6 7 8 9 10 11 3].asSet = (3 .. 11).asSet {- from array out of order array -}
let s = Set(); [5 4 6 7 8 9 10 11 3].do { :each | s.include(each) }; s = (3 .. 11).asSet {- out of order insertion -}
```

## SmallFloat -- numeric type
```
system.includesPackage('SmallFloat') {- package -}
3.141.typeOf = 'SmallFloat'
3.141.asSmallFloat == 3.141 {- asSmallFloat is identity, c.f. Fraction>>SmallFloat -}
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
3.isInteger {- three is an integer -}
-1.isInteger = true {- negative integers are integers -}
'x'.isInteger = false {- a string is not an integer -}
3 + 4 = 7
3 * 4 = 12
3 * 4 + 9 = 21
7.quotient(2) = 3 {- quotient, quo: & // in St -}
-9.quotient(4) = -2 {- quotient -}
-0.9.quotient(0.4) = -2 {- quotient -}
[7 // 2, -9 // 4, -0.9 // 0.4] = [3, -2, -2] {- quotient, operator -}
9.remainder(4) = 1 {- remainder, rem: & \\ in St -}
-9.remainder(4) = -1
0.9.remainder(0.5) = 0.4
0.9.remainder(0.4) ~ 0.1 {- approximately equal to -}
[9 \\ 4, -9 \\ 4, 0.9 \\ 0.5, 0.9 \\ 0.4] ~ [1, -1, 0.4, 0.1] {- remainder, operator -}
let total = 0; 9.timesRepeat { total := total + system.nextRandomFloat }; total < 7
3.max(7) = 7
3.max(7) = 7.max(3)
7.min(3) = 3
3.min(7) = 7.min(3)
12345.truncateTo(600) = 12000
13.betweenAnd(11, 14) = true {- is number between two numbers, inclusive -}
[1 .. 5].collect { :each | each.betweenAnd(2, 4) } = [false, true, true, true, false]
9.atRandom.isInteger = true {- random number between 1 and 9 -}
9.randomInteger.isInteger = true
9.randomFloat.isInteger = false
1.pi.randomFloat.isInteger = false
[3.141.json, 23.json] = ['3.141', '23'] {- numbers have json encodings -}
['3.141', '23'].collect(parseJson:/1) = [3.141, 23] {- parse json numbers -}
| r | 1.toDo(5) { :each | r := each }; r = 5
| r | 1.to(0).do { :each | r := each }; r = nil
1.toDo(0) { :each | 'toDo'.error }; true {- end less than start -}
'3.141'.parseNumber = 3.141
'23'.parseInteger(10) = 23 {- 20 + 3 -}
'-23'.parseInteger(10) = -23 {- can parse negative integers -}
'1001'.parseInteger(2) = 9 {- 8 + 0 + 0 + 1 -}
'10101'.parseInteger(2) = 21 {- 16 + 0 + 4 + 0 + 1 -}
'11'.parseInteger(16) = 17 {- 16 + 1 -}
'FF'.parseInteger(16) = 255 {- 240 + 15 -}
{ 'X'.parseInteger(16) }.ifError { true } {- signal an error if the parse fails -}
{ '3.141'.parseInteger(10) }.ifError { true } {- error if string is not an integer -}
'23'.parseDecimalInteger = 23 {- parse decimal integer -}
{ 'FF'.parseDecimalInteger }.ifError { true } {- error if string is not a decimal integer -}
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
eulersNumber() = 1.exp {- eulers number -}
1.e = eulersNumber() {- e is a constant, like 1.pi -}
smallFloatEpsilon() < (10 ^ -15) {- the difference between 1 and the smallest SmallFloat greater than 1 -}
smallFloatEpsilon() > (10 ^ -16)
1 - smallFloatEpsilon() ~= 1 {- epsilon() is the difference between 1.0 and previous representable value -}
1.epsilon ~= smallFloatEpsilon() {- epsilon is a constant, like 1.pi & e -}
1.pi = 3.141592653589793 {- 1.pi is a number -}
1.epsilon = 0.000000000000001 {- epsilon is a number -}
1.e = 2.718281828459045 {- e is a number -}
(1 - 1.epsilon).veryCloseTo(1)
Infinity.isFinite = false {- Infinity is not finite -}
NaN.isFinite = false {- NaN is not finite -}
inf.isFinite = false {- Infinity is not finite -}
1.pi.isFinite = true {- 1.pi is finite -}
{ nil.isFinite }.ifError { true } {- nil is not a number, so we cannot ask if it is finite -}
5.closeTo(5) = true
5.closeTo('5') = false
5.closeTo(3) = false
(5/3).closeTo(5/3) = true
(1/3).closeTo(0.3333) = true
(1/3).closeTo(0.333) = false
[-1000000000000000, -100, -5, -3, -2, -1, 0, 1].select(isPrime:/1).isEmpty
[17, 78901, 104729, 15485863, 2038074743].allSatisfy(isPrime:/1)
[561, 2821, 6601, 10585, 15841, 256, 29996224275831].noneSatisfy(isPrime:/1) {- no primes here -}
1.00001.reduce = 1 {- round if number is closeTo an integer -}
1.5.reduce = 1.5 {- identity if number is not closeTo an integer -}
let x = (2 ^ 54); x ~= (x - 1) = false {- large numbers behave strangely -}
let x = (2.0 ^ 54.0); x ~= (x - 1.0) = false {- large numbers behave strangely -}
[-1, 0, 1].collect(asString:/1) = ['-1', '0', '1']
inf.asString = 'inf' {- inf prints as inf -}
(0 - inf).asString = '(0 - inf)'
1.pi.printString = '3.141592653589793'
1.pi.storeString = '3.141592653589793'
23.isInteger {- is a small float an integer -}
23.isSmallInteger {- is a small float a small integer -}
(2 ^ 53) = 9007199254740992 {- a small float that is an integer that is beyond the range of small integers -}
(2 ^ 53).isInteger {- is a small float an integer -}
(2 ^ 53).isSmallInteger = false {- is a small float a small integer -}
23.assertIsSmallInteger = 23 {- require that a number be a small integer -}
{ 3.141.assertIsSmallInteger }.ifError { true } {- raise an error if value is not a small integer -}
{ (2 ^ 53).assertIsSmallInteger }.ifError { true }
100.factorial / 99.factorial ~ 100 {- small float factorial -}
let n = 9007199254740992; n + 0.1 = n {- ieee floating point -}
9007199254740990.0 + 10.1 = 9007199254741000.1 {- ieee floating point -}
(4 // 3) + (4 // 5) = 1 {- integer division -}
(4 / 3) + (4 / 5) = (32 / 15) {- floating point division -}
let n = 23453456; (n * n).sqrt = n {- floating point square and square root -}
2 ^ [0, 1, 3, 8] = [1, 2, 8, 256] {- number raised to array -}
-2 ^ [8, 7] = [256, -128] {- negative number raised to array -}
0 ^ [5, 0] = [0, 1] {- zero raised to array -}
[2.5, 1.5] ^ [2, 4] = [6.25, 5.0625] {- array raised to array -}
10 ^ [-1, -2] = [0.1, 0.01] {- raised to negative numbers -}
2 ^ [1.5, 2.4, 2.9, -2.2] = [2.82842712474619, 5.278031643091577, 7.464263932294459, 0.217637640824031] {- non integer exponents -}
2 ^ 100 = 1267650600228229401496703205376 {- ieee precision -}
(1 / 2).asString = '0.5' {- division prints as floating point -}
1.0 = 1 {- there is no distinct integer type -}
[1, 1.4, 1.49999, 1.5, 1.50000001].rounded = [1, 1, 1, 2, 2] {- rounding -}
[14 / 10, 44534 / 100].rounded = [1, 445] {- rounding -}
1.pi.sin.abs < 0.00000000001 {- sin of 1.pi is close to zero -}
(1.pi / 2).sin > 0.9999999999 {- sin of two 1.pi is close to one -}
0 = -0 {- zero is equal to negative zero -}
92233720368 * 100000000 + 54775807 = 9223372036854775807 {- reader for large small float integer literals -}
let n = 3.141; n.copy == n {- copy is identity -}
1.pi.in { :pi | pi } = 1.pi {- 1.pi is a constant, it can be shadowed -}
let pi = 23; pi = 23 {- 1.pi is a constant, it can be shadowed -}
1.pi.zero = 0 {- zero of same type, i.e. small float -}
1.pi.one = 1 {- one of same type, i.e. small float -}
```

## SmallFloat -- modulo
```
3 % 2 = 1
3 % 3 = 0
-3 % 2 ~= -1 {- ? -}
-3 % -2 = -1
3 % -2 ~= 1 {- ? -}
3 % 3 = 0
-3 % -3 = 0
3 % -3 = 0
```

## SortedArray -- collection type
```
system.includesPackage('SortedArray') {- sorted array package -}
SortedArray().isSortedArray {- sorted array -}
SortedArray().species = SortedArray:/0 {- species is sorted array -}
SortedArray().size = 0 {- query size -}
let a = SortedArray(); a.add(3); a.add(1); a.add(2); a.contents = [1 .. 3] {- add inserts items into sequence -}
let a = [3, 1].asSortedArray; a.add(2); a.contents = [1 .. 3] {- sorted array from array -}
let a = [7, 5 .. 1].asSortedArray; a.addAll([8, 6 .. 2]); a.contents = [1 .. 8] {- add all elements of collection into sequence -}
let a = [9 .. 1].asSortedArray; a.collect { :x | 9 - x }; a.contents = [1 .. 9] {- collect into ordered collection -}
let a = [1 .. 9].asSortedArray(>); a.contents = [9 .. 1] {- sorted array with specified sort block -}
let a = [1 .. 9].asSortedArray(greaterThan:/2); a.contents = [9 .. 1] {- with operator written out -}
let a = [5 .. 9].asSortedArray(>); a.addAll([1 .. 4]); a.contents = [9 .. 1]
let a = [5 .. 9].asSortedArray(greaterThan:/2); a.addAll([1 .. 4]); a.contents = [9 .. 1] {- with operator written out -}
(1 .. 10).asSortedArray.median = 5
let a = SortedArray(); a.add('truite'); a.add('porcinet'); a.add('carpe'); a.median = 'porcinet'
[5, 2, 50, -10].asSortedArray.asArray = [-10, 2, 5, 50]
'hello'.split.asSortedArray.asArray = 'ehllo'.split
```

## Stack -- collection type
```
system.includesPackage('Stack') {- stack package -}
Stack().typeOf = 'Stack' {- Stack is a type -}
Stack().isStack {- empty stack, stack predicate -}
Stack().isEmpty {- empty stack, empty predicate -}
Stack().size = 0 {- empty stack, size -}
let s = Stack(); s.push(1.pi); [s.size, s.top, s.size] = [1, 1.pi, 1] {- push element onto stack, inspect top of stack -}
let s = Stack(); s.push(1.pi); [s.size, s.pop, s.size] = [1, 1.pi, 0] {- push element onto stack, inspect top of stack -}
let s = Stack(); s.push('x'); s.push('y'); [s.size, s.pop, s.size, s.pop, s.size] = [2, 'y', 1, 'x', 0] {- push two elements, pop two elements -}
{ let s = Stack(); s.pop }.ifError { true } {- cannot pop from empty stack -}
let s = Stack(); s.push('x') = 'x' {- push answers object pushed -}
let s = Stack(); s.push('x'); s.copy = s & { s.copy ~~ s } {- copy is equal but not identical -}
```

## String -- text type
```
system.includesPackage('String') {- package -}
'quoted string'.isString {- quoted string -}
'string'.isAsciiString = true {- does string contain only ascii characters -}
'Mačiūnas'.isAsciiString = false {- ascii does not include diacritics -}
''.isAsciiString = true {- the empty string is an ascii string -}
128.asCharacter.string.isAsciiString = false {- not all byte arrays are ascii -}
'x' ++ 'y' = 'xy' {- append (catenation) -}
'x' ++ 1 = 'x1' {- append, right hand side need not be a string -}
'string'.asciiByteArray = [115, 116, 114, 105, 110, 103].asByteArray {- String to ByteArray of Ascii encoding -}
{ 'Mačiūnas'.asciiByteArray }.ifError { true } {- non-ascii characters -}
'3.4'.asNumber = 3.4 {- parse float -}
'3'.asInteger = 3 {- parse integer -}
'string'.at(4) = 'i'.asCharacter {- one-indexing -}
'string'[4] = 'i'.asCharacter {- one-indexing (bracket notation) -}
{ 'string'[7] }.ifError { true } {- error on out of range index -}
''.isEmpty = true {- empty string predicate -}
'string'.isEmpty = false {- is empty string -}
'string'.size = 6 {- length -}
['m', 'ss', 'ss', 'pp', ''].join = 'msssspp' {- join -}
['x', 1, 'y', 2, 'z', 3].join = 'x1y2z3' {- all items need not be strings -}
[1, 2, 3].join = '123' {- no items need be strings -}
[].join = '' {- join of empty sequence is the empty string -}
['m', 'ss', 'ss', 'pp', ''].joinSeparatedBy('i') = 'mississippi' {- join with separator -}
'mississippi'.splitBy('i') = ['m', 'ss', 'ss', 'pp', ''] {- split at string -}
'Ma.rch'.splitBy('.') = ['Ma', 'rch'] {- split by dot -}
'str ing'.splitBy(' ') = ['str', 'ing'] {- split at char -}
'a b=2'.splitBy(' ').collect { :e | e.splitBy('=') }[2][2] = '2' {- split as parser -}
'string'.splitBy('ing') = ['str', '']
'string'.splitBy('trin') = ['s', 'g']
'string'.splitBy('absent') = ['string']
'string'.splitBy('') = ['s', 't', 'r', 'i', 'n', 'g']
'Set-Of-Three-Words'.splitByLimitedTo('-', 3) = ['Set', 'Of', 'Three'] {- limited to count number of elements -}
'mississippi'.split.join = 'mississippi' {- join is the inverse of split -}
'mississippi'.splitBy('i').joinSeparatedBy('i') = 'mississippi' {- joinSeparatedBy is the inverse of splitBy -}
'/usr/local/bin'.splitBy('/') = ['', 'usr', 'local', 'bin']
'Terse Guide.help.sl'.splitBy('.') = ['Terse Guide', 'help', 'sl']
'a' < 'b' = true {- string comparison -}
'text'.copyFromTo(2, 3) = 'ex' {- substring, one indexed, inclusive -}
'text'.copyFromTo(3, 3) = 'x' {- substring (single character) -}
{ 'string'.add('!') }.ifError { :err | 'oh oh...' } = 'oh oh...' {- strings are immutable -}
'quoted string with \'escaped\' quote characters'.words[4].copyFromTo(2, 8) = 'escaped'
'string'.utf8ByteArray = 'string'.asciiByteArray {- Utf-8 is a superset of ascii -}
'øéஃî'.utf8ByteArray = [195, 184, 195, 169, 224, 174, 131, 195, 174].asByteArray {- unicode -}
'Mačiūnas'.utf8ByteArray = [77, 97, 196, 141, 105, 197, 171, 110, 97, 115].asByteArray {- Utf-8 encoding -}
'Mačiūnas'.size = 8
'Mačiūnas'.utf8ByteArray.size = 10
'Mačiūnas'.utf16Array = [77, 97, 269, 105, 363, 110, 97, 115] {- Utf-16 encoding -}
'Mačiūnas'.utf16Array.size = 8
'string'.allButFirst = 'tring' {- all but first character of a String -}
'string'.allButFirst(4) = 'ng' {- all but first n characters of a String -}
''.typeOf = 'String' {- type of String -}
''.size = 0 {- the empty String has size zero -}
'x'.asString = 'x' {- asString at String is identity -}
'x'.asString.size = 1
'x'.printString.size = 3 {- printString is a quoted string -}
1.asString = '1' {- integer as string -}
1.pi.asString = '3.141592653589793' {- float as string -}
'ascii'.asciiByteArray = [97, 115, 99, 105, 105].asByteArray
'€'.utf8ByteArray = [226, 130, 172].asByteArray {- Utf-8 encoding of String as ByteArray -}
[226, 130, 172].asByteArray.utf8String = '€' {- String from Utf-8 encoded ByteArray -}
'€'.utf8ByteArray.utf8String = '€' {- decode and encode Utf-8 -}
'ascii'.asciiByteArray = 'ascii'.utf8ByteArray
'ascii'.asciiByteArray.asciiString = 'ascii' {- decode and encode Ascii -}
{ '€'.ascii }.ifError { true }
'the quick brown fox jumps'.includesSubstring('') = true
'the quick brown fox jumps'.includesSubstring('fox') = true
'the quick brown fox jumps'.includesSubstring('fix') = false
'the quick brown fox jumps'.findString('fox') = 17 {- index of sub-string -}
'the quick brown fox jumps'.findString('rat') = 0 {- index of sub-string, zero indicates absence -}
'the quick brown fox jumps'.findStringStartingAt('fox', 1) = 17
'Smalltalk'.findLastOccurrenceOfStringStartingAt('al', 1) = 7
'Smalltalk'.findLastOccurrenceOfStringStartingAt('al', 9) = 0
'aaa'.findLastOccurrenceOfStringStartingAt('aa', 1) = 2
'Smalltalk'.findPreviousOccurrenceOfStringStartingAt('al', 9) = 7
'Smalltalk'.findPreviousOccurrenceOfStringStartingAt('al', 7 - 1) = 3
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
`'x'` = '\'x\'' {- backtick quotes quoting single quote -}
`"x"` = '"x"' {- backtick quotes quoting double quote -}
`x'""'y` = 'x\'""\'y'.parseBacktickQuotedString
"'x'" = '\'x\'' {- double quotes quoting single quote -}
'"'.first.codePoint = 34 {- double quote code point -}
"'".first.codePoint = 39 {- single quote code point -}
'`'.first.codePoint = 96 {- back tick quote code point -}
'"quoted"'.withoutQuoting = 'quoted' {- remove double quotes -}
"'quoted'".withoutQuoting = 'quoted' {- remove single quotes -}
'`quoted`'.withoutQuoting = 'quoted' {- remove backtick quotes -}
"`x`" = '`x`' {- double quotes quoting backtick quote -}
"'x'" = '\'x\''.parseDoubleQuotedString
'string'[3] = 'r'.asCharacter {- string indexing -}
{ 'string'[3] := nil }.ifError { true } {- strings are immutable -}
'{"x": 3.141, "y": 23}'.parseJson = (x: 3.141, y: 23)
{ '_'.parseJson }.ifError { true }
'a text string'.json = '"a text string"' {- json encoding of string -}
'"a text string"'.parseJson = 'a text string' {- parse json string -}
'string'.first = 's'.asCharacter {- first character -}
'element'.first.isVowel = true {- is first letter a vowel? -}
'string'.last = 'g'.asCharacter {- last character -}
let x = ['a', 'bc', 'def']; x.unlines.lines = x
'a short string'.replaceString('short', 'longer') = 'a longer string' {- replace substring -}
'x x x'.replaceString('x', 'y') = 'y x x' {- replace first occurence of one string with another -}
{ 'x x x'.replaceString('x', 1) }.ifError { true } {- replacement must be a string -}
'x x x'.replaceStringAll('x', 'y') = 'y y y' {- replace all occurences of one string with another -}
{ 'x x x'.replaceStringAll('x', 1) }.ifError { true } {- replacement must be a string -}
'A Bc Def'.replaceStringAll(' ', '') = 'ABcDef' {- replacement string may be empty -}
'A-B-C'.replaceStringAll('-', '/') = 'A/B/C' {- replace hypens with forward slashes -}
'anAnalogueClock'.camelCaseToWords = 'an Analogue Clock' {- camel case begins with a lower case letter -}
'AnalogueClock'.pascalCaseToWords = 'Analogue Clock' {- pascal case begins with an upper case letter -}
'an analogue Clock'.words.pascalCase.join = 'AnAnalogueClock'
'analogue clock'.words.camelCase.join = 'analogueClock'
'Word'.asLowercase = 'word'
'12345'.asLowercase = '12345' {- only if letters -}
'Word'.asUppercase = 'WORD'
'12345'.asUppercase = '12345' {- only if letters -}
'x' ~= 'X' & { 'x'.sameAs('X') & { 'x'.sameAs('x') } } {- considered without case -}
'word'.capitalized = 'Word' {- uppercase first letter only -}
'anotherWord'.capitalized = 'AnotherWord' {- uppercase first letter only, do not lower case interior letters -}
'12345'.capitalized = '12345' {- only if a letter -}
'testAt'.beginsWith('test') = true {- does string begin with substring -}
'testAt'.beginsWith('At') = false {- does string begin with substring -}
{ 'testAt'.beginsWith(nil) }.ifError { true }
'testAt'.endsWith('test') = false {- does string end with substring -}
'testAt'.endsWith('At') = true
'testAt'.endsWith('at') = false {- case sensitive -}
{ 'testAt'.endsWith(nil) }.ifError { true }
'sndfile.wav'.endsWith('.wav') = true
['a','b','','c'].unlines.paragraphs.collect(lines:/1) = [['a', 'b'], ['c']]
'string'.at(3) = 'r'.asCharacter {- string indexing -}
let s = 'string'; [s[2], s[4], s[5]].join = 'tin' {- string subscripting -}
' x '.withBlanksTrimmed = 'x'
' x '.withoutLeadingBlanks = 'x '
' x '.withoutTrailingBlanks = ' x'
let a = []; 'string'.do { :each | a.add(each) }; a.join = 'string'
'string'.stringArray.join = 'string'
let a = 'string'.characterArray; a.joinCharacters = 'string' & { a.join = 'string' }
'𠮷'.countCharacters = 1
'𠮷'.countUtf16CodeUnits = 2
'𠮷'.size = 2
'𠮷'.isSingleCharacter = true
'𠮷'.characterArray = ['𠮷'.asCharacter]
'𠮷'.codePointAt(1) = 134071 {- code point at index -}
'𠮷'.codePointAt(2) = 57271
'𠮷'.codePointAt(3) = nil {- nil for out of range indices -}
'𠮷'.codePointArray = [134071]
'𠮷'.isInBasicMultilingualPlane = false
'𠮷'.isWellFormed = true
{ '𠮷'.asciiByteArray }.ifError { true } {- non-ascii character -}
'𠮷'[1] = '𠮷'.asCharacter
{ '𠮷'[2] }.ifError { true } {- lone surrogate -}
'0123456789'.isAllDigits
'1'.isAllDigits
''.isAllDigits = true {- the empty string answers true -}
'01234 56789'.isAllDigits = false {- spaces answer false -}
'x'.asciiValue = 120 {- ascii code point of string -}
{ 'xy'.asciiValue }.ifError { true } {- it is an error is the string is not a single character -}
{ '𠮷'.asciiValue }.ifError { true } {- it is an error is the character is not ascii -}
'string'.stringArray = ['s', 't', 'r', 'i', 'n', 'g']
'string'.characterArray = [115, 116, 114, 105, 110, 103].collect(asCharacter:/1)
'Gnu/Linux'.findString('Linux') = 5
'Gnu/Linux'.findStringStartingAt('Linux', 1) = 5
'Hello'.isEmpty = false
'XYZ'.asLowercase = 'xyz'
'xyz'.asUppercase = 'XYZ'
'hilaire'.capitalized = 'Hilaire'
'1.54'.asNumber = 1.54 {- parse floating point number -}
'154'.asNumber = 154 {- parse integral number -}
'A clear but rather long-winded summary'.contractTo(19) = 'A clear ... summary' {- contract string to be of size -}
'antidisestablishmentarianism'.contractTo(10) = 'anti...ism' {- contract string to be of size -}
'string'.asArray.sort.join = 'ginrst'
'x' ~= 'x'.asCharacter {- a single element string is not equal to a character -}
'Mačiūnas'.asAscii = 'Mainas' {- transform to ascii by deleting non-ascii characters -}
'string'.copy == 'string' {- copy is identity -}
'string'.asHex = '737472696e67' {- hex string of ascii codes of string -}
let s = 'string'; (s.size * 2) = s.asHex.size {- asHex, hex string is twice as long -}
{ 'Mačiūnas'.asHex }.ifError { true } {- asHex, non-ascii strings raise an error -}
'"'.asCharacter.codePoint = 34 {- double quote -}
'\''.asCharacter.codePoint = 39 {- single quote -}
'\\'.asCharacter.codePoint = 92 {- backslash (escape) -}
'`'.asCharacter.codePoint = 96 {- backtick -}
'\b'.asCharacter.codePoint = 8 {- backspace -}
'\t'.asCharacter.codePoint = 9 {- horizontal tab -}
'\n'.asCharacter.codePoint = 10 {- line feed, new line -}
'\v'.asCharacter.codePoint = 11 {- vertical tab -}
'\f'.asCharacter.codePoint = 12 {- form feed, new page -}
'\r'.asCharacter.codePoint = 13 {- carriage return -}
'The quick brown fox jumps over the lazy dog'.crc16 = 16rFCDF {- 16 bit cyclic redundancy check, crc-16/arc -}
'* + - / ^ ? ~ = < >'.words.allSatisfy(isOperatorName:/1)
'a comment'.asBracketedComment('/*', '*/') = '/* a comment */' {- add C comment brackets -}
'a comment'.asMlComment = '(* a comment *)' {- add Ml comment brackets -}
'a comment'.asHsComment = '{- a comment -}' {- add Hs comment brackets -}
{ '(* a comment *)'.asMlComment }.ifError { true } {- it is an error if there are existing brackets -}
{ '{- a comment -}'.asHsComment }.ifError { true } {- it is an error if there are existing brackets -}
'before and {- a comment -} then after'.firstBracketedComment('{-', '-}') = ' a comment '
'before and (* a comment *) then after'.firstMlComment = ' a comment '
'before and {- a comment -} then after'.firstHsComment = ' a comment '
'no comment'.firstMlCommentIfAbsent { true }
'Array'.withIndefiniteArticle = 'an Array' {- prepend indefinite article to, presumably, a noun or noun phrase -}
'Map'.withIndefiniteArticle = 'a Map' {- the article depends on the first letter of the noun -}
'A short sentence of six words'.whiteSpaceDelimitedWordAtIndex(23) = 'six' {- get word looking backwards and forwards from index for a space character -}
```

## Syntax -- array assignment syntax
```
let [x, y, z] = [1, 2, 3]; [z, y, x] = [3, 2, 1] {- temporaries array initialisation syntax -}
let [x, y, z] = [1 * 2, 3 * 4, 5 * 6]; [z, y, x] = [30, 12, 2] {- temporaries array initialisation syntax -}
let [x, y, z] = [1, 2, 3]; [z, y, x] = [3, 2, 1] {- temporaries let array initialisation syntax -}
{ let [x, y] = [1, 2, 3]; false }.ifError { true } {- it is an error if the array is of the incorrect size -}
| x y z | [x, y, z] := [1, 2, 3]; [z, y, x] = [3, 2, 1] {- variables array assignment syntax -}
| x y z | [x, y, z] := [1 * 2, 3 * 4, 5 * 6]; [z, y, x] = [30, 12, 2] {- variables array assignment syntax -}
let x = 1; let y = 2; x := y + 1; y := x * 2; [x, y] = [3, 6] {- in sequential assignment evaluation and assignment are interleaved -}
let [x, y] = [1, 2]; [x, y] := [y + 1, x * 2]; [x, y] = [3, 2] {- in array assignment the rhs expression is evaluated before any assignments -}
let x = 1; let y = 2; let xTmp = nil; xTmp := y + 1; y := x * 2; x := xTmp; [x, y] = [3, 2]
let [x, y, z] = [1, 2, 3]; [x, y, z] := [x * y + z, x + y * z, x + y + z]; [x, y, z] = [5, 9, 6]
let x = 1; let y = 2; let z = 3; let x1 = nil; let y1 = nil; let z1 = nil; x1 := x * y + z; y1 := x + y * z; z1 := x + y + z; x := x1; y := y1; z := z1; [x, y, z] = [5, 9, 6]
let x = 1; let y = 2; let z = 3; x := x * y + z; y := x + y * z; z := x + y + z; [x, y, z] = [5, 21, 29]
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
[1 .. 3] = (1 .. 3).asArray
[3 .. 1] = (3 .. 1).asArray
[1, 3 .. 9] = (1, 3 .. 9).asArray
[9, 7 .. 1] = (9, 7 .. 1).asArray
[1 .. 1] = (1 .. 1).asArray
```

## Syntax - vector and matrix syntax
```
[1 3 5 2 4] = [1, 3, 5, 2, 4] {- vector syntax, literal items -}
[9.sqrt 16.sqrt 25.sqrt] = [3, 4, 5] {- vector syntax, simple unary sends -}
let a = 1; let b = 3; let c = 5; [a b c b a] = [1, 3, 5, 3, 1] {- vector syntax, identifier items -}
[1 [1 3 [1 3 5] 5] 5] = [1, [1, 3, [1, 3, 5], 5], 5] {- vector syntax, vector items -}
[1 3; 5 7] = [[1, 3], [5, 7]] {- matrix syntax, literal items -}
let a = 1; let b = 3; let c = 5; [a b c; c b a] = [[1, 3, 5], [5, 3, 1]] {- matrix syntax, identifier items -}
[[], [1], [2 3], [4 5 6]] = [[], [1], [2, 3], [4, 5, 6]] {- non-square matrix, there is no syntax for an empty vector field -}
[[1 2; 3 4] [5 6; 7 8]] = [[[1, 2], [3, 4]], [[5, 6], [7, 8]]] {- vector syntax, matrix items -}
let a = 1; let b = 3; [[a b; b a] [b a; a b]] = [[[1, 3], [3, 1]], [[3, 1], [1, 3]]] {- volume syntax, identifier items -}
[[1 0 0; 0 1 0; 0 0 1] [0 1 0; 1 0 1; 0 1 0] [1 0 1; 0 1 0; 1 0 1]].collect(sum:/1) = [1 1 1; 1 2 1; 2 1 2] {- volume to matrix -}
[[1 0 0; 0 1 0; 0 0 1] [0 1 0; 1 0 1; 0 1 0]].transposed = [[1 0 0; 0 1 0] [0 1 0; 1 0 1] [0 0 1; 0 1 0]] {- transposedd -}
[1 2 3; 4 5 6][2][3] = 6 {- matrix indexing -}
[1 2 3; 4 5 6].atPath([2]) = [4 5 6] {- matrix indexing; atPath, single index -}
[1 2 3; 4 5 6].atPath([2, 3]) = 6 {- matrix indexing; atPath, two indices -}
{ [1 2 3; 4 5 6].atPath([]) }.ifError { true } {- matrix indexing; atPath, empty indices is an error -}
[1 2 3; 4 5 6] @> [2 3] = 6 {- matrix indexing; atPath operator -}
let m = [1 2 3; 4 5 6; 7 8 9]; m @> [2 3] = 6 & { m @> [3 2] = 8 } {- matrix syntax and atPath operator -}
[1 -1 -4 -8 -13 -19 -26 -34 -43].size = 9 {- negative integer literals -}
[1 - 1 - 4 - 8 - 13 - 19 - 26 - 34 - 43] = [-147] {- subtraction -}
```

## Syntax - At Syntax
```
let m = [1 2 3; 4 5 6; 7 8 9]; m[2, 3] = 6 & { m[3, 2] = 8 } {- [At Syntax] -}
let d = (w: (x: (y: (z: 1)))); d['w', 'x', 'y', 'z'] = 1 {- [At Syntax] -}
let a = [['w', 'x'], ['y', 'z']]; a[1, 2] = 'x' {- [At Syntax] -}
(x: (y: 1))['x', 'y'] = 1 {- [At Syntax] -}
(x: (y: (z: 1)))['x', 'y', 'z'] = 1 {- [At Syntax] -}
(w: (x: (y: (z: 1))))['w', 'x', 'y', 'z'] = 1 {- [At Syntax] -}
```

## AtPut Syntax
```
let m = [1 2 3; 4 5 6]; m[1, 2] := -2; m[2, 3] := -6; m = [1 -2 3; 4 5 -6] {- [AtPut Syntax] -}
let d = (w: (x: (y: (z: 1)))); d['w', 'x', 'y', 'z'] := -1; d = (w: (x: (y: (z: -1)))) {- [AtPut Syntax] -}
```

## Syntax -- collection access and mutation
```
'text'[3] = 'x'.asCharacter {- [At Syntax] -}
let x = [1 .. 5]; x[3] := '3'; x[3] = '3' {- [AtPut Syntax] -}
let d = (x: 1); d::x = 1 {- [Quoted At Syntax] -}
let d = (x: 1, y: 2); d::x < d::y {- [Quoted At Syntax] -}
let d = (w: (x: (y: (z: 1)))); d::w::x::y::z = 1 {- [Quoted At Syntax] -}
let d = (w: (x: (y: (z: 1)))); d::w::x::y::z := -1; d = (w: (x: (y: (z: -1)))) {- [Quoted AtPut Syntax] -}
```

## Syntax -- dictionary assignment syntax
```
let (x, y) = (x: 1, y: 2); x = 1 & { y = 2 } {- variable declaration, retrieve named fields from the dictionary -}
let (y, x) = (x: 1, y: 2); y = 2 & { x = 1 } {- selection is by name, not position -}
let (x, y, z) = (x: 1 * 2, y: 3 * 4, z: 5 * 6); [z, y, x] = [30, 12, 2]
| x y | (x, y) := (x: 1, y: 2); x = 1 & { y = 2 } {- variable assignment, retrieve named fields from the dictionary -}
| y x | (y, x) := (x: 1, y: 2); y = 2 & { x = 1 } {- selection is by name, not position -}
| x y z | (x, y, z) := (x: 1 * 2, y: 3 * 4, z: 5 * 6); [z, y, x] = [30, 12, 2]
```

## Syntax -- dictionary literals
```
().isRecord {- () is the empty dictionary -}
() = [].asRecord {- () the empty dictionary -}
(x: 1, y: 2) = ['x' -> 1, 'y' -> 2].asRecord {- dictionary literal syntax -}
(x: 1, y: 2).printString = '(x: 1, y: 2)' {- Record print string -}
(x: 1, y: 2).storeString = '(x: 1, y: 2)' {- Record print string -}
```

## Syntax -- integer literals syntax
```
23.isInteger {- decimal integer literal -}
2r10111 = 23 {- binary (base 2) integer literal -}
8r27 = 23 {- octal (base 8) integer literal -}
10r23 = 23 {- decimal (base 10) integer literal -}
16r17 = 23 {- hexadecimal (base 16) integer literal -}
-23.isInteger {- negative decimal integer literal -}
-2r10111 = -23 {- negative binary (base 2) integer literal -}
-8r27 = -23 {- negative octal (base 8) integer literal -}
-10r23 = -23 {- negative decimal (base 10) integer literal -}
-16r17 = -23 {- negative hexadecimal (base 16) integer literal -}
[2r10111, 8r27, 10r23, 16r17] = [23, 23, 23, 23] {- twenty three -}
[-2r10111, -8r27, -10r23, -16r17] = [-23, -23, -23, -23] {- negative twenty three -}
9r55 = 50 {- radices other than 2, 8 10 and 16 may raise errors -}
[2r11111111, 8r377, 10r255, 16rff] = [255, 255, 255, 255] {- letters may be lower case -}
16rABCDEF = 10r11259375 {- letters may be uppercase -}
36rZZ = 1295 {- the maximum radix is 36, since each places is either a digit (10) or a letter (26) -}
[2r101011001, 8r531, 10r345, 16r159] = [345, 345, 345, 345]
{ 2r2 }.ifError { true } {- it is an error if the post-radix text includes out of range characters -}
2r1111111111111111 = (2 ^ 16 - 1) {- 16 bits -}
2r111111111111111111111111 = (2 ^ 24 - 1) {- 24 bits -}
2r11111111111111111111111111111111 = (2 ^ 32 - 1) {- 32 bits -}
```

## Syntax -- interval & array syntax
```
(1 .. 9) = Interval(1, 9, 1) {- 1 to 9 by 1 -}
(1 .. 9) = Interval(1, 9, 1) {- 1 to 9 by 1 -}
(9 .. 1) = Interval(9, 1, -1) {- 9 to 1 by -1 -}
(1, 3 .. 9) = Interval(1, 9, 2) {- 1 to 9 by 2 -}
(9, 7 .. 1) = Interval(9, 1, -2) {- 9 to 1 by -2 -}
[1 .. 9] = (1 .. 9).asArray {- 1 to 9 by 1 -}
[9 .. 1] = (9 .. 1).asArray {- 9 to 1 by -1 -}
[1, 3 .. 9] = (1, 3 .. 9).asArray {- 1 to 9 by 1 -}
[9, 7 .. 1] = (9, 7 .. 1).asArray {- 9 to 1 by -2 -}
```

## Syntax -- block application
```
{ } . () = nil {- apply no argument block -}
{ :n | n * n } . (23) = 529 {- apply one argument block -}
{ :p :q | p ++ q } . ('x', 'y') = 'xy' {- apply one argument block -}
```

## Syntax -- temporaries
```
| x | x = nil {- temporary syntax (nil initializer) -}
let x = 1; x = 1 {- temporary syntax (with initialiser) -}
| x y | x = nil & { y = nil } {- temporary syntax (no initializers) -}
let x = 1; let y = 1; x = 1 & { y = 1 } {- temporary syntax (with initialisers) -}
| x y | x = nil & { y = nil } {- let x, y; => | x y | -}
let x = 1; let y = 2; [x, y] = [1, 2] {- let x = i, y = i; => | x = i, y = j; -}
let x = 1; let y = 2; let z = 3; [x, y, z] = [1, 2, 3] {- there can be multiple let (with initializer) sequences -}
```

## Syntax -- trailing blocks
```
1.to(9).collect { :x | x * x }.last = 81
(1 .. 9).collect { :x | x * x }.last = 81
(1 .. 9).collect { :x | x * x }.collect { :x | x * x }.last = 6561
[1, 3, 5].withCollect([1, 3, 5]) { :p :q | p -> q } = [1 -> 1, 3 -> 3, 5 -> 5]
[1, 3, 5].reversed.withCollect([1, 3, 5]) { :p :q | p -> q } = [5 -> 1, 3 -> 3, 1 -> 5]
```

## Syntax -- type field mutation
```
let a = 'one' -> 1; a.key := 9; a.key = 9 {- p.x := y is syntax for p.x(y) -}
```

## Syntax -- unused variable name syntax
```
(1 .. 3).collect { :_ | 0 } = [0, 0, 0] {- underscore can be used to indicate an unused variable -}
let [x, _, z] = [1, 2, 3]; [x, z] = [1, 3]
(1 .. 3).withIndexCollect { :_ :_ | 0 } = [0, 0, 0] {- multiple unused variables can be declared -}
let [x, _, _, z] = [1, 2, 3, 4]; [x, z] = [1, 4] {- multiple unused variables can be declared -}
```

## Syntax -- whitespace
```
{:x|x+1}.value(1)=2 {- no white space -}
{ :x | x + 1 } . value ( 1 ) = 2 {- white space (space) -}
{	:x	|	x	+	1	}	.	value	(	1	)	=	2 {- white space (tab) -}
```

## System -- system type
```
system.includesPackage('System') {- package -}
system.typeOf = 'System' {- system type -}
system.isSystem {- system predicate -}
system.typeDictionary.indices.includes('System') = true
system.nextRandomFloat < 1 {- system random number generator -}
system.uniqueId.isInteger {- system unique identifier generator, answers are integers -}
system.uniqueId ~= system.uniqueId {- system unique identifier generator -}
let p = system.uniqueId; let q = system.uniqueId; p + 1 = q {- the generator is a simple counter -}
system.highBitPerByteTable.size = 256 {- high bits per byte table -}
system.highBitPerByteTable.asBag.sortedCounts = [128 -> 8, 64 -> 7, 32 -> 6, 16 -> 5, 8 -> 4, 4 -> 3, 2 -> 2, 1 -> 1, 1 -> 0]
system.lowBitPerByteTable.size = 255 {- low bits per byte table -}
system.lowBitPerByteTable.asBag.sortedCounts = [128 -> 1, 64 -> 2, 32 -> 3, 16 -> 4, 8 -> 5, 4 -> 6, 2 -> 7, 1 -> 8]
```

## System -- system names
```
'!'.isOperatorName = true {- operator name predicate -}
'*'.operatorMethodName = 'times' {- operator name -}
['~', '!', '@', '#', '$','%'].collect(operatorMethodName:/1) = ['tilde', 'bang', 'commercialAt', 'hash', 'dollar', 'modulo']
['^', '&', '*', '-', '+', '='].collect(operatorMethodName:/1) = ['raisedTo', 'and', 'times', 'minus', 'plus', 'equals']
['?', '<', '>'].collect(operatorMethodName:/1) = ['query', 'lessThan', 'greaterThan']
'!^'.operatorMethodName = 'bangRaisedTo' {- composite operator names capitalize non-initial names -}
'~='.operatorMethodName = 'tildeEquals'
system.operatorCharacterNameTable['^'] = 'raisedTo' {- table of operator names -}
'+ ++ * / - %'.words.collect { :each | system.operatorNameTable[each] } = 'plus plusPlus times dividedBy minus modulo'.words
```

## System -- cache
```
system.cache.isMap {- cache is a map from string keys to cached values -}
let f = { system.cached('aUniqueKey') { 1.randomFloat } }; f() = f() & { f() = system.cache::aUniqueKey }
let f = { { 1.randomFloat }.once(system, 'anotherUniqueKey') }; f() = f() & { f() = system.cache::anotherUniqueKey }
```

## System -- categoryDictionary
```
system.includesPackage('CategoryDictionary') {- category dictionary package -}
system.categoryDictionary.typeOf = 'CategoryDictionary' {- type of category dictionary -}
system.categoryDictionary.isCategoryDictionary = true {- category dictionary predicate -}
system.categoryDictionary.isCategoryName('method', 'accessing') = true
system.categoryDictionary.isCategoryName('accessing') = true
system.categoryDictionary.category('method', 'accessing').isSet = true
system.categoryDictionary.categoriesOf('method', 'at').includes('accessing') = true
system.categoryDictionary.categoriesOf('at').includes('accessing') = true
system.categoryDictionary.categoriesOf('method', 'notInCategorySystem') = []
system.categoryDictionary.categoriesOf('notInCategorySystem') = []
system.categoryDictionary.isCategorized('method', 'at') = true
system.categoryDictionary.isCategorized('at') = true
system.categoryDictionary.isCategorized('method', 'notInCategorySystem') = false
system.categoryDictionary.isCategorized('notInCategorySystem') = false
'Collection-Unordered'.categoryNameParts = ['Collection', 'Unordered']
system.categoryDictionary.categoryOf('method', 'at') = 'accessing'
system.categoryDictionary.categoryOf('at') = 'accessing'
system.categoryDictionary.categoryOf('method', 'notInCategorySystem') = '*Uncategorized*'
system.categoryDictionary.categoryOf('notInCategorySystem') = '*Uncategorized*'
system.categoryDictionary.categorizeAll('type', 'NameOfMajorCategory-NameOfMinorCategory', ['NameOfType']); true
system.categoryDictionary.categorizeAll('method', 'name of category', ['nameOfMethod']); true
system.categoryDictionary.multiplyCategorized('method').isEmpty {- the set of topics with multiple categories in a domain -}
```

## System -- evaluate
```
system.evaluate('3 + 4') = 7 {- evaluate a string -}
system.evaluateNotifying('7.notAMethod') { :err | err.postLine; true } {- provide a block to receiver error notifications -}
system.evaluateNotifying('a syntax error') { :err | err.postLine; true } {- syntax errors likewise -}
system.evaluateNotifying('') { :err | err.postLine; true } {- empty input likewise -}
```

## System -- globalDictionary
```
system.isIndexable {- system is indexable -}
system.globalDictionary.isDictionary {- the system global dicitionary is a dictionary -}
system.globalDictionary.isRecord {- specifically, it is a record -}
{ system::undefined }.ifError { true } {- system implements the indexable trait, unknown indices (keys) raise errors -}
system::TwoPi := 2.pi; system::TwoPi / 2 = 1.pi {- declare and then access a global variable -}
system.indices.includes('TwoPi') {- system is indexable -}
system.indexOf(2.pi) = 'TwoPi' {- system is indexable -}
```

## System -- methodDictionary
```
system.methodDictionary.isDictionary = true
system.methodDictionary::collect.isDictionary = true
system.methodDictionary::collect[2].isDictionary = true
system.methodDictionary::collect[2]::Array.isMethod = true
system.methodDictionary::collect[2]::Array.information.isMethodInformation = true
system.methodDictionary.includesIndex('collect') = true
system.allMethods.collect { :each | each.signature }.includes('@Iterable>>do:/2') = true
'@Iterable>>do:/2'.parseMethodSignature = ['@Iterable', 'do:/2']
'@Collection'.parseQualifiedTraitName = 'Collection'
system.methodLookupAtType('collect', 2, 'Array').isMethod = true
let m = system.methodLookupAtType('plus', 2, 'SmallFloat'); m.operatorNameOrQualifiedName = '+'
system.methodImplementations('sum').collect { :each | each.origin.name }.includes('Interval') = true
system.methodSignatures('add').includes('Map>>add:/2') = true
system.methodLookupAtSignature('@Iterable>>sum:/1').isMethod = true
system.methodLookupAtType('sum', 1, 'Array').sourceCode = '{ :self |\n\t\tself.reduce(+)\n\t}'
system.methodTypes('last:/1').includes('Interval') = true
system.multipleArityMethodList.includes('randomFloat') = true
system.onlyZeroArityMethodList.includes('PriorityQueue') = true
system.operatorNameTable['^'] = 'raisedTo' = true
system.doesTraitImplementMethod('Collection', 'select') = true
system.doesTypeImplementMethod('Array', 'species') = true
[1, 2, 3].respondsTo(select:/2) = true {- does a value (courtesy the type) implement a method -}
system.methodPrintString('add').size >= 3
system.methodLookupAtType('collect', 2, 'Array').isMethod = true
system.methodLookupAtType('collect', 2, 'Array').origin.name = 'Arrayed'
system.methodLookupAtType('collect', 2, 'Array').block.value([3, 4, 5], { :x | x * x }) = collect([3, 4, 5], { :x | x * x })
system.methodLookupAtType('sum', 1, 'Array') == system.methodLookupAtType('sum', 1, 'Set')
'sum:/1'.parseQualifiedMethodName = ['sum', 1]
```

## System -- packageDictionary
```
system.packageDictionary.isDictionary = true
system.packageDictionary.isEmpty = false
let t = system.packageTypes('Complex'); t.size = 1 & { t[1].name = 'Complex' }
let t = system.packageTraits('Tuple'); t.size = 1 & { t[1].name = 'Tuple' }
system.packageMethods('Frequency').detect { :each | each.name = 'asHertz' }.arity = 1
```

## System -- time
```
system.systemTimeInMilliseconds > 0 = true
system.unixTimeInMilliseconds > 1671935015392 = true
let t1 = system.unixTimeInMilliseconds; let t2 = system.unixTimeInMilliseconds; t2 - t1 = 0
let t = { 3579.nthPrime }.millisecondsToRun; t >= 0 & { t < 1000 }
let [c, t] = { system.unixTimeInMilliseconds }.benchForMilliseconds(10); c > 1000 & { t >= 10 }
```

## System -- traitDictionary
```
system.traitDictionary.isDictionary = true
system.traitDictionary.includesIndex('Collection') = true
system.traitTypes('Collection').includes('Array') = true
system.typeTraits('Array').includes('Arrayed') = true
system.methodTraits('atRandom:/1').includesAllOf(['Collection', 'Sequenceable']) = true
system.methodTraits('sum:/1') = ['Iterable']
system.traitTypes('Object').includes('SmallFloat') = true
system.traitLookup('Object').methodDictionary.includesIndex('respondsTo:/2') = true
system.traitLookup('Collection').isTrait = true
system.traitLookup('Collection').name = 'Collection'
system.traitLookup('Iterable').methodDictionary.includesIndex('do:/2') = true
system.traitLookup('Iterable').methodDictionary::do:/2.isMethod = true
system.traitTypes('Collection').includes('Array') = true
system.traitTypes('Dictionary').includes('Map') = true
system.traitDictionary['Dictionary'].isTrait = true
```

## System -- typeDictionary
```
system.typeDictionary.isDictionary = true
system.typeDictionary.indices.includes('Array') = true
system.typeDictionary.includesIndex('Array') = true
system.typeDictionary::Array.typeOf = 'Type' {- type of type is Type -}
system.typeDictionary::Array.isType = true {- Type type predicate -}
system.typeDictionary::Array.traitNameArray.includes('Collection') = true
system.typeDictionary::Association.slotNameArray = ['key', 'value']
system.typeDictionary::Association.methodDictionary.indices.includes('equals:/2')
system.typeDictionary::Association.methodDictionary.includesIndex('key:/1') = true
system.typeDictionary::Nil.methodDictionary.includesIndex('ifNil:/2') = true
system.typeLookup('Association').methodDictionary.select { :each | each.name = 'key' }.size = 2
system.typeLookup('Association').methodDictionary.anySatisfy { :each | each.name = 'copy' } = false
system.typeLookup('Array').isType = true
system.typeLookup('Array').name = 'Array'
system.typeLookup('Array').methodDictionary.includesIndex('shallowCopy:/1') = true
system.typeLookup('Array').methodDictionary::shallowCopy:/1.isMethod = true
system.typeMethodDictionary('Array').anySatisfy { :each | each.name ='select' } = true
system.typeLookup('String').isType = true
system.typeLookup('String').methodDictionary.includesIndex('includesSubstring:/2') = true
system.typeLookup('Void').methodDictionary.includesIndex('Set:/0') = true
system.typeLookup(4:3.typeOf).slotNameArray = ['numerator', 'denominator']
```

## System -- localStorage
```
system.localStorage.typeOf = 'Storage' {- system local storage, persistent key-value store -}
system.localStorage.isStorage = true {- storage predicate -}
system.localStorage.size >= 0 {- number of elements in local storage -}
system.localStorage.indices.allSatisfy(isString:/1) {- keys and values must each be strings -}
(system.localStorage::pi := 1.pi.asString) = 1.pi.asString {- store 1.pi as string at index 'pi', answer item stored -}
system.localStorage::pi = 1.pi.asString {- read pi -}
system.localStorage.indices.includes('pi') = true {- pi is an index -}
system.localStorage.removeAt('pi') = 1.pi.asString {- remove entry, answer removed item -}
system.localStorage.removeAll = system.localStorage {- remove all entries, answer self -}
```

## System -- Uniform Resource Locator (Url)
```
system.includesPackage('Url') {- package -}
'http://cern.ch/'.Url.typeOf = 'URL' {- the system type is all upper case -}
'http://cern.ch/'.Url.isUrl = true {- type predicate -}
'http://cern.ch/'.Url.href = 'http://cern.ch/' {- url href -}
'http://cern.ch/'.Url.hostname = 'cern.ch' {- url host name -}
'http://cern.ch/'.Url.port = '' {- url port -}
'http://cern.ch/'.Url.protocol = 'http:' {- url protocol -}
Url('browser', 'https://worldwideweb.cern.ch/').href = 'https://worldwideweb.cern.ch/browser' {- relative url -}
```

## System -- fetch
```
'/home/rohan/sw/spl/README.md'.asFileUrl.fetchText.then { :text | (text.size > 0).postLine }; true {- fetch text from file -}
'/home/rohan/sw/spl/README'.asFileUrl.fetchText.catch { :err | err.postLine }; true {- file does not exist -}
'file://localhost/home/rohan/sw/spl/README.md'.asUrl.fetchText.then { :text | (text.size > 0).postLine }; true {- fetch text from url (local) -}
'https://rohandrape.net/sw/spl/README.md'.asUrl.fetchText.thenElse { :text | (text.size > 0).postLine } { :err | true }; true {- fetch text from url (remote, allow for no network connection) -}
'file://localhost/home/rohan/sw/spl/sl/SmallKansas/PackageBrowser.sl'.asUrl.fetchText.then { :text | text.parsePackageHeader.includesIndex('Requires').postLine }; true
```

## System -- UrlSearchParams
```
system.includesPackage('UrlSearchParams') {- timestamp package -}
'x=1'.UrlSearchParams.typeOf = 'URLSearchParams' {- string constructor, type name (note case) -}
'x=1'.UrlSearchParams.isUrlSearchParams {- type predicate -}
'x=3.141&y=23'.UrlSearchParams.includes('x') = true
'x=3.141&y=23'.UrlSearchParams::y = '23'
'x=3.141&y=23&z=pi'.UrlSearchParams.keys = ['x' 'y' 'z'] {- keys -}
'x=3.141&y=23&z=pi'.UrlSearchParams.values = ['3.141' '23' 'pi'] {- values -}
'x=a&x=b&x=c'.UrlSearchParams.keys = ['x' 'x' 'x'] {- keys, allows duplicates -}
'x=a&x=b&x=c'.UrlSearchParams.values = ['a' 'b' 'c'] {- values -}
let p = 'x=3.141&y=23&z=pi'; p.UrlSearchParams.asString = p {- as search string -}
'z=a&y=b&x=c'.UrlSearchParams.associations = ['z' -> 'a', 'y' -> 'b', 'x' -> 'c']
let p = 'z=a&y=b&x=c'.UrlSearchParams; p.sort = p & { p.associations = ['x' -> 'c', 'y' -> 'b', 'z' -> 'a'] }
let p = 'x=a&y=b'.UrlSearchParams; p.add('z' -> 'c'); p.associations = ['x' -> 'a', 'y' -> 'b', 'z' -> 'c']
let p = 'x=a&y=b'.UrlSearchParams; p::x := 'c'; p.associations = ['x' -> 'c', 'y' -> 'b']
'x=a&y=b&x=c'.UrlSearchParams.atAllEntries('x') = ['a' 'c']
let p = 'x=a&y=b&x=c'.UrlSearchParams; p.removeKey('x'); p.asString = 'y=b'
'x=a&x=b&x=c'.UrlSearchParams.size = 3 {- size -}
(x: 1, y: 2, z: 3).asUrlSearchParams.asString = 'x=1&y=2&z=3' {- record constructor -}
```

## Temporaries
```
let x = nil; x = nil {- uninitialised variables are nil -}
let x = nil; let y = nil; x = y {- uninitialised variables are nil -}
let x = 1; let y = 2; x < y {- initialisers are written as name = value -}
```

## TimeStamp -- temporal type
```
system.includesPackage('TimeStamp') {- timestamp package -}
1676784053576.TimeStamp.printString = 'TimeStamp(1676784053576)' {- make TimeStamp from Number of milliseconds since unix epoch -}
1676784053576.TimeStamp.iso8601 = '2023-02-19T05:20:53.576Z' {- convert TimeStamp to ISO-8601 string -}
system.unixTime.isTimeStamp = true {- get current time at system -}
system.unixTime.iso8601.size = 24
1676784053576.TimeStamp.roundTo(24.hours).iso8601 = '2023-02-19T00:00:00.000Z' {- round to duration -}
let t = system.unixTime; t - 0.seconds = t {- offset TimeStamp by Duration -}
{ system.unixTime.postLine }.valueAfter(0.5.seconds).cancel = nil
{ system.unixTime.postLine }.valueAt(system.unixTime + 0.5.seconds).cancel = nil
{ system.unixTime.postLine }.valueEvery(3.seconds).cancel = nil
let t = 1676784053576.TimeStamp; let c = t.copy; c ~~ t & { c = t }
```

## Tuple -- collection type
```
system.includesPackage('Tuple') {- tuple package -}
(1, 2).typeOf = 'TwoTuple' {- type of -}
(1, 2).isTwoTuple {- type predicate -}
(1, 2).isTuple {- trait predicate -}
(1, 2).first = 1 {- field accessor -}
(1, 2).second = 2 {- field accessor -}
let t = (1, 2); t.first := 3; t = (3, 2) {- field mutator -}
let t = (1, 2); t.second := 3; t = (1, 3) {- field mutator -}
(1, 2).size = 2 {- size -}
(1, 2, 3).typeOf = 'ThreeTuple' {- type of -}
(1, 2, 3).isThreeTuple {- type predicate -}
(1, 2, 3).isTuple {- trait predicate -}
(1, 2, 3).first = 1 {- field accessor -}
(1, 2, 3).second = 2 {- field accessor -}
(1, 2, 3).third = 3 {- field accessor -}
let t = (1, 2, 3); t.first := 4; t = (4, 2, 3) {- field mutator -}
let t = (1, 2, 3); t.second := 4; t = (1, 4, 3) {- field mutator -}
let t = (1, 2, 3); t.third := 4; t = (1, 2, 4) {- field mutator -}
(1, 2, 3).size = 3 {- size -}
```

## Type -- reflection type
```
system.typeLookup('Colour').typeOf = 'Type' {- type of type -}
system.typeLookup('Colour').isType {- is type predicate -}
system.typeLookup('Colour').category = 'Graphics' {- category of type -}
system.typeLookup('Colour').constructorName = 'newColour:/0' {- constructor name for type -}
system.typeLookup('Colour').instanceOf.isColour {- initialized instance of type -}
system.typeLookup('Colour').name = 'Colour' {- name of type -}
system.typeLookup('Colour').packageName = 'Colour' {- package name of type -}
system.typeLookup('Colour').traitNameArray = ['Object'] {- traits (named) implemented by type -}
```

## Type -- slot access
```
('x' -> 1).slotNameArray = ['key', 'value'] {- slot names -}
('x' -> 1).slotRead('key') = 'x' {- read slot -}
('x' -> 1).slotRead('answer') = nil {- unknown slot names answer nil -}
let a = ('x' -> 1); a.slotWrite('key', 'y'); a = ('y' -> 1) {- write slot -}
let a = ('x' -> 1); a.slotWrite('hidden', 1.pi); a = ('x' -> 1) & { a.slotRead('hidden') = 1.pi } {- writes to unknown slot add a slot -}
```

## Syntax -- unary messages
```
89.sin = 0.8600694058124533
3.sqrt = 1.7320508075688772
1.pi.printString = '3.141592653589793'
'text'.size = 4
true.not = false
```

## Syntax -- binary messages
```
'100' -> 100 = Association('100', 100) {- creates an association -}
3 + 4 = 7
10 - 1 = 9
4 <= 3 = false
4:3 * 3 = 4 = true {- equality is a binary message; fractions are exact -}
3:4 == 3:4 = false {- two equal Fractions are not the same object -}
```

## Syntax -- precedence
```
100.factorial / 99.factorial ~ 100 {- (unary) methods bind more closely than operators -}
2 ^ (1 + 3.factorial) = 128
2.raisedToInteger(1 + 3.factorial) = 128
1 + 2 * 3 = 9
1 + (2 * 3) = 7
3 + 4.factorial = 27 {- not 5040 -}
(3 + 4).factorial = 5040
3 + 4 * 5 = 35 {- (not 23) binary messages sent from left to right -}
3 + (4 * 5) = 23
1 + 1 / 3 = (2 / 3) {- not 4/3 -}
1 + (1 / 3) = (4 / 3)
1 / 3 + 2 / 3 = (7 / 9) {- not 1 -}
(1 / 3) + (2 / 3) = 1
```

## Unit/Mass -- physics unit type
```
23.grams.typeOf = 'Mass' {- gram constructor, type of -}
23.grams.isMass {- mass predicate -}
23.grams.printString = '23.grams'
23.kilograms = 23000.grams {- a kilogram is a thousand grams -}
2.2.pounds ~ 997.9.grams {- two and on fifth pounds is approximately a kilogram -}
36.ounces ~ 1020.58.grams {- thirty-six ounces are approximately a kilogram -}
(1 / 16).pounds = 1.ounces {- an ounce is 1/16 of a pound -}
1.kilograms.asGrams = 1000.asGrams {- grams of mass, or identity of number -}
```

## Unit/SiUnit -- units type
```
'kg'.siUnit.typeOf = 'SiUnit' {- type of SiUnit -}
'm'.siUnit.isSiUnit {- lookup unit by symbol -}
'meter'.siUnit.isSiUnit {- lookup unit by name -}
'm'.siUnit == 'meter'.siUnit {- units are cached (identical) -}
'Hz'.siUnit.name = 'hertz' {- Hz is the symbol of the unit hertz -}
's'.siUnit.isBaseUnit & { 'Pa'.siUnit.isDerivedUnit } {- there are seven base units and twenty two named derived units -}
```

## Unordered -- collection trait
```
system.includesPackage('Unordered') {- package -}
{ [1, 2, 3].asSet.at(1) }.ifError { true } {- unordered collections do not implement at -}
{ [1, 2, 3].asBag.at(1) }.ifError { true }
```

## RectangularCoordinate -- geometry type
```
system.includesPackage('RectangularCoordinate') {- package -}
RectangularCoordinate(0, 0).typeOf = 'RectangularCoordinate' {- type of -}
RectangularCoordinate(-1, 1).isRectangularCoordinate = true
[1, 2].asRectangularCoordinate = RectangularCoordinate(1, 2) {- two vector from array -}
(1, 2).asRectangularCoordinate = RectangularCoordinate(1, 2) {- two vector from tuple -}
(x: 1, y: 2).asRectangularCoordinate = RectangularCoordinate(1, 2) {- two vector from array -}
Point(-1, 1).isRectangularCoordinate = true {- point constructor -}
[1, 2].asPoint = Point(1, 2) {- array as point -}
(1, 2).asPoint = Point(1, 2) {- tuple as point -}
(x: 1, y: 2).asPoint = Point(1, 2) {- record as point -}
Point(3, 4).isPoint & { true } = true
(-1@1).isPoint.not = false
-1@1 = Point(-1, 1)
(-1@1).x = -1
(-1@1).y = 1
(-1@1).x(-3) = -3
(-1@1).y(3) = 3
Point(-1, 1).x = -1
Point(-1, 1).y = 1
Point(-1, 1).x(-3) = -3
Point(-1, 1).y(3) = 3
-1@1 * 9 = (-9@9)
-1@1 + 2 = (1@3)
2 * (-1@1) * 2 = (-4@4)
(-1@1).asString = '-1@1'
(1 @ 1).negated = (-1 @ -1) {- negation -}
0 - (1 @ 1) = (-1 @ -1) {- negation as subtraction from zero -}
let p = -1@1; p.x := -3; p.y := 3; p = (-3@3) = true
let p = -1@3; let a = [p]; a.first.x := -3; p = (-3@3) = true
let x = 3.141; let y = 23; let p = x@y; p.x = x & { p.y = y }
[1@0, 1@1, 0@1, -1@1, -1@0, 0 @ -1].collect(theta:/1) = (1.pi * [0, 1 / 4, 1 / 2, 3 / 4, 1, -1 / 2]) {- theta = angle from (1,0) -}
0@0 = Point(0,0)
200 @ 100 = Point(200, 100) {- obtain a new point -}
(200 @ 100).x = 200 {- x coordinate -}
(200 @ 100).y = 100 {- y coordinate -}
0 - (200 @ 100) = (-200 @ -100) {- negates x and y (note @- is an binary selector) -}
(0 - (200 @ 100)).abs = (200 @ 100) {- absolute value of x and y -}
200 @ 100 + 1 = (201 @ 101) {- add scale to both x and y -}
200 @ 100 - 1 = (199 @ 99) {- subtract scale from both x and y -}
200 @ 100 * 2 = (400 @ 200) {- multiply x and y by scale -}
200 @ 100 / 2 = (100 @ 50) {- divide x and y by scale -}
(200 @ 100) // 2 = (100 @ 50) {- divide x and y by scale -}
200 @ 100 % 3 = (2 @ 1) {- modulo of x and y by scale -}
200 @ 100 + (50 @ 25) = (250 @ 125) {- add points -}
200 @ 100 - (50 @ 25) = (150 @ 75) {- subtract points -}
200 @ 100 * (3 @ 4) = (600 @ 400) {- multiply points -}
1800 @ 100 / (3 @ 4) = (600 @ 25) {- divide points -}
(200 @ 100).asArray = [200, 100] {- array of x and y -}
let v = Point(3, 4); v.first = 3 & { v.second = 4 } {- implements first and second -}
let v = Point(3, 4); v[1] = 3 & { v[2] = 4 } {- implements at -}
let v = Point(3, 4); v[1] := 7; v.first = 7 {- implements atPut -}
Point(3, 4).size = 2 {- implements size -}
let v = Point(3, 4); v.swapInPlace; v[1] = 4 {- swap fields in place -}
Point(3, 4).swapped = Point(4, 3) {- answer swapped vector -}
let v = (0 @ 0); let c = v.copy; c.x := 1; c ~= v & { c = (1 @ 0) } {- copy two vector -}
Point(1, 1).asPolarCoordinate = PolarCoordinate(2.sqrt, 0.25.pi) {- radius and angle, r and theta -}
[0, 0].asPoint.isRectangularCoordinate {- array as point, point predicate -}
(0, 0).asPoint.isZero {- are x and y both zero -}
(1 @ 1).norm = 2.sqrt {- magnitude, distance to origin -}
(1 @ 1).normalized = ((1 @ 1) / 2.sqrt) {- normalized to have unit magnitude -}
(1 @ 1).normalized.norm ~ 1
Point(1, 1).norm = 2.sqrt {- magnitude, distance to origin -}
Point(1, 1).normalized = ((1 @ 1) / 2.sqrt) {- normalized to have unit magnitude -}
Point(1, 1).normalized.norm ~ 1
```

## CartesianCoordinate -- geometry type
```
[1, 2, 3].asCartesianCoordinate = CartesianCoordinate(1, 2, 3) {- three vector from array -}
(1, 2, 3).asCartesianCoordinate = CartesianCoordinate(1, 2, 3) {- three vector from tuple -}
(x: 1, y: 2, z: 3).asCartesianCoordinate = CartesianCoordinate(1, 2, 3) {- three vector from array -}
[1, 2, 3].asPoint = Point(1, 2, 3) {- array as point -}
(1, 2, 3).asPoint = Point(1, 2, 3) {- tuple as point -}
(x: 1, y: 2, z: 3).asPoint = Point(1, 2, 3) {- record as point -}
let a = [1, 2, 3]; let v = a.asPoint; v.asArray = [1, 2, 3] {- point as array -}
Point(0, 0, 0).isZero {- are x, y and z all zero -}
let v = Point(1, 2, 3); [v.x, v.y, v.z] = [1, 2, 3] {- fields are x, y, z -}
let v = Point(3, 4, 5); v[1] = 3 & { v[2] = 4 & { v[3] = 5 } } {- implements at -}
let v = Point(3, 4, 5); v[1] := 5; v[3] := 3; v.asArray = [5, 4, 3] {- implements atPut -}
let v = Point(3, 4, 5); [v.first, v.second, v.third] = [3, 4, 5] {- implements first &etc. -}
Point(0, 0, 1).asSphericalCoordinate = SphericalCoordinate(1, 0, 0)
SphericalCoordinate(1, 0, 0).asCartesianCoordinate = Point(0, 0, 1)
Point(1, 1, 0).asSphericalCoordinate = SphericalCoordinate(2.sqrt, 1.pi / 4, 1.pi / 2)
SphericalCoordinate(2.sqrt, 1.pi / 4, 1.pi / 2).asCartesianCoordinate ~ Point(1, 1, 0)
IsoSphericalCoordinate(3.sqrt, 2.sqrt.arcTan, 0.25.pi).asCartesianCoordinate ~ Point(1, 1, 1)
Point(1, 1, 1).asSphericalCoordinate ~ IsoSphericalCoordinate(3.sqrt, 2.sqrt.arcTan, 0.25.pi)
Point(0, 0, 0).distance(Point(1, 1, 1)) = 3.sqrt
Point(0, 0, 0).distance(Point(1, 1, 0)) = 2.sqrt
Point(1, 2, 3).distance(Point(6, 5, 4)) = 35.sqrt
Point(0, 0, 0).isCartesianCoordinate = true {- is Cartesian coordinate -}
Point(0, 0, 0).isZero = true {- is zero -}
let v = Point(0, 0, 0); v.asCartesianCoordinate == v {- identity -}
Point(1, 3, 5).asArray = [1 3 5] {- point as array -}
[1 3 5].asPoint = Point(1, 3, 5) {- array as point -}
Point(1, 3, 5).asRecord = (x: 1, y: 3, z: 5)
(x: 1, y: 3, z: 5).asPoint = Point(1, 3, 5) {- record as point -}
SphericalCoordinate(1, 2, 3).asRecord = (r: 1, theta: 2, phi: 3)
(r: 1, theta: 2, phi: 3).asSphericalCoordinate = SphericalCoordinate(1, 2, 3)
CylindricalCoordinate(1, 1, 1).asCartesianCoordinate.asRecord = (x: 1.cos, y: 1.sin, z: 1)
Point(1.cos, 1.sin, 1).asCylindricalCoordinate.asRecord = (rho: 1, phi: 1, z: 1)
```

## FourVector -- geometry type
```
[1, 2, 3, 4].asFourVector = FourVector(1, 2, 3, 4) {- four vector from array -}
(1, 2, 3, 4).asFourVector = FourVector(1, 2, 3, 4) {- four vector from tuple -}
(w: 1, x: 2, y: 3, z: 4).asFourVector = FourVector(1, 2, 3, 4) {- four vector from record -}
[1, 2, 3, 4].asPoint = Point(1, 2, 3, 4) {- array as point -}
(1, 2, 3, 4).asPoint = Point(1, 2, 3, 4) {- tuple as point -}
(w: 1, x: 2, y: 3, z: 4).asPoint = Point(1, 2, 3, 4) {- record as point -}
let a = [1, 2, 3, 4]; let v = a.asPoint; v.asArray = [1, 2, 3, 4] {- four vector to array -}
Point(0, 0, 0, 0).isZero {- are w, x, y and z all zero -}
let v = Point(1, 2, 3, 4); [v.w, v.x, v.y, v.z] = [1, 2, 3, 4] {- fields are w, x, y, z -}
```

## Vector -- collection type
```
system.includesPackage('Vector') {- package -}
Vector(9).typeOf = 'Vector' {- type of -}
Vector(9).isVector = true {- type predicate -}
Vector(9).size = 9 {- vector of size -}
Vector(9).species = Vector:/1 {- species -}
Vector(9).isCollection = true {- collection trait -}
Vector(9).isIndexable = true {- indexable trait -}
Vector(9).isSequenceable = true {- sequenceable trait -}
Vector(0).isEmpty = true {- the empty vector -}
[1 .. 5].asVector.first = 1 {- array as vector -}
(1 .. 5).asVector.second = 2 {- interval as vector -}
(1 .. 5).asVector.asArray = [1 .. 5] {- vector as array -}
(1 .. 5).asVector.reversed.first = 5 {- reversed -}
let v = Vector(9); v[5] = nil {- at protocol, initialised to nil -}
let v = Vector(9); v[5] := 5; v[5] = 5 {- atPut protocol -}
let v = Vector(9); let c = v.copy; v[5] := 5; c[5] = nil {- copy -}
```

## WeakMap -- collection type
```
system.includesPackage('WeakMap') {- weak map package -}
WeakMap().typeOf = 'WeakMap' {- type of weak map -}
WeakMap().isWeakMap {- weak map predicate -}
WeakMap().printString = 'a WeakMap' {- weak map print string -}
{ WeakMap().size }.ifError { true } {- the size of a weak map cannot be observed -}
let f = { system.nextRandomFloat }; f:/0.once = f:/0.once {- Block>>once caches output using a weak map -}
system.cache::onceCache.isWeakMap
```

## MutableCollectionStream -- collection type
```
system.includesPackage('MutableCollectionStream') {- MutableCollectionStream package -}
let w = [].asWriteStream; w.nextPut(1); w.contents = [1]
let w = [].asWriteStream; w.nextPut(1); w.nextPutAll([2 .. 8]); w.nextPut(9); w.contents = [1 .. 9]
let w = [].asWriteStream; 1.putOn(w); w.contents = [1]
let w = [].asWriteStream; 1.putOn(w); [2 .. 8].putOn(w); 9.putOn(w); w.contents = [1 .. 9]
let w = [].asByteArray.asWriteStream; w.nextPutAll((1 .. 9)); w.contents = [1 .. 9].asByteArray
let w = [nil, nil].asWriteStream; w.nextPut('a'); w.nextPut('b'); w.contents.join = 'ab'
```

### Utf8Stream -- collection type
```
let w = Utf8Stream(); 'bodlɛʁ'.encodeOn(w); w.contents.utf8String = 'bodlɛʁ'
let w = Utf8Stream(); 'bodlɛʁ'.encodeOn(w); w.utf8Contents = 'bodlɛʁ'
let w = Utf8Stream(); [3.141, nil].do { :each | each.printOn(w) }; w.utf8Contents = '3.141nil'
```

### AsciiStream -- collection type
```
let w = AsciiStream(); 'ascii'.encodeOn(w); w.contents.asciiString = 'ascii'
let w = AsciiStream(); 'ascii'.encodeOn(w); w.asciiContents = 'ascii'
let w = AsciiStream(); [3.141, nil].do { :each | each.printOn(w) }; w.asciiContents = '3.141nil'
{ :stream | 'ascii'.asciiByteArray.putOn(stream) }.asciiStringStreamContents = 'ascii'
```
