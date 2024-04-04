+String {

	readDirectoryFileNames { :self |
		<primitive: return host.readDirectoryFileNames(_self);>
	}

	readBinaryFile { :self |
		<primitive: return host.readBinaryFile(_self);>
	}

	readTextFile { :self |
		<primitive: return host.readTextFile(_self);>
	}

	writeBinaryFile { :self :aByteArray |
		<primitive: return host.writeBinaryFile(_self, _aByteArray);>
	}

	writeTextFile { :self :aString |
		<primitive: return host.writeTextFile(_self, _aString);>
	}

}

+List {

	readTextFileList { :self |
		<primitive: return host.readTextFileArray(_self);>
	}

}
