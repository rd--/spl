# systemCommand -- subprocess

- _systemCommand(commandName, arguments)_

Run _commandName_ with _arguments_ and answer a Promise of the exit code.

	'cat'.systemCommand(['/etc/pwd']).then { :exitCode | exitCode.postLine }
