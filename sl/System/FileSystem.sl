+String {

	readFile { :self |
		<primitive: return Deno.readFile(_self);>
	}

	readTextFile { :self |
		<primitive: return Deno.readTextFile(_self);>
	}

	writeFile { :self :aByteArray |
		<primitive: return Deno.writeFile(_self, _aByteArray);>
	}

	writeTextFile { :self :aString |
		<primitive: return Deno.writeTextFile(_self, _aString);>
	}

}
