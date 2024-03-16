# SmallProgram

A simple `View` for working with a small program.

A _program_ is entered into a _text area_.
Programs may span multiple lines and the text are will expand as required.

A small program may optionally have a _description_ and an _expected answer_.

~~~
let description = '# A Description\n\nOf a small program.';
let program = '3 + 4';
let expectedAnswer = '7';
let smallKansas = system.smallKansas;
let smallProgram = smallKansas.SmallProgram(description, program, expectedAnswer);
smallKansas.addFrame(smallProgram, nil)
~~~

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

~~~
let url = 'https://rohandrape.net/sw/stsc3/lib/png/squeak-mouse.png';
url.fetchBlob
~~~

* * *

See also: Notebook, SmallKansas
