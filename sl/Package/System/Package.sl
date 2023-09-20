(* Requires: Array String *)

Package! : [Object] {

	= { :self :anObject |
		self.primitiveEquals(anObject)
	}

	< { :self :aPackage |
		aPackage.requires.includes(self.name) | {
			self.name < aPackage.name
		}
	}

	<= { :self :aPackage |
		self = aPackage | {
			self < aPackage
		}
	}

	addDependenciesTo { :self :aSequence |
		self.requires.ifNotEmpty { :items |
			aSequence.addAllFirst(items);
			items.do { :each |
				system.packageIndex[each].addDependenciesTo(aSequence)
			}
		}
	}

	category { :self |
		<primitive: return _self.category;>
	}

	dependencies { :self |
		| answer = []; |
		self.addDependenciesTo(answer);
		answer.withoutDuplicates
	}

	load { :self |
		system.loadPackage(self)
	}

	name { :self |
		<primitive: return _self.name;>
	}

	qualifiedName { :self |
		self.category ++ '-' ++ self.name
	}

	requires { :self |
		<primitive: return _self.requires;>
	}

	text { :self |
		<primitive: return _self.text;>
	}

	url { :self |
		<primitive: return _self.url;>
	}

}

+@Dictionary {

	derivePackageUrl { :self |
		['Package/', self::Category, '/', self::Name, '.sl'].join
	}

	Package { :self |
		Package(
			self::Category :?= { system.categoryDictionary.categoryOf(self::Name) },
			self::Name,
			self::Requires :? { [] },
			self::Url :? { self.derivePackageUrl },
			''
		)
	}

}

+String {

	isQualifiedPackageName { :self |
		self.includesSubstring('-')
	}

	Package { :self :name :requires :url :text |
		<primitive: return new sl.Package(_self, _name, _requires, _url, _text);>
	}

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

	parseQualifiedPackageName { :self |
		| [category, name] = self.splitBy('-'); |
		[category, name]
	}

}

+Array {

	loadPackages { :self |
		self.do { :each |
			system.packageDictionary.includesIndex(each.name).ifTrue {
				self.error('loadPackages: package exists: ' ++ each.name)
			};
			system.packageDictionary[each.name] := each
		};
		self.collect(name:/1).loadPackageSequence
	}

}

+@Cache {

	availablePackages { :self |
		self.indexedPackages.difference(self.loadedPackages)
	}

	indexedPackages { :self |
		self.packageIndex.values
	}

	includesPackage { :self :name |
		self.packageDictionary.includesIndex(name)
	}

	loadedPackages { :self |
		self.packageDictionary.values
	}

	loadPackage { :self :package |
		[
			package.category ++ '-' ++ package.name
		].loadLocalPackageSequence.then {
			self.packageDictionary[package.name] := package
		}
	}

	package { :self :name |
		self.packageIndex[name]
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
