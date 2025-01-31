# alert

- _alert(aWindow, aString)_

Display _aString_ and wait until the alert is acknowledged.
In a console this will wait for a particular keypress, usually _Enter_.
In a windowing system this will wait until a dialog is dismissed.
Answers `nil`.

~~~spl program=Interactive
system.window.alert('An alert')
~~~

* * *

See also: confirm, prompt
