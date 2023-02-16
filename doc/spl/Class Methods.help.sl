# Class Methods

Since there are no classes, there are no class variables and no class methods.

As in Smalltalk types can define a _species_ method to decide result types.

```
[].species = Array:/1
[].species.new(3) = [nil, nil, nil]
```

_new(f, n)_ is defined as _f(n)_.

Also as is Smalltalk _OrderedCollection:/1.ofSize(3)_ makes a sequence having three nil slots, wheras _OrderedCollection:/1.new(3)_ creates an empty sequence where the private storage structure may be initialised to have three places.
