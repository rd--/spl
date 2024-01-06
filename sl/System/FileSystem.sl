+String {

	readFile { :self |
		<primitive: return host.readFile(_self);>
	}

	readTextFile { :self |
		<primitive: return host.readTextFile(_self);>
	}

	writeFile { :self :aByteArray |
		<primitive: return host.writeFile(_self, _aByteArray);>
	}

	writeTextFile { :self :aString |
		<primitive: return host.writeTextFile(_self, _aString);>
	}

}
