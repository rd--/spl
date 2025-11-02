# splitBy

- _splitBy([x₁ x₂ …], [y₁ …])_

Split the sequence _x_,
or a string,
by the sub-sequence _y_,
or a sub-string.
The separator is discarded.

At `List`:

```
>>> [1 2 3 0 4 5 6 0 7 8 9].splitBy([0])
[1 2 3; 4 5 6; 7 8 9]
```

Split a `String` into a `List` of `String`s,
according to the separator,
which is also a `String`:

```
>>> 'a,b,c'.splitBy(',')
['a' 'b' 'c']

>>> 'hello<p>world<p>'.splitBy('<p>')
['hello' 'world' '']

>>> 'a///b'.splitBy('/')
['a' '' '' 'b']

>>> ''.splitBy(',')
['']

>>> '0.3D9'.splitBy('D')
['0.3' '9']
```

The inverse is `stringJoin`:

```
>>> 'mississippi'.splitBy('i').stringJoin('i')
'mississippi'
```

Pick out substrings delimited by whitespace:

```
>>> 'a bbb  cccc aa   d'.splitBy(' ')
['a' 'bbb' '' 'cccc' 'aa' '' '' 'd']

>>> 'a bbb  cccc aa   d'
>>> .splitByRegularExpression(' +')
['a' 'bbb' 'cccc' 'aa' 'd']
```

Split a string at every '--':

```
>>> 'a--bbb---ccc--dddd'.splitBy('--')
['a' 'bbb' '-ccc' 'dddd']
```

Split at every run of spaces:

```
>>> 'the cat in the hat'.splitBy(' ')
['the' 'cat' 'in' 'the' 'hat']
```

Split at periods:

```
>>> '192.168.0.1'.splitBy('.')
['192' '168' '0' '1']
```

Make a nested array by applying `splitBy` twice:

```
>>> let s = '11:12:13//21:22:23//31:32:33';
>>> s.splitBy('//').collect { :each |
>>> 	each.splitBy(':')
>>> }
[
	'11' '12' '13';
	'21' '22' '23';
	'31' '32' '33'
]
```

Simple attribute parser:

```
>>> 'x=A y z=C'.words.collect { :each |
>>> 	let parts = each.splitBy('=');
>>> 	parts[1] -> (parts.size = 1).if {
>>> 		''
>>> 	} {
>>> 		parts[2]
>>> 	}
>>> }.asRecord
(x: 'A', y: '', z: 'C')
```

* * *

See also: join, split, splitByRegularExpression, stringJoin, stringSplit

Guides: List Functions, String Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/StringSplit.html)

Categories: String
