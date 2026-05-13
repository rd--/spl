# LinkedList

- _LinkedList([x₁ x₂ …])_

A `Type` representing a collection of links, which are containers for other objects.

Using the methods `addFirst` and `removeLast` causes the list to behave as a stack.

Using `addLast` and `removeFirst` causes the list to behave as a queue.

Unlike `List` certain methods, such as `atIndex`, are linear and not constant time.

Type predicate for linked list:

```
>>> LinkedList().isLinkedList
true
```

Empty linked list:

```
>>> LinkedList().size
0

>>> LinkedList().isEmpty
true
```

Linked list from list:

```
>>> LinkedList[1 2 3].size
3
```

Add to start:

```
>>> let l = LinkedList();
>>> l.addFirst(1);
>>> l.addFirst(2);
>>> l.contents
[2 1]
```

Add to end:

```
>>> let l = LinkedList();
>>> l.addLast(1);
>>> l.addLast(2);
>>> l.contents
[1 2]
```

Add to end

```
>>> let l = LinkedList();
>>> 1.toDo(5) { :each |
>>> 	l.add(each)
>>> };
>>> l.contents
[1 2 3 4 5]
```

Collect:

```
>>> LinkedList(1:9).collect { :each |
>>> 	10 - each
>>> }
LinkedList[9 8 7 6 5 4 3 2 1]
```

Remove first:

```
>>> let l = LinkedList[1 .. 9];
>>> l.removeFirst;
>>> l.first
2
```

Remove last:

```
>>> let l = LinkedList[1 .. 9];
>>> l.removeLast;
>>> l.last
8
```

In place reject:

```
>>> let l = LinkedList[1 .. 5];
>>> l.removeAllSuchThat(isOdd:/1);
>>> l.contents
[2, 4]
```

Remove all:

```
>>> let l = LinkedList(1:99);
>>> let n = l.size;
>>> l.removeAll;
>>> (n, l.isEmpty)
(99, true)
```

Select:

```
>>> LinkedList(1:99)
>>> .select(isEven:/1)
>>> .contents
[2, 4 .. 98]
```

Avoid intermediate collection:

```
>>> LinkedList(1:9)
>>> .selectThenCollect(
>>> 	isEven:/1,
>>> 	square:/1
>>> ).contents
[4 16 36 64]
```

Avoid intermediate collection:

```
>>> LinkedList(1:9)
>>> .collectThenSelect(square:/1) { :each |
>>> 	each > 36
>>> }.contents
[49 64 81]
```

Indexing and mutation:

```
>>> let l = LinkedList(1:5);
>>> l[1] := -1;
>>> (l[1], l[3])
(-1, 3)
```

First link, last link and next link:

```
>>> let l = LinkedList[1 2 3 4 5];
>>> let a = l.firstLink;
>>> let b = l.lastLink;
>>> let c = a.nextLink;
>>> (a.value, b.value, c.value, b.nextLink)
(1, 5, 2, nil)
```

Mutate link value:

```
>>> let l = LinkedList[1 2 3];
>>> l.firstLink.value := -1;
>>> l.contents
[-1 2 3]
```

Is sorted predicte:

```
>>> LinkedList(1:9)
>>> .isSorted
true

>>> LinkedList(9:1:-1)
>>> .isSortedBy(>)
true
```

Indices, answers a `Range`:

```
>>> LinkedList[1, 3 .. 9].indices
1:5
```

Copies are equal but not identical:

```
>>> let a = LinkedList(1:9);
>>> let b = a.copy;
>>> (a = b, a == b)
(true, false)

>>> let a = LinkedList(1:9);
>>> let b = a.copy;
>>> a[3] := -3;
>>> (a[3], b[3])
(-3, 3)
```

* * *

See also: Link, List, Value Link

Guides: List Functions

Categories: Collection, Type
