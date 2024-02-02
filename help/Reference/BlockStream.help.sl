# BlockStream -- stream type

- _BlockStream(nextBlock:/0, resetBlock:/0)_

BlockStream implements the Iterator and Stream traits.

BlockStream provides a simple model for many kinds of streams,
with the restriction that the stream cannot be copied.

BlockStream implements _collect_, _reject_ and select_,
as well as the _adaptTo_ protocol and the usual math operators.

* * *

See also: CollectionStream, Stream
