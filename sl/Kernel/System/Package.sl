Package : [Object] { | name implementationFileNames |

	load { :self |
		system.loadPackage(self)
	}

}

+String {

	derivePackageImplementationFile { :self |
		'Package/' ++ self.replaceStringAll('-', '/') ++ '.sl'
	}

	Package { :self |
		Package(self, [self.derivePackageImplementationFile])
	}

	Package { :self :implementationFileNames |
		newPackage().initializeSlots(self, implementationFileNames)
	}

}

+Array {

	loadPackages { :self |
		self.collect { :each |
			system.packageDictionary.includesIndex(each.name).ifTrue {
				self.error('loadPackages: package exists: ' ++ each.name)
			};
			system.packageDictionary[each.name] := each;
			[each.name, each.implementationFileNames]
		}.loadPackageSequence
	}

}

+@Cache {

	includesPackage { :self :name |
		self.packageDictionary.includesIndex(name)
	}

	loadPackage { :self :package |
		[
			[package.name, package.implementationFileNames]
		].loadPackageSequence.then {
			self.packageDictionary[package.name] := package
		}
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

	registerPackage { :self :package |
		self.packageIndex.includesIndex(package.name).if {
			self.error('registerPackage: package exists: ' ++ package.name)
		} {
			self.packageIndex[package.name] := package
		}
	}

}

