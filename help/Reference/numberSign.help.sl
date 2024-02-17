# #

- _#(alpha)_ => _size(alpha)_
- _alpha # beta_ => _replicate(alpha, beta)_

The unary form is an alias for _size_.

```
>>> 1:5.#
5
```

The binary form is an alias for _replicate_.

With Integer count:

```
>>> 3 # 5
[3 3 3 3 3]
```

With List count:

```
>>> 3 # [2 3]
[3 3 3; 3 3 3]
```

C.f. reshape:

```
>>> [3] # [2 3]
[3; 3; 3:; 3; 3; 3]

>>> [3].reshape([2 3])
[3 3 3; 3 3 3]
```

Cf. replicateEach:

```
>>> [3 4] # [2 3]
[3 4; 3 4; 3 4:; 3 4; 3 4; 3 4]

>>> [3 4].replicateEach([2 3])
[3 3 4 4 4]
```

* * *

See also: !, duplicate, replicate, replicateEach, reshape, size
