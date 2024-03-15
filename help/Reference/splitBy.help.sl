# splitBy

- _splitBy(aString | aSequence, separator)_

Split a sequence or a string by a sub-sequence or a sbu-string.

At `List`:

```
>>> [1 2 3 0 4 5 6 0 7 8 9].splitBy([0])
[1 2 3; 4 5 6; 7 8 9]
```

Split _aString_ into a `List` of `String`s according to _separator_, which is also a `String`.

```
>>> 'a,b,c'.splitBy(',')
['a' 'b' 'c']

>>> 'hello<p>world<p>'.splitBy('<p>')
['hello' 'world' '']

>>> 'a///b'.splitBy('/')
['a' '' '' 'b']
```

The inverse is `joinSeparatedBy`:

```
>>> 'mississippi'.splitBy('i').joinSeparatedBy('i')
'mississippi'
```

Pick out substrings delimited by whitespace:

```
>>> 'a bbb  cccc aa   d'.splitBy(' ')
['a' 'bbb' '' 'cccc' 'aa' '' '' 'd']

>>> 'a bbb  cccc aa   d'.splitByRegExp(' +')
['a' 'bbb' 'cccc' 'aa' 'd']
```

Split a string at every '--':

```
>>> 'a--bbb---ccc--dddd'.splitBy('--')
['a' 'bbb' '-ccc' 'dddd']
```

Make a nested array by applying `splitBy` twice:

```
>>> '11:12:13//21:22:23//31:32:33'.splitBy('//').collect { :each | each.splitBy(':') }
['11' '12' '13'; '21' '22' '23'; '31' '32' '33']
```

* * *

See also: join, joinSeparatedBy, split, splitByRegExp

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/StringSplit.html)

Categories: String
