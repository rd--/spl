SmallKansas : [Object] { | container frameSet |

	addFrame { :self :subject |
		| frame = Frame(subject, { :frame | self.removeFrame(frame) }); |
		self.frameSet.add(frame);
		self.container.appendChild(frame.outerElement)
	}

	browserOn { :self :path |
		system.isTraitName(path[1]).if {
			self.addFrame(TraitBrowser().path(path))
		} {
			system.isTypeName(path[1]).if {
				self.addFrame(TypeBrowser().path(path))
			} {
				('SmallKansas>>browserOn: not a trait or type: ' ++ path[1]).postLine
			}
		}
	}

	categoryBrowser { :self |
		self.addFrame(CategoryBrowser())
	}

	helpBrowser { :self |
		self.addFrame(workspace::smallHours.helpBrowser)
	}

	helpFor { :self :subject |
		workspace::smallHours.helpFor(subject).then { :aString |
			self.addFrame(TextEditor('Help For: ' ++ subject, true, aString))
		}
	}

	implementorsOf { :self :subject |
		|
			bracketedSubject = '>>' ++ subject ++ ':/',
			methodSignatures = system.allMethods.collect(signature:/1).select { :each |
				each.includesSubstring(bracketedSubject)
			}.IdentitySet.Array.sorted ;
		|
		self.addFrame(MethodSignatureBrowser(methodSignatures))
	}

	methodBrowser { :self |
		self.addFrame(MethodBrowser())
	}

	methodSignatureBrowser { :self |
		self.addFrame(MethodSignatureBrowser())
	}

	programBrowser { :self |
		self.addFrame(workspace::smallHours.programBrowser)
	}

	removeFrame { :self :frame |
		frame.outerElement.remove;
		self.frameSet.remove(frame)
	}

	selectedTextMenu { :self |
		self.addFrame(
			Menu(
				'Selected Text Menu',
				[
					'Browse It (b)' -> { self.browserOn([system.window.getSelectedText]) },
					'Do It (d)' -> { system.window.getSelectedText.eval },
					'Help For It (h)' -> { workspace::smallKansas.helpFor(system.window.getSelectedText.asMethodName) },
					'Implementors Of It (m)' -> { workspace::smallKansas.implementorsOf(system.window.getSelectedText.asMethodName) },
					'Play It (Enter)' -> { ('{ ' ++  system.window.getSelectedText ++ ' }.play').eval }
				]
			)
		)
	}

	systemBrowser { :self |
		self.addFrame(SystemBrowser())
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
				'World Menu',
				[
					'Category Browser' -> { self.categoryBrowser },
					'Help Browser' -> { self.helpBrowser },
					'Method Browser' -> { self.methodBrowser },
					'Method Signature Browser' -> { self.methodSignatureBrowser },
					'Program Browser' -> { self.programBrowser },
					'Reset Synthesiser' -> {
						workspace::clock.clear;
						system.defaultScSynth.reset
					},
					'Selected Text Menu' -> { self.selectedTextMenu },
					'System Browser' -> { self.systemBrowser },
					'Trait Browser' -> { self.traitBrowser },
					'Type Browser' -> { self.typeBrowser },
					'Workspace' -> { self.addFrame(TextEditor('Workspace', false, '(* Workspace *)')) }
				]
			)
		)
	}

}

+ Array {


	MethodSignatureBrowser { :self |
		ColumnBrowser('Method Signature Browser On', false, [1], { :browser :path |
			path.size.caseOf([
				0 -> {
					self
				},
				1 -> {
					| [traitOrTypeName, methodName, arity] = path[1].parseMethodSignature; |
					system.methodLookup(methodName, arity, traitOrTypeName).definition
				}
			])
		})
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
		ColumnBrowser('Method Browser', false, [3, 1], { :browser :path |
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

	MethodSignatureBrowser {
		MethodSignatureBrowser(
			system.allMethods.collect(signature:/1).IdentitySet.Array.sorted
		)
	}

	CategoryBrowser {
		|
			typeNames = system.typeDictionary.keys.sorted,
			categoryNames = typeNames.collect { :each | system.categoryOf(each) }.IdentitySet.Array.sorted,
			methodSet = nil;
		|
		ColumnBrowser('Category Browser', false, [1, 1, 3], { :browser :path |
			path.size.caseOf([
				0 -> {
					browser.setStatus('');
					categoryNames
				},
				1 -> {
					browser.setStatus('');
					system.categoryDictionary[path[1]].select { :each |
						system.isTypeName(each)
					}.Array.sorted
				},
				2 -> {
					browser.setStatus(system.typeTraits(path[2]).joinSeparatedBy(', '));
					methodSet := system.typeMethodSet(path[2]).select { :each |
						each.origin.name ~= 'Object'
					};
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
		ColumnBrowser('System Browser', false, [1, 3], { :browser :path |
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
		ColumnBrowser('Trait Browser', false, [1, 3], { :browser :path |
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
		ColumnBrowser('Type Browser', false, [1, 3], { :browser :path |
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
