FilePath : [Object, Equatable] { | contents |

	absolutePathString { :self |
		self.contents
	}

	asUrl { :self |
		self.contents.asFileUrl
	}

	directoryExists { :self |
		system.directoryExists(self.contents)
	}

	fileExists { :self |
		system.fileExists(self.contents)
	}

	fileInformation { :self |
		system.fileInformation(self.contents)
	}

	makeDirectory { :self :recursive :mode |
		system.makeDirectory(self.contents, recursive, mode)
	}

	readBinaryFile { :self |
		system.readBinaryFile(self.contents)
	}

	readDirectoryFileNames { :self |
		system.readDirectoryFileNames(self.contents).collect(FilePath:/1)
	}

	readTextFile { :self |
		system.readTextFile(self.contents)
	}

	removeDirectory { :self :recursive |
		system.removeDirectory(self.contents, recursive)
	}

	removeFile { :self |
		system.removeFile(self.contents)
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

	writeBinaryFile { :self :data |
		system.writeBinaryFile(self.contents, data)
	}

	writeTextFile { :self :data |
		system.writeTextFile(self.contents, data)
	}

}

+List {

	readTextFileList { :self |
		system.readTextFileList(self.collect(absolutePathString:/1))
	}

}

+String {

	FilePath { :self |
		newFilePath().initializeSlots(self)
	}

	pathBasename { :self |
		<primitive: return sc.pathBasename(_self);>
	}

	pathDirectory { :self |
		<primitive: return sc.pathDirectory(_self);>
	}

	pathExtension { :self |
		<primitive: return sc.pathExtension(_self);>
	}

	pathIsAbsolute { :self |
		<primitive: return sc.pathIsAbsolute(_self);>
	}

	pathNormalize { :self |
		<primitive: return sc.pathNormalize(_self);>
	}

	splFilePath { :self |
		FilePath(system.splFileName(self))
	}

}

+List {

	pathJoin { :self |
		<primitive: return sc.pathJoin(_self);>
	}

}
