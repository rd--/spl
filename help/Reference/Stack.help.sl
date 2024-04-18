# Stack

- _Stack()_

Answer a new, empty `Stack`.  The protocol is:

- `push`: adds a new object of any kind on top of the stack
- `pop`: answers the first element and removes it from the stack
- `peek`: answer the first element of the stack without removing it

A new stack is empty:

```
>>> let s = Stack();
>>> (s.isEmpty, s.size)
(true, 0)
```

Push an item onto the stack, then inspect it:

```
>>> let s = Stack();
>>> s.push('x');
>>> (s.size, s.peek, s.size)
(1, 'x', 1)
```

Push two items onto the stack, then fetch each:

```
>>> let s = Stack();
>>> s.push('x');
>>> s.push('y');
>>> (s.size, s.pop, s.size, s.pop, s.size)
(2, 'y', 1, 'x', 0)
```

If `Stack` is implemented in terms of `LinkedList`, then
`push` is `addFirst`,
`pop` is `removeFirst`,
`peek` is `first`.

* * *

See also: LinkedList, peek, pop, push

Categories: Collection, Type
