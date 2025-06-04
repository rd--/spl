+String {

	fileInformation { :self |
		<primitive: return host.fileInformationSync(_self);>
	}

	makeDirectory { :self :allowRecursive :fileMode |
		<primitive: return host.makeDirectorySync(_self, _allowRecursive, _fileMode);>
	}

	modificationTime { :self |
		<primitive: return host.modificationTimeSync(_self);>
	}

	readDirectory { :self |
		<primitive: return host.readDirectorySync(_self);>
	}

	readDirectoryAsync { :self |
		<primitive: return host.readDirectoryAsync(_self);>
	}

	readDirectoryFileNames { :self |
		self.readDirectory.select { :each |
			each['isFile']
		}.collect { :each |
			[self, each['name']].pathJoin
		}
	}

	readDirectoryFileNamesAsync { :self |
		self.readDirectoryAsync.then { :entries |
			entries.select { :each |
				each['isFile']
			}.collect { :each |
				[self, each['name']].pathJoin
			}
		}
	}

	readBinaryFile { :self |
		<primitive: return host.readBinaryFileSync(_self);>
	}

	readTextFile { :self |
		<primitive: return host.readTextFileSync(_self);>
	}

	removeDirectory { :self :recursive |
		<primitive: return host.removeDirectorySync(_self, _recursive);>
	}

	removeFile { :self |
		<primitive: return host.removeFileSync(_self);>
	}

	writeBinaryFile { :self :aByteArray |
		<primitive: return host.writeBinaryFileSync(_self, _aByteArray);>
	}

	writeTextFile { :self :aString |
		<primitive: return host.writeTextFileSync(_self, _aString);>
	}

}

+List {

	readTextFileList { :self |
		<primitive: return host.readTextFileArraySync(_self);>
	}

}

+System {

	temporaryFileName { :unused :prefix :suffix |
		<primitive: return host.makeTemporaryFileSync(_prefix, _suffix);>
	}

}
