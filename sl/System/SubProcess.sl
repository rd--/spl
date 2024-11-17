+System {

	currentWorkingDirectory { :self |
		<primitive: return host.getCwd();>
	}

	environmentVariable { :self :name |
		<primitive: return host.getEnv(_name);>
	}

	environmentVariable { :self :name :aString |
		<primitive: return host.setEnv(_name, _aString);>
	}

	environmentVariables { :self |
		<primitive: return host.getEnviron();>
	}

	exit { :self :exitCode |
		<primitive: host.exit(_exitCode);>
	}

	hostName { :self |
		<primitive: return host.getHostname();>
	}

	instructionSetArchitecture { :self |
		<primitive: return host.getArch();>
	}

	operatingSystem { :self |
		<primitive: return host.getOs();>
	}

	scriptArguments { :self |
		<primitive: return Deno.args;>
	}

	systemCommand { :self :commandName :arguments |
		<primitive: return host.systemCommand(_commandName, _arguments);>
	}

}
