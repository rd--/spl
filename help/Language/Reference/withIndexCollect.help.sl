# withIndexCollect -- enumerating

- _withIndexCollect(aSequence, aProcedure:/2)_

Like _withCollect_ except that the iteration index supplies the second argument to the block.

	(9 .. 1).withIndexCollect { :each :index | each * 2 + index } = [19 .. 11]

* * *

See also: collect, withCollect
