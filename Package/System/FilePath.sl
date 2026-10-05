FilePath : [Object, Store, Equal] {

	| filePathString |

	absolutePathString { :self |
		let path = self.filePathString;
		path.pathIsAbsolute.if {
			path
		} {
			self.error('absolutePathString')
		}
	}

	asUrl { :self |
		self.filePathString.asFileUrl
	}

	basename { :self |
		self.filePathString.pathBasename
	}

	directory { :self |
		self.filePathString.pathDirectory
	}

	directoryExists { :self |
		system.directoryExists(self.filePathString)
	}

	extension { :self |
		self.filePathString.pathExtension
	}

	fileExists { :self |
		system.fileExists(self.filePathString)
	}

	fileInformation { :self |
		system.fileInformation(self.filePathString)
	}

	makeDirectory { :self :recursive :mode |
		system.makeDirectory(self.filePathString, recursive, mode)
	}

	modificationTime { :self |
		system.modificationTime(self.filePathString)
	}

	readBinaryFile { :self |
		system.readBinaryFile(self.filePathString)
	}

	readDirectoryFileNames { :self |
		system.readDirectoryFileNames(self.filePathString).collect(FilePath/1)
	}

	readTextFile { :self |
		system.readTextFile(self.filePathString)
	}

	removeDirectory { :self :recursive |
		system.removeDirectory(self.filePathString, recursive)
	}

	removeFile { :self |
		system.removeFile(self.filePathString)
	}

	replaceExtension { :self :existing :replacement |
		FilePath(
			self.filePathString.stringReplace(
				existing -> replacement
			)
		)
	}

	stem { :self |
		self.filePathString.pathStem
	}

	writeBinaryFile { :self :data |
		system.writeBinaryFile(self.filePathString, data)
	}

	writeTextFile { :self :data |
		system.writeTextFile(self.filePathString, data)
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
