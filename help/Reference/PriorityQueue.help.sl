# PriorityQueue

- _PriorityQueue()_

Answer an empty `PriorityQueue` with external numeric priority values.
The item with the _least_ priority value is at the front of the queue.

A new priority queue is empty, c.f. `isEmpty` and `size`:

```
>>> let p = PriorityQueue();
>>> (p.isEmpty, p.size)
(true, 0)
```

Individual items are added using `pushWithPriority` and removed using `pop`:

```
>>> let p = PriorityQueue();
>>> p.pushWithPriority('c', 3);
>>> p.pushWithPriority('b', 2);
>>> p.pushWithPriority('a', 1);
>>> (p.pop, p.pop, p.pop)
('a', 'b', 'c')
```

Multiple items can be added using `pushAllWithPriority`,
the items are read from an association list:

```
>>> let p = PriorityQueue();
>>> p.pushAllWithPriority(['c' -> 3, 'b' -> 2, 'a' -> 1]);
>>> (p.pop, p.pop, p.pop)
('a', 'b', 'c')
```

The front of the queue can be inspected using `peek` and `peekPriority`:

```
>>> let p = PriorityQueue();
>>> p.pushWithPriority('a', 1);
>>> (p.peek, p.peekPriority)
('a', 1)
```

The queue can be cleared using `removeAll`:

```
>>> let p = PriorityQueue();
>>> p.pushAllWithPriority(['c' -> 3, 'b' -> 2, 'a' -> 1]);
>>> p.removeAll;
>>> (p.isEmpty, p.size)
(true, 0)
```

Reading, using either `pop`, `peek` or `peekPriority`, from an empty queue answers `nil`:

```
>>> let p = PriorityQueue();
>>> (p.pop, p.peek, p.peekPriority)
(nil, nil, nil)
```

* * *

See also: isEmpty, peek, peekPriority, pop, pushAllWithPriority, pushWithPriority, size

Categories: Collection, Type
