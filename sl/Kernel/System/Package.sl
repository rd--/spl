Package : [Object] { | packageName fileNames |

}

+String {

	Package { :self |
		Package(
			self,
			['Package/' ++ self.replaceStringAll('-', '/') ++ '.sl']
		)
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

	packageDictionary { :self |
		self.cached('packageDictionary') {
			()
		}
	}

}

