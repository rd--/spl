# SmallProgram

A simple `View` for working with a small program.

A _programs_ is entered into a _text area_.
Programs may span multiple lines and the text are will expand as required.

When a program is _evaluated_ (by typing _Shift-Enter_) the answer is displayed in an _answer cell_.
`SmallProgram` uses the `typeOf` the answer to decide how to display it.

_Shift-UpArrow_ and _Shift-DownArrow_ allow retrieving previous programs.

If an answer is a `Promise`,
then `SmallProgram` will add a listener to the `Promise` object and update the answer cell when the promise resolves:

~~~
{ :resolve:/1 :unused |
	{
		resolve('Answer')
	}.valueAfter(10)
}.Promise
~~~

* * *

See also: Notebook, SmallKansas
