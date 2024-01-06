+System {

	architecture { :self |
		<primitive: return host.getArch();>
	}

	currentWorkingDirectory { :self |
		<primitive: return host.getCwd();>
	}

	environmentVariable { :self :name |
		<primitive: return host.getEnv(_name);>
	}

	environmentVariables { :self |
		<primitive: return host.getEnviron();>
	}

	exit { :self :exitCode |
		<primitive: host.exit(_exitCode);>
	}

	hostname { :self |
		<primitive: return host.getHostname();>
	}

	operatingSystem { :self |
		<primitive: return host.getOs;>
	}

	scriptArguments { :self |
		<primitive: return Deno.args;>
	}

	systemCommand { :self :commandName :arguments |
		<primitive: return host.systemCommand(_commandName, _arguments);>
	}

}
