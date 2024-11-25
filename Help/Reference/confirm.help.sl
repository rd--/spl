# confirm

- _confirm(aWindow, aString)_

Display _aString_ and wait until the notice is confirmed or denied.
In a console this will wait for a particular keypress, usually _y_ or _n_.
In a windowing system this will wait until a modal dialog is processed.
Answers `true` (confirmed) or `false` (denied).

~~~
system.window.confirm('Confirm?')
~~~

* * *

See also: alert, prompt
