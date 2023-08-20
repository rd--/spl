# histogramOf -- converting

- _histogramOf(aCollection, aBlock:/1)_

A more efficient form of _aCollection.collect(aBlock:/1).Bag_.

	[1.1, 2.1, 3.1, 1.9, 2.9, 1.1].histogramOf { :each | each.rounded } = [1, 2, 3, 2, 3, 1].Bag

* * *

See also: Bag
