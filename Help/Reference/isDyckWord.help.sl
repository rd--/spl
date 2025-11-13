# isDyckWord

- _isDyckWord([x₁ x₂ …], [a b]=[1 0])_

Answer `true` if the sequence _x_ is a Dyck word on the letters _a,b_.

On the letters _1,-1_:

```
>>> [1 1 -1 1 -1 -1 1 -1]
>>> .isDyckWord([1 -1])
true
```

On the letters _1,0_:

```
>>> [
>>> 	1 0 1 1 1 1 0 1 0 0
>>> 	1 0 1 1 0 1 0 1 1 0
>>> 	0 0 0 0
>>> ].isDyckWord
true
```

The `dyckWords` method enumerates Dyck words:

```
>>> 3.dyckWords
>>> .allSatisfy(isDyckWord:/1)
true
```

* * *

See also: DyckWord, dyckWords
