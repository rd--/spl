# beginsWith

- _beginsWith(u, v)_

Answer `true` if the sequence _u_ starts with, or has an initial prefix, the sequence _v_, else `false`.

```
>>> [1 .. 5].beginsWith([1 .. 3])
true

>>> 3:9.beginsWith(1:5)
false
```

Prefix must be a sequence:

```
>>> {
>>> 	[1 .. 5].beginsWith(1) = false
>>> }.hasError
true
```

All lists, including the empty list, begin with the empty list:

```
>>> [].beginsWith([])
true
```

At `String`:

```
>>> 'Hello World'.beginsWith('Hello')
true

>>> 'quickSort'.beginsWith('quick')
true
```

Markdown code fences:

```
>>> '```spl'.beginsWith('```')
true

>>> '~~~spl'.beginsWith('~~~')
true
```

The empty `String` begins with the empty string, and with nothing else:

```
>>> ''.beginsWith('')
true

>>> ''.beginsWith('>')
false
```

* * *

See also: beginsWithAnyOf, endsWith, first

Guides: List Functions, String Functions

References:
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Data-List.html#v:isPrefixOf)
_Mathematica_
[1](https://reference.wolfram.com/language/ref/StringStartsQ.html)

Categories: Testing
