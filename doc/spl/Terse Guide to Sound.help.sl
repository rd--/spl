'Sound/Sc/Lang'
[1, 2, 3, 4, 5].keep(3) = [1, 2, 3] (* keep first n items, alias for first: *)
[1, 2, 3, 4, 5].drop(2) = [3, 4, 5] (* discard first n items *)
(1 .. 9).drop(3) = [4 .. 9]
(1 .. 9).dropLast(3) = [1 .. 6]
(1 .. 9).keep(3) = [1 .. 3]
(1 .. 9).keepLast(3) = [6 .. 9]
[3, 5, 4].normalize = [0, 1, 1/2]
({ :x | x * 2 } <> { :x | x + 3 }).value(4) = 14 (* function composition *)
'x' + 'y' = 'x y' (* catenation with space *)
'/usr' +/+ 'local' = '/usr/local' (* file path catenation *)
var l = []; [1 .. 9].doAdjacentPairs { :a :b | l.add(a -> b) }; l.size = 8
[1, 3, 5, 7, 9].isSeries = true (* is array an arithmetic series *)
[1 .. 7].collect { :x | x.asBinaryDigits(3) } = [[0, 0, 1], [0, 1, 0], [0, 1, 1], [1, 0, 0], [1, 0, 1], [1, 1, 0], [1, 1, 1]]
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
[1 .. 4].mirror = [1, 2, 3, 4, 3, 2, 1] (* append reverse of prefix of array *)
[1 .. 9].normalizeSum.sum = 1 (* self / self.sum *)
[1 .. 9].normalize(10, 90) = [10, 20 .. 90] (* normalise between minima and maxima *)
[1 .. 5].wrapExtend(9) = ([1 .. 5] ++ [1 .. 4]) (* extend array cyclically *)
[1 .. 5].wrapExtend(3) = [1 .. 3] (* truncate is required *)
[4, 7, 6, 8].reshape([2, 2]) = [[4, 7], [6, 8]] (* reshape array given Apl type shape value *)
[4, 7, 6, 8].reshape([2, 3]) = [[4, 7, 6], [8, 4, 7]]  (* cycle input as required *)
(1 .. 9).clump(3) = [[1 .. 3], [4 .. 6], [7 .. 9]] (* chunks of n places *)
(1 .. 7).clump(3) = [[1 .. 3], [4 .. 6], [7]] (* chunks of n places, last segment may have less places *)
'string'.ascii.clump(2).collect { :each | each.ByteArray.ascii } = ['st', 'ri', 'ng']
