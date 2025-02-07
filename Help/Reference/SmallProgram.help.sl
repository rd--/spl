# SmallProgram

A simple `View` for working with a small program.

A _program_ is entered into a _text area_.
Programs may span multiple lines and the text are will expand as required.
To evaluate the program type _Shift-Enter_.
When a program is evaluated the _answer_ is displayed in an answer cell.
`SmallProgram` uses the `typeOf` the answer to decide how to display it.
The answer cell stores the program use to construct it,
which may be viewed by hovering over the answer.

_Shift-UpArrow_ and _Shift-DownArrow_ allow retrieving previous programs.

A small program may optionally have a _description_ and an _expected answer_.

~~~spl ui
let description = [
	'# A Description'
	''
	'Of a small program.'
].unlines;
let program = '3 + 4';
let expectedAnswer = '7';
let smallKansas = system.smallKansas;
let smallProgram = smallKansas.SmallProgram(
	description,
	program,
	expectedAnswer
);
smallKansas.addFrame(
	smallProgram,
	nil
)
~~~

If an answer is a `Promise`,
then `SmallProgram` will add a listener to the `Promise` object and update the answer cell when the promise resolves.

Answer a `Promise` that will resolve,
with the `String` 'Answer',
after ten seconds:

~~~spl async
{ :resolve:/1 :unused |
	{
		resolve('Answer')
	}.valueAfter(10)
}.Promise
~~~

Answer a `Promise` with a `Blob` when the `fetch` request completes:

~~~spl async
system
.splUrl('svg/ScProgramBrowser.3.svg')
.fetchBlob
.thenElse(identity:/1, identity:/1)
~~~

* * *

See also: Notebook, SmallKansas

Categories: Kansas
