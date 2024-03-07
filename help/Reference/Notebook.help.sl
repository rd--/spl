# Notebook

A simple model of a _computational notebook_.

_Programs_ are entered into numbered _program cells_.
Programs may span multiple lines and the program box will expand as required.

When a program is _evaluated_ (by typing _Control-Enter_) the answer is displayed in an _answer cell_,
and a new program cell is created.
The `Notebook` uses the `typeOf` the answer to decide how to display it.

_Control-UpArrow_ and _Control-DownArrow_ allow retrieving previous programs.

If an answer is a `Promise`, the `Notebook` will add a listener to the `Promise` object and update the answer cell when the promise resolves:

~~~
{ :resolve:/1 :unused |
	{
		resolve('Answer')
	}.valueAfter(10)
}.Promise
~~~

* * *

See also: SmallKansas
