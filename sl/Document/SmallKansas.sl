SmallKansas : [Object] { | container frameSet midi |

	addFrame { :self :subject |
		| frame = Frame(subject); |
		subject.frame := frame;
		frame.zIndex := self.zIndices.max + 1;
		self.frameSet.add(frame);
		self.container.appendChild(frame.outerElement);
		frame
	}

	addFrameFor { :self :subject :event |
		| frame = self.addFrame(subject); |
		event.ifNotNil {
			frame.moveTo(event.x, event.y)
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

	clock { :self :event |
		|
			textEditor = TextEditor('Clock', false, ''),
			setTime = {
				textEditor.setEditorText(system.unixTimeInMilliseconds.roundTo(1000).TimeStamp.iso8601)
			},
			timerId = setTime.evaluateEveryMilliseconds(1000),
			frame = self.addFrameFor(textEditor, event);
		|
		textEditor.editable := false;
		frame.outerElement.style.setProperties((height: '5em', width: '20em'));
		frame.addListener { :event |
			(event = 'close').ifTrue {
				timerId.cancel
			}
		};
		setTime();
		frame
	}

	contextMenu { :self :menu :event |
		| frame = self.addFrameFor(menu, event); |
		menu.persistent := false;
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

	font { :self |
		self.container.style.getPropertyValue('--font-family')
	}

	font { :self :fontName|
		self.container.style.setProperty('--font-family', fontName, '')
	}

	fontMenu { :self :event |
		self.addFrameFor(Menu('Font Menu', self.fontMenuEntriesOn(self)), event)
	}

	fontMenuEntriesOn { :self :subject |
		['APL333', 'Los Altos', 'Parc Place'].collect { :fontName |
			fontName -> { :unusedEvent |
				subject.font := fontName
			}
		}
	}

	fontMenuOn { :self :subject :event |
		self.addFrameFor(Menu('Font Menu', self.fontMenuEntriesOn(subject)), event)
	}

	fontSize { :self :fontSize |
		['fontSize', fontSize.asString ++ 'em'].postLine;
		self.container.style.setProperty('--font-size', fontSize.asString ++ 'em', '')
	}

	fontSizeMenuEntries { :self |
(*
			'½' -> 0.5, '⅗' -> 0.6, '⅝' -> 0.625, '⅔' -> 0.666, '¾' -> 0.75, '⅘' -> 0.8, '⅚' -> 0.833 , '⅞' -> 0.875,
			'1' -> 1,
			'1+⅒' -> 1.1, '1+⅑' -> 1.111, '1+⅛' -> 1.125, '1+⅐' -> 1.142, '1+⅙' -> 1.166, '1+⅕' -> 1.2, '1+¼' -> 1.25, '1+⅓' -> 1.333, '1+⅜' -> 1.375, '1+⅖' -> 1.4,
			'1+½' -> 1.5, '1+⅗' -> 1.6, '1+⅔' -> 1.666, '1+¾' -> 1.75, '1+⅘' -> 1.8,
			'2' -> 2
*)
		[
			'½' -> 0.5, '⅔' -> 0.666, '¾' -> 0.75, '⅞' -> 0.875,
			'1' -> 1,
			'1+¼' -> 1.25, '1+½' -> 1.5, '1+¾' -> 1.75,
			'2' -> 2
		].collect { :fontSize |
			fontSize.key -> { :unusedEvent |
				self.fontSize := fontSize.value
			}
		}
	}

	fontSizeMenu { :self :event |
		self.addFrameFor(Menu('Font Size Menu', self.fontSizeMenuEntries), event)
	}

	helpBrowser { :self :event |
		self.addFrameFor(workspace::smallHours.helpBrowser, event)
	}

	helpFor { :self :subject :event |
		workspace::smallHours.helpFor(subject).then { :aString |
			self.addFrameFor(
				TextEditor('Help For: ' ++ subject, true, aString),
				event
			)
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
		self.initializeSlots(
			'smallKansas'.getElementById,
			IdentitySet(),
			nil
		);
		self.container.addEventListener('contextmenu', { :event |
			event.preventDefault;
			(event.target == self.container).ifTrue {
				self.worldContextMenu(event)
			}
		});
		self
	}

	initializeMidi { :self |
		self.midi.ifNil {
			system.window.navigator.requestMidiAccess.thenElse { :midiAccess |
				self.midi := midiAccess
			} { :message |
				('SmallKansas>>initializeMidi: no midi: ' + message).postLine
			}
		}
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


	windowMenuEntries { :self |
		| makeEntry = { :frame |
			frame.title -> { :unusedEvent |
				frame.bringToFront
			}
		}; |
		self.frameSet.Array.collect(makeEntry:/1)
	}

	windowMenu { :self :event |
		self.contextMenu(Menu('Window Menu', self.windowMenuEntries), event)
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
			'Clock' -> { :event |
				self.clock(event)
			},
			'Font Menu' -> { :event |
				self.fontMenu(event)
			},
			'Font Size Menu' -> { :event |
				self.fontSizeMenu(event)
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
			'Window Menu' -> { :event |
				self.windowMenu(event)
			},
			'Workspace' -> { :event |
				self.addFrameFor(
					TextEditor('Workspace', false, '(* Workspace *)'),
					event
				)
			}
		]
	}

	zIndices { :self |
		self.frameSet.isEmpty.if { 
			[0]
		} {
			self.frameSet.collect(zIndex:/1)
		}
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
					browser.setStatus(
						system.isTraitName(traitOrTypeName).if {
							'Trait'
						} {
							'Type'
						}
					);
					system.methodLookup(methodName, arity, traitOrTypeName).definition
				}
			])
		})
	}

}

+ Void {

	SmallKansas {
		newSmallKansas().initialize
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
					browser.setStatus(
						system.isTraitName(path[2]).if {
							'Trait'
						} {
							'Type'
						}
					);
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
