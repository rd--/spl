# Experimental Infix Method Syntax

Methods are ordinarily written using either `Apply Syntax` as:

```
>>> min(3, 4)
3
```

or using `Method Syntax` as:

```
>>> 3.min(4)
3
```

Methods of arity two (binary methods) may also be written infix by appending a `:` to the name:

~~~spl experimental
3 min: 4
=> 3
~~~

When written infix, methods may also take an adverb, in which case the `:` is elided:

~~~spl experimental
[3 1 2] min.outer [4 1 2]
=> [3 1 2; 1 1 1; 2 1 2]

[3 1 2] *.outer [4 1 2]
=> [12 3 6; 4 1 2; 8 2 4]
~~~

* * *

See also: :

Guides: Apply Syntax, Binary Operator Syntax, Method Syntax, Operator Adverbs

Categories: Syntax

Status: Disallowed, Experimental
