(* Requires: Array String System *)

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
		self.requires.ifNotEmpty { :packageNames |
			|(
				packages = packageNames.collect { :each |
					system.package(each)
				}
			)|
			aSequence.addAllFirst(packages);
			packages.do { :each |
				each.addDependenciesTo(aSequence)
			}
		}
	}

	category { :self |
		<primitive: return _self.category;>
	}

	dependencies { :self |
		| answer = []; |
		self.addDependenciesTo(answer);
		answer.copyWithoutDuplicates
	}

	require { :self |
		self.isLoaded.ifFalse {
			| requirements = self.dependencies.reject(isLoaded:/1).collect(name:/1); |
			(requirements ++ [self.name]).primitiveLoadPackageSequence
		}
	}

	isLoaded { :self |
		<primitive: return _self.isLoaded;>
	}

	load { :self |
		system.loadPackage(self)
	}

	name { :self |
		<primitive: return _self.name;>
	}

	pseudoSlotNameArray { :self |
		['category', 'name', 'requires', 'url', 'text', 'isLoaded']
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
		[self::Category, '/', self::Name, '.sl'].join
	}

	Package { :self |
		Package(
			self::Category :=? { system.categoryDictionary.categoryOf('type', self::Name) },
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
					| [category, name] = value.withBlanksTrimmed.parseQualifiedPackageName; |
					['Category' -> category, 'Name' -> name]
				},
				'Requires' -> {
					[key -> value.withBlanksTrimmed.words]
				}
			]) {
				self.error('parsePackageHeader: unknown field: ' ++ key)
			}
		}.concatenation.asRecord
	}

	parseQualifiedPackageName { :self |
		| [category, name] = self.splitBy('-'); |
		[category, name]
	}

}

+Array {

	loadPackages { :self |
		self.do { :each |
			each.isLoaded.ifTrue {
				self.error('loadPackages: package loaded: ' ++ each.name)
			}
		};
		self.collect(name:/1).primitiveLoadPackageSequence
	}

}

+System {

	availablePackages { :self |
		self.indexedPackages.difference(self.loadedPackages)
	}

	indexedPackages { :self |
		self.packageDictionary.values
	}

	includesPackage { :self :name |
		self.packageDictionary.includesIndex(name)
	}

	loadedPackages { :self |
		self.packageDictionary.values.select(isLoaded:/1)
	}

	loadPackage { :self :package |
		[
			package.qualifiedName
		].loadLocalPackageSequence
	}

	package { :self :name |
		name.isQualifiedPackageName.if {
			|(
				[categoryName, packageName] = name.parseQualifiedPackageName,
				package = self.packageDictionary[packageName]
			)|
			(categoryName = package.category & {
				self.includesPackage(packageName)
			}).if {
				package
			} {
				self.error('package: category name mismatch or package not registered')
			}
		} {
			self.includesPackage(name).if {
				self.packageDictionary[name]
			} {
				self.error('package: package not registered')
			}
		}
	}

	registerPackage { :self :package |
		self.packageDictionary.includesIndex(package.name).if {
			self.error('registerPackage: package exists: ' ++ package.name)
		} {
			self.packageDictionary[package.name] := package
		}
	}

}
