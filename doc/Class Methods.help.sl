# Class Methods

Since there are no classes, there are no class variables and no class methods.
The expression _Array.series(5, 1, 2)_ means _series(Array, 5, 1, 2)_.
_series_ uses _Array.new(5)_ to construct the collection.
_new(f, n)_ is defined as _f(n)_.
Similarly _Array.new_ makes an empty array because _new(f)_ is defined as _f()_.
_OrderedCollection.ofSize(3)_ makes a sequence having three nil slots, wheras _OrderedCollection.new(3)_ creates an empty sequence where the storage array may be initialised to have three places.
As in Smalltalk types can define a _species_ method to decide result types.
