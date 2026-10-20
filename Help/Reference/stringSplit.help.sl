# stringSplit

- _stringSplit(s₁, s₂)_

Split the string _s₁_,
by the sub-string _s₂_.
The separator is discarded.
Alias for `splitOn`.

```
>>> 'a,b,c'.stringSplit(',')
['a' 'b' 'c']

>>> 'hello<p>world<p>'.stringSplit('<p>')
['hello' 'world' '']

>>> 'a///b'.stringSplit('/')
['a' '' '' 'b']

>>> ''.stringSplit(',')
['']

>>> '0.3D9'.stringSplit('D')
['0.3' '9']

>>> 'text'.stringSplit('')
['t' 'e' 'x' 't']
```

The inverse is `stringJoin`:

```
>>> 'mississippi'.stringSplit('i').stringJoin('i')
'mississippi'
```

Pick out substrings delimited by whitespace:

```
>>> 'a bbb  cccc aa   d'.stringSplit(' ')
['a' 'bbb' '' 'cccc' 'aa' '' '' 'd']
```

See also `stringSplitRegularExpression`:

```
>>> 'a bbb  cccc aa   d'
>>> .stringSplitRegularExpression(' +')
['a' 'bbb' 'cccc' 'aa' 'd']
```

Split a string at every '--':

```
>>> 'a--bbb---ccc--dddd'.stringSplit('--')
['a' 'bbb' '-ccc' 'dddd']
```

Split at every run of spaces:

```
>>> 'the cat in the hat'.stringSplit(' ')
['the' 'cat' 'in' 'the' 'hat']
```

Split at periods:

```
>>> '192.168.0.1'.stringSplit('.')
['192' '168' '0' '1']
```

Make a nested array by applying `stringSplit` twice:

```
>>> let s = '11:12:13//21:22:23//31:32:33';
>>> s.stringSplit('//').collect { :each |
>>> 	each.stringSplit(':')
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
>>> 	let parts = each.stringSplit('=');
>>> 	parts[1] -> (parts.size = 1).if {
>>> 		''
>>> 	} {
>>> 		parts[2]
>>> 	}
>>> }.Record
(x: 'A', y: '', z: 'C')
```

* * *

See also: stringJoin, stringSplitRegularExpression

Guides: String Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/StringSplit.html)

Categories: String
