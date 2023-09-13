Package : [Object] { | packageName fileNames |

	load { :self |
		[
			[self.packageName, self.fileNames]
		].loadPackageSequence;
		system.packageDictionary[self.packageName] := self
	}

}

+String {

	packageImplementationFile { :self |
		'Package/' ++ self.replaceStringAll('-', '/') ++ '.sl'
	}

	Package { :self |
		Package(self, [self.packageImplementationFile])
	}

	Package { :self :fileNames |
		newPackage().initializeSlots(self, fileNames)
	}

}

+Array {

	loadPackages { :self |
		self.collect { :each |
			system.packageDictionary.includesIndex(each.packageName).ifTrue {
				self.error('loadPackages: package exists: ' ++ each.packageName)
			};
			system.packageDictionary[each.packageName] := each;
			[each.packageName, each.fileNames]
		}.loadPackageSequence
	}

}

+@Cache {

	includesPackage { :self :packageName |
		self.packageDictionary.includesIndex(packageName)
	}

	packageDictionary { :self |
		self.cached('packageDictionary') {
			()
		}
	}

	packageIndex { :self |
		self.cached('packageIndex') {
			()
		}
	}

}

