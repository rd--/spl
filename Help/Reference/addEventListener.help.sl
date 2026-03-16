# addEventListener

- _addEventListener(x, e, :/1)_

Request that the unary block _f_ be evaluated whenever the event specified by the string _e_ is delivered to the event target _x_.

Listen for mouse movement events at the system window:

~~~spl ui
system
.window
.addEventListener('mousemove') { :event |
	(
		event.type,
		event.x,
		event.y
	).postLine
}
~~~

* * *

See also: dispatchEvent, removeEventListener
