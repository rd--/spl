SmallKansas : [Object] { | container frameSet |

	addFrame { :self :subject |
		| frame = Frame(subject, { :frame |
			self.removeFrame(frame)
		}); |
		self.frameSet.add(frame);
		self.container.appendChild(frame.outerElement);
		frame
	}

	addFrameFor { :self :subject :event |
		| frame = self.addFrame(subject); |
		event.ifNotNil {
			frame.setPosition(event.x, event.y)
		};
		frame
	}

	browserOn { :self :path :event |
		system.isTraitName(path[1]).if {
			self.addFrame(TraitBrowser().path(path))
		} {
			system.isTypeName(path[1]).if {
				self.addFrameFor(TypeBrowser().path(path), event)
			} {
				('SmallKansas>>browserOn: not a trait or type: ' ++ path[1]).postLine
			}
		}
	}

	categoryBrowser { :self :event |
		self.addFrameFor(CategoryBrowser(), event)
	}

	contextMenu { :self :menu :event |
		| frame = self.addFrameFor(menu, event); |
		menu.onSelect := {
			self.removeFrame(frame)
		};
		frame
	}

	contextMenuDialog { :self :menu :event |
		| dialog = 'dialog'.createElement; |
		dialog.appendChild(menu.outerElement);
		dialog.style.setProperty('left', event.x.asString ++ 'px', '');
		dialog.style.setProperty('top', event.y.asString ++ 'px', '');
		self.container.appendChild(dialog);
		dialog.showModal;
		menu.onSelect := {
			dialog.close
		};
		dialog
	}

	helpBrowser { :self :event |
		self.addFrameFor(workspace::smallHours.helpBrowser, event)
	}

	helpFor { :self :subject :event |
		workspace::smallHours.helpFor(subject).then { :aString |
			self.addFrameFor(TextEditor('Help For: ' ++ subject, true, aString), event)
		}
	}

	implementorsOf { :self :subject :event |
		|
			bracketedSubject = '>>' ++ subject ++ ':/',
			methodSignatures = system.allMethods.collect(signature:/1).select { :each |
				each.includesSubstring(bracketedSubject)
			}.IdentitySet.Array.sorted ;
		|
		self.addFrameFor(MethodSignatureBrowser(methodSignatures), event)
	}

	initialize { :self |
		self.container.addEventListener('contextmenu', { :event |
			event.preventDefault;
			(event.target == self.container).ifTrue {
				self.worldContextMenu(event)
			}
		});
		self
	}

	methodBrowser { :self :event |
		self.addFrameFor(MethodBrowser(), event)
	}

	methodSignatureBrowser { :self :event |
		self.addFrameFor(MethodSignatureBrowser(), event)
	}

	programBrowser { :self :event |
		self.addFrameFor(workspace::smallHours.programBrowser, event)
	}

	removeFrame { :self :frame |
		frame.outerElement.remove;
		self.frameSet.remove(frame)
	}

	systemBrowser { :self :event |
		self.addFrameFor(SystemBrowser(), event)
	}

	traitBrowser { :self :event |
		self.addFrameFor(TraitBrowser(), event)
	}

	typeBrowser { :self :event |
		self.addFrameFor(TypeBrowser(), event)
	}

	worldContextMenu { :self :event |
		self.contextMenu(Menu('World Menu', self.worldMenuEntries), event)
	}

	worldMenu { :self |
		self.addFrameFor(Menu('World Menu', self.worldMenuEntries), nil)
	}

	worldMenuEntries { :self |
		[
			'Category Browser' -> { :event |
				self.categoryBrowser(event)
			},
			'Help Browser' -> { :event |
				self.helpBrowser(event)
			},
			'Method Browser' -> { :event |
				self.methodBrowser(event)
			},
			'Method Signature Browser' -> { :event |
				self.methodSignatureBrowser(event)
			},
			'Program Browser' -> { :event |
				self.programBrowser(event)
			},
			'Reset Synthesiser' -> { :event |
				workspace::clock.clear;
				system.defaultScSynth.reset
			},
			'System Browser' -> { :event |
				self.systemBrowser(event)
			},
			'Trait Browser' -> { :event |
				self.traitBrowser(event)
			},
			'Type Browser' -> { :event |
				self.typeBrowser(event)
			},
			'Workspace' -> { :event |
				self.addFrameFor(TextEditor('Workspace', false, '(* Workspace *)'), event)
			}
		]
	}

}

+ Array {


	MethodSignatureBrowser { :self |
		ColumnBrowser('Method Signature Browser', false, [1], { :browser :path |
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
		).initialize
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
