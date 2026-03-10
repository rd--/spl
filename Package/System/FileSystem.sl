+System {

	directoryExists { :self :aString |
		{
			self.fileInformation(aString).at('isDirectory')
		}.ifError {
			false
		}
	}

	fileExists { :self :aString |
		{
			self.fileInformation(aString).at('isFile')
		}.ifError {
			false
		}
	}

	fileInformation { :unused :aString |
		<primitive: return host.fileInformationSync(_aString);>
	}

	makeDirectory { :unused :fileName :allowRecursive :fileMode |
		<primitive: return host.makeDirectorySync(_fileName, _allowRecursive, _fileMode);>
	}

	modificationTime { :unused :fileName |
		<primitive: return host.modificationTimeSync(_fileName);>
	}

	readDirectory { :unused :fileName |
		<primitive: return host.readDirectorySync(_fileName);>
	}

	readDirectoryAsync { :unused :fileName |
		<primitive: return host.readDirectoryAsync(_fileName);>
	}

	readDirectoryFileNames { :self :aString |
		self.readDirectory(aString).select { :each |
			each['isFile']
		}.collect { :each |
			[aString, each['name']].pathJoin
		}
	}

	readDirectoryFileNamesAsync { :self :aString |
		self.readDirectoryAsync(aString).then { :entries |
			entries.select { :each |
				each['isFile']
			}.collect { :each |
				[aString, each['name']].pathJoin
			}
		}
	}

	readBinaryFile { :unused :aString |
		<primitive: return host.readBinaryFileSync(_aString);>
	}

	readTextFile { :unused :aString |
		<primitive: return host.readTextFileSync(_aString);>
	}

	readTextFileList { :unused :aList |
		<primitive: return host.readTextFileArraySync(_aList);>
	}

	removeDirectory { :unused :fileName :recursive |
		<primitive: return host.removeDirectorySync(_fileName, _recursive);>
	}

	removeFile { :unused :fileName |
		<primitive: return host.removeFileSync(_fileName);>
	}

	temporaryFileName { :unused :prefix :suffix |
		<primitive: return host.makeTemporaryFileSync(_prefix, _suffix);>
	}

	writeBinaryFile { :unused :fileName :aByteArray |
		<primitive: return host.writeBinaryFileSync(_fileName, _aByteArray);>
	}

	writeTextFile { :unused :fileName :aString |
		<primitive: return host.writeTextFileSync(_fileName, _aString);>
	}

}
