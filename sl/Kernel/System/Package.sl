Package : [Object] { | category name requires implementation |

	load { :self |
		system.loadPackage(self)
	}

}

+@Dictionary {

	derivePackageImplementation { :self |
		[['Package/', self::category, '/', self::name, '.sl'].join]
	}


	Package { :self |
		newPackage().initializeSlots(
			self::category :?= { system.categoryDictionary.categoryOf(self::name) },
			self::name,
			self::requires :? { [] },
			self::implementation :? { self.derivePackageImplementation }
		)
	}

}

+String {

	Package { :self |
		| [category, name] = self.splitBy('-'); |
		(category: category, name: name).Package
	}

}

+Array {

	loadPackages { :self |
		self.collect { :each |
			system.packageDictionary.includesIndex(each.name).ifTrue {
				self.error('loadPackages: package exists: ' ++ each.name)
			};
			system.packageDictionary[each.name] := each;
			[each.name, each.implementation]
		}.loadPackageSequence
	}

}

+@Cache {

	includesPackage { :self :name |
		self.packageDictionary.includesIndex(name)
	}

	loadPackage { :self :package |
		[
			[package.name, package.implementation]
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
