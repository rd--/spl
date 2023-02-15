SmallKansas : [Object] { | container frameSet |

	addFrame { :self :subject |
		| frame = Frame(subject); |
		self.frameSet.add(frame);
		self.container.appendChild(frame.outerElement)
	}

	categoryBrowser { :self |
		self.addFrame(CategoryBrowser())
	}

	methodBrowser { :self |
		self.addFrame(MethodBrowser())
	}

	smallHoursHelpBrowser { :self |
		self.addFrame(workspace::smallHours.helpBrowser)
	}

	smallHoursProgramBrowser { :self |
		self.addFrame(workspace::smallHours.programBrowser)
	}

	systemBrowser { :self |
		self.addFrame(SystemBrowser())
	}

	helpFor { :self :subject |
		workspace::smallHours.helpFor(subject).then { :aString |
			self.addFrame(TextEditor('Help For: ' ++ subject, true, aString))
		}
	}

	traitBrowser { :self |
		self.addFrame(TraitBrowser())
	}

	typeBrowser { :self |
		self.addFrame(TypeBrowser())
	}

	worldMenu { :self |
		self.addFrame(
			Menu(
				'WorldMenu',
				[
					'Category Browser' -> { self.categoryBrowser },
					'Method Browser' -> { self.methodBrowser },
					'Small Hours Help Browser' -> { self.smallHoursHelpBrowser },
					'Small Hours Program Browser' -> { self.smallHoursProgramBrowser },
					'System Browser' -> { self.systemBrowser },
					'Trait Browser' -> { self.traitBrowser },
					'Type Browser' -> { self.typeBrowser }
				]
			)
		)
	}

}

+ Void {

	SmallKansas {
		newSmallKansas().initializeSlots(
			'smallKansas'.getElementById,
			IdentitySet()
		)
	}

	MethodBrowser {
		| methodNames = system.allMethods.collect(qualifiedName:/1).IdentitySet.Array.sorted ; |
		ColumnBrowser('MethodBrowser', false, [3, 1], { :browser :path |
			path.size.caseOf([
				0 -> {
					methodNames
				},
				1 -> {
					system.methodTraits(path[1]) ++ system.methodTypes(path[1])
				},
				2 -> {
					system.traitOrType(path[2]).methodDictionary[path[1]].definition
				}
			])
		})
	}

	CategoryBrowser {
		|
			typeNames = system.typeDictionary.keys.sorted,
			categoryNames = typeNames.collect { :each | system.categoryOf(each) }.IdentitySet.Array.sorted,
			methodSet = nil;
		|
		ColumnBrowser('CategoryBrowser', false, [1, 1, 3], { :browser :path |
			path.size.caseOf([
				0 -> {
					browser.setStatus('');
					categoryNames
				},
				1 -> {
					browser.setStatus('');
					system.categoryDictionary[path[1]].select { :each | system.isTypeName(each) }.Array.sorted
				},
				2 -> {
					browser.setStatus(system.typeTraits(path[2]).joinSeparatedBy(', '));
					methodSet := system.typeMethodSet(path[2]).select { :each | each.origin.name ~= 'Object' };
					methodSet.collect(qualifiedName:/1).Array.sorted
				},
				3 -> {
					| method = methodSet.detect { :each | each.qualifiedName = path[3] }; |
					browser.setStatus(method.origin.name);
					method.definition
				}
			])
		})
	}

	SystemBrowser {
		| typeNames = system.typeDictionary.keys.sorted, methodSet = nil; |
		ColumnBrowser('SystemBrowser', false, [1, 3], { :browser :path |
			path.size.caseOf([
				0 -> {
					browser.setStatus('');
					typeNames
				},
				1 -> {
					browser.setStatus(system.typeTraits(path[1]).joinSeparatedBy(', '));
					methodSet := system.typeMethodSet(path[1]).select { :each | each.origin.name ~= 'Object' };
					methodSet.collect(qualifiedName:/1).Array.sorted
				},
				2 -> {
					| method = methodSet.detect { :each | each.qualifiedName = path[2] }; |
					browser.setStatus(method.origin.name);
					method.definition
				}
			])
		})
	}

	TraitBrowser {
		| traitNames = system.traitDictionary.keys.sorted; |
		ColumnBrowser('TraitBrowser', false, [1, 3], { :browser :path |
			path.size.caseOf([
				0 -> {
					browser.setStatus('');
					traitNames
				},
				1 -> {
					browser.setStatus(system.traitTypes(path[1]).joinSeparatedBy(', '));
					system.traitDictionary[path[1]].methodDictionary.keys.sorted
				},
				2 -> {
					system.traitDictionary[path[1]].methodDictionary[path[2]].definition
				}
			])
		})
	}

	TypeBrowser {
		| typeNames = system.typeDictionary.keys.sorted; |
		ColumnBrowser('TypeBrowser', false, [1, 3], { :browser :path |
			path.size.caseOf([
				0 -> {
					browser.setStatus('');
					typeNames
				},
				1 -> {
					browser.setStatus(system.typeTraits(path[1]).joinSeparatedBy(', '));
					system.typeDictionary[path[1]].methodDictionary.keys.sorted
				},
				2 -> {
					system.typeDictionary[path[1]].methodDictionary[path[2]].definition
				}
			])
		})
	}

}
