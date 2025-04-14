# Indexing Functions

Access an element at a specified index:

- `at`

Access an element at a specified index,
providing guard blocks:

- `atIfAbsent`
- `atIfPresent`
- `atIfPresentIfAbsent`

Access an element at a specified index,
or answer a `Nil` or `Missing` value:

- `atMissing`
- `atNil`

Access an element at a specified index,
or at a modified index if the specified index is invalid:

- `atFold`
- `atMod`
- `atPin`
- `atSymmetrical`
- `atWrap`

Access a set of elements at the specified indices:

- `atAll`
- `atAllFold`
- `atAllMissing`
- `atAllNil`
- `atAllPin`
- `atAllSymmetrical`

Access an element using a positional index:

- `atPath`

Locate index:

- `detectIndex`
- `indexOf`
- `indexOfIfAbsent`
- `indexOfStartingAtBy`
- `lastIndexOf`

Binary search:

- `binaryDetectIndex`
- `binarySearchLeftmost`
- `binarySearchRightmost`
- `binarySearch`
- `bisect`
- `indexForInserting`

Locate indices:

- `detectIndices`
- `indicesOf`
- `indicesOfSubstring`
- `deepIndicesOf`

Matrices and Arrays:

- `extract`
- `part`
- `subarray`
- `submatrix`

Write a value to a slot at a specified index:

- `atPut`
- `atIfAbsentPut`

Write a value, or a collection of values, to a specified sequence of indices:

- `atAllPut`
- `atAllPutAll`

Mutate at deep index:

- `atPathPut`
