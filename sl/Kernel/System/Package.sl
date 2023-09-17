Package : [Object] { | category name requires implementation |

	load { :self |
		system.loadPackage(self)
	}

}

+@Dictionary {

	derivePackageImplementation { :self |
		[['Package/', self::Category, '/', self::Name, '.sl'].join]
	}


	Package { :self |
		newPackage().initializeSlots(
			self::Category :?= { system.categoryDictionary.categoryOf(self::Name) },
			self::Name,
			self::Requires :? { [] },
			self::Implementation :? { self.derivePackageImplementation }
		)
	}

}

+String {

	parsePackageHeader { :self |
		| fields = self.firstMlComment.splitBy(','); |
		fields.collect { :each |
			| [key, value] = each.withBlanksTrimmed.splitBy(': '); |
			key.caseOfOtherwise([
				'Package' -> {
					| [category, name] = value.withBlanksTrimmed.splitBy('-'); |
					['Category' -> category, 'Name' -> name]
				},
				'Requires' -> {
					[key -> value.withBlanksTrimmed.words]
				}
			]) {
				self.error('parsePackageHeader: unknown field: ' ++ key)
			}
		}.concatenation.Record
	}

	Package { :self |
		| [category, name] = self.splitBy('-'); |
		(Category: category, Name: name).Package
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
