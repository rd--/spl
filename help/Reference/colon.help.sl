# : (colon)

`:` is a syntax token, it is not an operator.

A colon prefix indicates argument names in `Block Syntax`:

```
>>> { :i | i * i } . (3)
9
```

A colon suffix indicates key names in `Dictionary Syntax`:

```
>>> (x: 1, y: 2).keys
['x', 'y']
```

An infix colon defines a `Range` in `Range Syntax`:

```
>>> 1:9 % 2
[1 0 1 0 1 0 1 0 1]

>>> 1:2:9.asList
[1 3 5 7 9]
```

An infix colon declares a type in `Type Definition Syntax`.

~~~
Foo : [Object] { |bar| foo { :self | 'foo' } }
~~~

A colon suffix in `Infix Method Syntax` allows two argument methods to be written infix:

```
>>> 3 min: 4
3
```

The name of this syntax token is `colon`.

* * *

See also: ,, ., ;, :;, :=

Guides: Block Syntax, Dictionary Syntax, Infix Method Syntax, Range Syntax, Syntax Tokens

References:
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/colon.html)

Categories: Syntax
