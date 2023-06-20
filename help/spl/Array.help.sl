# Array -- collection type

- _Array(anInteger)_
- _Array(aCollection)_

Create a new array of _anInteger_ places, each initialised to _nil_.

Create a new array having as elements the elements of _aCollection_.

The array is of variable size, elements can be added at the start, at the end, or in a place given by a relation to existing items.

Array implements the _Collection_, _SequencableCollection_ and _ArrayedCollection_ traits.

* * *

See also: _ByteArray_, _Float64Array_

* * *

- _addAfter(self, oldObject, newObject)_: Add the argument, newObject, as an element of the receiver. Put it in the sequence just succeeding oldObject. Answer newObject.
