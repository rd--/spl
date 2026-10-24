FilePath : [Object, Store, Equal] {

	| pathString |

	Url { :self |
		self.pathString.fileUrl
	}

	absolutePathString { :self |
		let path = self.pathString;
		path.pathIsAbsolute.if {
			path
		} {
			self.error('absolutePathString')
		}
	}

	baseName { :self |
		self.pathString.pathBaseName
	}

	directory { :self |
		self.pathString.pathDirectory
	}

	directoryExists { :self |
		system.directoryExists(self.pathString)
	}

	extension { :self |
		self.pathString.pathExtension
	}

	fileExists { :self |
		system.fileExists(self.pathString)
	}

	fileInformation { :self |
		system.fileInformation(self.pathString)
	}

	makeDirectory { :self :recursive :mode |
		system.makeDirectory(self.pathString, recursive, mode)
	}

	modificationTime { :self |
		system.modificationTime(self.pathString)
	}

	readBinaryFile { :self |
		system.readBinaryFile(self.pathString)
	}

	readDirectoryFileNames { :self |
		system.readDirectoryFileNames(self.pathString).collect(FilePath/1)
	}

	readTextFile { :self |
		system.readTextFile(self.pathString)
	}

	removeDirectory { :self :recursive |
		system.removeDirectory(self.pathString, recursive)
	}

	removeFile { :self |
		system.removeFile(self.pathString)
	}

	replaceExtension { :self :existing :replacement |
		FilePath(
			self.pathString.stringReplace(
				existing -> replacement
			)
		)
	}

	stem { :self |
		self.pathString.pathStem
	}

	writeBinaryFile { :self :data |
		system.writeBinaryFile(self.pathString, data)
	}

	writeTextFile { :self :data |
		system.writeTextFile(self.pathString, data)
	}

}

+List {

	readTextFileList { :self |
		system.readTextFileList(
			self.collect(absolutePathString/1)
		)
	}

}

+String {

	FilePath { :self |
		newFilePath().initializeSlots(self)
	}

	pathBaseName { :self |
		<primitive: return sc.pathBaseName(_self);>
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

	pathStem { :self |
		<primitive: return sc.pathStem(_self);>
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
