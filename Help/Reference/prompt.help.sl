# prompt

- _prompt(aWindow, aString, defaultAnswer)_

Display _aString_ and wait until a text reply is typed.
In a console this will wait for a line of text to be entered.
In a windowing system this will wait until a modal dialog with a text field is filled in.
Answers a `String` holding the text provided.

~~~spl program=Interactive
system.window.prompt('Prompt', '')
~~~

* * *

See also: alert, confirm
