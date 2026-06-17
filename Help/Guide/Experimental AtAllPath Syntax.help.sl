# Experimental AtAllPath Syntax

Rewrite rule,
where each _i_ is an instance of `Range Literal Syntax`:

- _c[i₁, i₂ …]_ ⟹ _atAllPath(c, [i₁, i₂ …])_

At a `List` of lists:

```
>>> let c = [5 5].iota;
>>> c.atAllPath([1:2, 3:4])
[3 4; 8 9]
```

~~~spl experimental
let c = [5 5].iota;
(
	c[1:2, 3:4],
	c[[2, 1], [4, 3]]
)

([3 4; 8 9], [9 8; 4 3])
~~~

Select one column of a matrix:

~~~spl experimental
let m = [5 5].iota;
m[1:5, 3:3]

[3; 8; 13; 18; 23]
~~~
