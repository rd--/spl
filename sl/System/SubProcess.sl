+System {

	currentWorkingDirectory { :self |
		<primitive: return host.currentWorkingDirectory();>
	}

	environmentVariable { :self :name |
		<primitive: return host.environmentVariableGet(_name);>
	}

	environmentVariable { :self :name :aString |
		<primitive: return host.environmentVariableSet(_name, _aString);>
	}

	environmentVariables { :self |
		<primitive: return host.environmentVariables();>
	}

	exit { :self :exitCode |
		<primitive: host.exit(_exitCode);>
	}

	hostName { :self |
		<primitive: return host.hostName();>
	}

	instructionSetArchitecture { :self |
		<primitive: return host.instructionSetArchitecture();>
	}

	operatingSystem { :self |
		<primitive: return host.operatingSystem();>
	}

	scriptArguments { :self |
		<primitive: return Deno.args;>
	}

	systemCommand { :self :commandName :arguments |
		<primitive: return host.systemCommand(_commandName, _arguments);>
	}

}
