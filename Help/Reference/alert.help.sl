# alert

- _alert(w, s)_

Display an alert at the window _w_ showing the string _s_,
and wait until the alert is acknowledged.
In a console this will wait for a particular keypress, usually _Enter_.
In a windowing system this will wait until a dialog is dismissed.
Answers `nil`.

Show an alert:

~~~spl ui
system.window.alert('An alert')
~~~

* * *

See also: confirm, prompt
