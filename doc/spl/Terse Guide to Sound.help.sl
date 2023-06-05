'Sound/Sc/Lang'
[1, 2, 3, 4, 5].keep(3) = [1, 2, 3] (* keep first n items *)
[1, 2, 3, 4, 5].drop(2) = [3, 4, 5] (* discard first n items *)
(1 .. 9).drop(3) = [4 .. 9]
(1 .. 9).dropLast(3) = [1 .. 6]
(1 .. 9).keep(3) = [1 .. 3]
(1 .. 9).keepLast(3) = [6 .. 9]
[3, 5, 4].normalize = [0, 1, 1/2]
({ :x | x * 2 } <> { :x | x + 3 }).value(4) = 14 (* function composition *)
'x' + 'y' = 'x y' (* catenation with space *)
'/usr' +/+ 'local' = '/usr/local' (* file path catenation *)
var l = [].OrderedCollection; [1 .. 9].doAdjacentPairs { :a :b | l.add(a -> b) }; l.size = 8
[1, 3, 5, 7, 9].isSeries = true (* is array an arithmetic series *)

