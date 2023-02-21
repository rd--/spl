SmallKansas : [Object] { | container frameSet midiAccess |

	addFrameWithAnimator { :self :subject :event :intervalInSeconds :aProcedure:/0 |
		|
			timerId = aProcedure:/0.evaluateEveryMilliseconds(intervalInSeconds * 1000),
			frame = self.addFrame(subject, event);
		|
		frame.addEventListener('close', { :unusedEvent |
			timerId.cancel
		});
		frame
	}

	addFrame { :self :subject :event |
		| frame = Frame(subject); |
		subject.frame := frame;
		frame.zIndex := self.zIndices.max + 1;
		event.ifNotNil {
			frame.moveTo(event.x, event.y)
		};
		self.frameSet.add(frame);
		self.container.appendChild(frame.outerElement);
		frame
	}

	browserOn { :self :path :event |
		system.isTraitName(path[1]).if {
			self.addFrame(TraitBrowser().path(path), event)
		} {
			system.isTypeName(path[1]).if {
				self.addFrame(TypeBrowser().path(path), event)
			} {
				('SmallKansas>>browserOn: not a trait or type: ' ++ path[1]).postLine
			}
		}
	}

	categoryBrowser { :self :event |
		self.addFrame(CategoryBrowser(), event)
	}

	clock { :self :event |
		|
			getTime = {
				system.unixTimeInMilliseconds.roundTo(1000).TimeStamp.iso8601
			},
			textEditor = TextEditor('Clock', false, getTime()),
			frame = self.addFrameWithAnimator(textEditor, event, 1, {
				textEditor.setEditorText(getTime())
			});
		|
		textEditor.editable := false;
		frame.outerElement.style.setProperties((height: '75px', width: '275px'));
		frame
	}

	dialog { :self :subject :event |
		| dialog = 'dialog'.createElement; |
		dialog.appendChild(subject.outerElement);
		dialog.style.setProperty('left', event.x.asString ++ 'px', '');
		dialog.style.setProperty('top', event.y.asString ++ 'px', '');
		self.container.appendChild(dialog);
		subject.dialog(dialog);
		dialog.showModal;
		dialog
	}

	font { :self |
		self.container.style.getPropertyValue('--font-family')
	}

	font { :self :fontName|
		self.container.style.setProperty('--font-family', fontName, '')
	}

	fontMenuEntriesOn { :self :subject |
		['APL333', 'Los Altos', 'Parc Place'].collect { :fontName |
			fontName -> { :unusedEvent |
				subject.font := fontName
			}
		}
	}

	fontMenuOn { :self :subject :isTransient :event |
		self.menu('Font Menu', self.fontMenuEntriesOn(subject), isTransient, event)
	}

	fontSize { :self :fontSize |
		self.container.style.setProperty('--font-size', fontSize.asString ++ 'em', '')
	}

	fontSizeMenuEntriesOn { :self :subject |
		[
			'0.5' -> 0.5, '0.75' -> 0.75, '0.925' -> 0.925,
			'1' -> 1, '1.25' -> 1.25, '1.5' -> 1.5, '2' -> 2
		].collect { :fontSize |
			fontSize.key -> { :unusedEvent |
				subject.fontSize := fontSize.value
			}
		}
	}

	fontSizeMenuOn { :self :subject :isTransient :event |
		self.menu('Font Size Menu', self.fontSizeMenuEntriesOn(subject), isTransient, event)
	}

	helpBrowser { :self :event |
		self.addFrame(workspace::smallHours.helpBrowser, event)
	}

	helpFor { :self :subject :event |
		workspace::smallHours.helpFor(subject).then { :aString |
			self.addFrame(
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
		self.addFrame(MethodSignatureBrowser(methodSignatures), event)
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
				self.worldMenu(true, event)
			}
		});
		self
	}

	initializeMidi { :self :ifPresent:/1 |
		self.midiAccess.isNil.if {
			system.window.navigator.requestMidiAccess.thenElse { :midiAccess |
				self.midiAccess := midiAccess;
				ifPresent(midiAccess)
			} { :message |
				('SmallKansas>>initializeMidi: no midiAccess: ' + message).postLine
			}
		} {
			ifPresent(self.midiAccess)
		}
	}

	menu { :self :title :entries :isTransient :event |
		|
			menu = Menu(title, entries),
			frame = self.addFrame(menu, event);
		|
		menu.isTransient := isTransient;
		frame
	}

	methodBrowser { :self :event |
		self.addFrame(MethodBrowser(), event)
	}

	methodSignatureBrowser { :self :event |
		self.addFrame(MethodSignatureBrowser(), event)
	}

	midiMonitorMenu { :self :event |
		self.initializeMidi { :unusedMidiAcccess |
			|
				onSelect = { :midiPort :event |
					self.midiMonitorOn(midiPort, event)
				},
				menu = Menu('Midi Monitor Menu', self.midiPortListEntries(onSelect:/2));
			|
			menu.isTransient := true;
			self.addFrameWithAnimator(menu, event, 1, {
				menu.setEntries(self.midiPortListEntries(onSelect:/2))
			})
		}
	}

	midiMonitorOn { :self :midiPort :event |
		|
			textEditor = TextEditor('Midi Monitor On ' ++ midiPort.name, false, ''),
			messages = OrderedCollection(),
			onMidiMessage = { :midiMessageEvent |
				messages.add(midiMessageEvent);
				textEditor.setEditorText(messages.last(25.min(messages.size)).Array.collect { :midi |
					midi.data.asString
				}.unlines)
			},
			frame = self.addFrame(textEditor, event);
		|
		textEditor.editable := false;
		midiPort.addEventListener('midimessage', onMidiMessage);
		frame.addEventListener('close', { :unusedEvent |
			midiPort.removeEventListener('midimessage', onMidiMessage)
		});
		frame
	}


	midiPortListEntries { :self :onSelect:/2|
		(self.midiAccess.inputs.ports ++ self.midiAccess.outputs.ports).collect { :midiPort |
			midiPort.type ++ '/' ++ midiPort.name -> { :event |
				onSelect(midiPort, event)
			}
		}
	}

	programBrowser { :self :event |
		self.addFrame(workspace::smallHours.programBrowser, event)
	}

	removeFrame { :self :frame |
		frame.outerElement.remove;
		self.frameSet.remove(frame)
	}

	systemBrowser { :self :event |
		self.addFrame(SystemBrowser(), event)
	}

	traitBrowser { :self :event |
		self.addFrame(TraitBrowser(), event)
	}

	typeBrowser { :self :event |
		self.addFrame(TypeBrowser(), event)
	}


	windowMenuEntries { :self |
		self.frameSet.Array.collect { :frame |
			frame.title -> { :unusedEvent |
				frame.bringToFront
			}
		}
	}

	windowMenu { :self :event |
		| menu = Menu('Window Menu', self.windowMenuEntries); |
		self.addFrameWithAnimator(menu, event, 1, {
			menu.setEntries(self.windowMenuEntries)
		})
	}

	worldMenu { :self :isTransient :event |
		self.menu('World Menu', self.worldMenuEntries, isTransient, event)
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
				self.fontMenuOn(self, false, event)
			},
			'Font Size Menu' -> { :event |
				self.fontSizeMenuOn(self, false, event)
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
			'Midi Monitor Menu' -> { :event |
				self.midiMonitorMenu(event)
			},
			'Midi Port Browser' -> { :event |
				self.initializeMidi { :unusedMidiAccess |
					self.addFrame(self.MidiPortBrowser, event)
				}
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
				self.addFrame(
					TextEditor('Workspace', false, ''),
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

	MidiPortBrowser { :self |
		ColumnBrowser('Midi Port Browser', false, [1, 1, 3], { :browser :path |
			path.size.caseOf([
				0 -> {
					['input', 'output']
				},
				1 -> {
					self.midiAccess.ports(path[1]).collect(manufacturer:/1).IdentitySet.Array
				},
				2 -> {
					self.midiAccess.ports(path[1]).select { :port |
						port.manufacturer = path[2]
					}.collect(name:/1)
				},
				3 -> {
					self.midiAccess.portByName(path[1], path[2], path[3]).asString
				}
			])
		})
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
