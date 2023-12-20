+System {

	architecture { :self |
		<primitive: return Deno.build.arch;>
	}

	currentWorkingDirectory { :self |
		<primitive: return Deno.cwd();>
	}

	environmentVariable { :self :name |
		<primitive: return Deno.env.get(_name);>
	}

	environmentVariables { :self |
		<primitive: return Deno.env.toObject();>
	}

	exit { :self :exitCode |
		<primitive: Deno.exit(_exitCode);>
	}

	hostname { :self |
		<primitive: return Deno.hostname();>
	}

	operatingSystem { :self |
		<primitive: return Deno.build.os;>
	}

	scriptArguments { :self |
		<primitive: return Deno.args;>
	}

	systemCommand { :self :commandName :arguments |
		<primitive:
		const command = new Deno.Command(_commandName, {args: _arguments});
		return command.output().then(function(result) {
			return {
				exitCode: result.code,
				outputText: new TextDecoder().decode(result.stdout),
				errorText: new TextDecoder().decode(result.stderr)
			};
		});
		>
	}

}
