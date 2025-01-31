# addEventListener

- _addEventListener(anEventTarget, aString, aBlock:/1)_

Request that _aBlock_ be evaluated whenever the event specified by _aString_ is delivered to the _anEventTarget_.

~~~spl kansasProgram=A
system.window.addEventListener('mousemove') { :event |
	(event.type, event.x, event.y).postLine
}
~~~

* * *

See also: dispatchEvent, removeEventListener
