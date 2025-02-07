# systemCommand

- _systemCommand(system, commandName, arguments)_

Run _commandName_ with _arguments_ and answer a `Promise` of the result,
a `Record` with the fields _exitCode_, _outputText_ and _errorText_.

Test that a file exists:

~~~spl async
system
.systemCommand(
	'test',
	[
		'-f',
		'/etc/passwd'
	]
).then { :result |
	result['exitCode'] = 0
}
~~~

Count the words in a file:

~~~spl async
system
.systemCommand(
	'wc',
	[
		'-w',
		'/etc/passwd'
	]
).then { :result |
	result['outputText']
}
~~~

If the system command does not exist an `error` is signaled:

```
>>> {
>>> 	system.systemCommand(
>>> 		'/CommandDoesNotExist',
>>> 		[]
>>> 	)
>>> }.ifError {
>>> 	true
>>> }
true
```

* * *

See also: environmentVariable

Guides: System Functions

Categories: System, Subprocess
