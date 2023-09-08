Package : [Object] { | packageName fileNames |

}

+String {

	Package { :self |
		|(
			path = self.splitBy('/'),
			packageName = path.last.splitBy('.').first
		)|
		Package(packageName, [self])
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

+@SystemCache {

	packageDictionary { :self |
		{ () }.once(self, 'packageDictionary')
	}

}

