+System {

	currentWorkingDirectory { :unused |
		<primitive: return host.currentWorkingDirectory();>
	}

	currentWorkingDirectory { :unused :aPath |
		<primitive: host.changeCurrentWorkingDirectory(_aPath);>
		aPath
	}

	environmentVariable { :unused :name |
		<primitive: return host.environmentVariableGet(_name);>
	}

	environmentVariable { :unused :name :aString |
		<primitive: return host.environmentVariableSet(_name, _aString);>
	}

	environmentVariables { :unused |
		<primitive: return host.environmentVariables();>
	}

	exit { :unused :exitCode |
		<primitive: host.exit(_exitCode);>
	}

	hostName { :unused |
		<primitive: return host.hostName();>
	}

	instructionSetArchitecture { :unused |
		<primitive: return host.instructionSetArchitecture();>
	}

	operatingSystem { :unused |
		<primitive: return host.operatingSystem();>
	}

	primitiveSystemCommand { :unused :commandName :arguments |
		<primitive: return host.systemCommand(_commandName, _arguments);>
	}

	scriptArguments { :unused |
		<primitive: return Deno.args;>
	}

	systemCommand { :self :commandName :arguments |
		commandName.isString.ifFalse {
			self.error('systemCommand: invalid command name' ++ commandName)
		};
		arguments.isList.ifFalse {
			self.error('systemCommand: invalid arguments' ++ arguements)
		};
		self.primitiveSystemCommand(commandName, arguments)
	}

}
