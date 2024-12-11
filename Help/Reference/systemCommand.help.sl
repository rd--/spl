# systemCommand

- _systemCommand(system, commandName, arguments)_

Run _commandName_ with _arguments_ and answer a `Promise` of the result,
a `Record` with the fields _exitCode_, _outputText_ and _errorText_.

Test that a file exists:

~~~
system.systemCommand(
	'test',
	['-f', '/etc/passwd']
).then { :result |
	(result['exitCode'] = 0).postLine
}
~~~

Count the words in a file:

~~~
system.systemCommand(
	'wc',
	['-w', '/etc/passwd']
).then { :result |
	result['outputText'].postLine
}
~~~

If the system command does not exist an `Error` is answered:

~~~
system.systemCommand(
	'/noSuchFile', []
).thenElse { :result |
	nil
} { :err |
	err.postLine
}
~~~

* * *

See also: environmentVariable

Guides: System Functions

Categories: System, Subprocess
