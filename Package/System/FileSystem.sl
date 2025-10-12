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

	makeDirectory { :unused :aString :allowRecursive :fileMode |
		<primitive: return host.makeDirectorySync(_aString, _allowRecursive, _fileMode);>
	}

	modificationTime { :unused :aString |
		<primitive: return host.modificationTimeSync(_aString);>
	}

	readDirectory { :unused :aString |
		<primitive: return host.readDirectorySync(_aString);>
	}

	readDirectoryAsync { :unused :aString |
		<primitive: return host.readDirectoryAsync(_aString);>
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

	removeDirectory { :unused :aString :recursive |
		<primitive: return host.removeDirectorySync(_aString, _recursive);>
	}

	removeFile { :unused :aString |
		<primitive: return host.removeFileSync(_aString);>
	}

	temporaryFileName { :unused :prefix :suffix |
		<primitive: return host.makeTemporaryFileSync(_prefix, _suffix);>
	}

	writeBinaryFile { :unused :aString :aByteArray |
		<primitive: return host.writeBinaryFileSync(_aString, _aByteArray);>
	}

	writeTextFile { :unused :aString :anotherString |
		<primitive: return host.writeTextFileSync(_aString, _anotherString);>
	}

}
