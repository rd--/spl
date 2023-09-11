SmallKansas : [Object] { | container frameSet midiAccess helpSystem |

	addFrameWithAnimator { :self :subject :event :delay :aProcedure:/0 |
		|(
			timerId = aProcedure:/0.evaluateEveryMilliseconds(delay.asSeconds * 1000),
			frame = self.addFrame(subject, event)
		)|
		frame.addEventListener('close') { :unusedEvent |
			timerId.cancel
		};
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
		system.isTypeName(path[1]).if {
			self.addFrame(TypeBrowser().setPath(path), event)
		} {
			system.isTraitName(path[1]).if {
				self.addFrame(TraitBrowser().setPath(path), event)
			} {
				self.warning('browserOn: not type or trait: ' ++ path[1])
			}
		}
	}

	colour { :self :aColour |
		self.container.style.setProperty('background-color', aColour.hexString, '')
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
		['APL333', 'Los Altos', 'Monaco', 'Parc Place'].collect { :fontName |
			MenuItem(fontName, nil) { :unusedEvent |
				subject.font := fontName
			}
		}
	}

	fontMenuOn { :self :subject :isTransient :event |
		self.menu('Font Menu', self.fontMenuEntriesOn(subject), isTransient, event)
	}

	fontSize { :self :fontSize |
		self.container.style.setProperty('--font-size', fontSize.asString, '')
	}

	fontSizeMenuEntriesOn { :self :subject |
		['8pt', '10pt', '12pt', '16pt', '24pt', '32pt'].collect { :fontSize |
			MenuItem(fontSize, nil) { :unusedEvent |
				subject.fontSize := fontSize
			}
		}
	}

	fontSizeMenuOn { :self :subject :isTransient :event |
		self.menu('Font Size Menu', self.fontSizeMenuEntriesOn(subject), isTransient, event)
	}

	implementorsOf { :self :subject :event |
		|(
			bracketedSubject = '>>' ++ subject ++ ':/',
			methodSignatures = system.allMethods.collect(signature:/1).select { :each |
				each.includesSubstring(bracketedSubject)
			}.Set.Array.sorted
		)|
		self.addFrame(MethodSignatureBrowser(methodSignatures, false), event)
	}

	initialize { :self |
		self.container := 'smallKansas'.getElementById;
		self.frameSet := Set();
		self.container.addEventListener('contextmenu') { :event |
			(event.target == self.container).ifTrue {
				event.preventDefault;
				self.WorldMenu(true, event)
			}
		};
		self.initializeLibraryItems;
		self
	}

	initializeLibraryItems { :self |
		system.addLibraryItem(
			LibraryItem(
				'helpIndex',
				'https://rohandrape.net/sw/jssc3/text/smallhours-help.text',
				'text/plain',
				identity:/1
			)
		);
		system.addLibraryItem(
			LibraryItem(
				'jiMeta',
				'https://rohandrape.net/sw/hmt/data/json/scala-meta-au.json',
				'application/json',
				{ :item |
					system.requireLibraryItem('jiScala').then { :jiScala |
						item.collect { :anArray |
							anArray.collect { :aName |
								jiScala[aName]
							}.select(notNil:/1)
						}
					}
				}
			)
		);
		system.addLibraryItem(
			LibraryItem(
				'jiScala',
				'https://rohandrape.net/sw/hmt/data/json/scala-ji-tuning.json',
				'application/json',
				{ :item |
					item.collect(JiTuning:/1)
				}
			)
		);
		system.addLibraryItem(
			LibraryItem(
				'programIndex',
				'https://rohandrape.net/sw/jssc3/text/smallhours-programs.text',
				'text/plain',
				identity:/1
			)
		);
		system.addLibraryItem(
			LibraryItem(
				'programOracle',
				'https://rohandrape.net/sw/jssc3/text/smallhours-oracle.text',
				'text/plain',
				identity:/1
			)
		);
		system.addLibraryItem(
			LibraryItem(
				'clsLeitner',
				'https://rohandrape.net/sw/hsc3-data/data/chemistry/json/cls.json',
				'application/json',
				{ :item |
					item.collect(CrystalLatticeStructure:/1)
				}
			)
		)
	}

	initializeMidi { :self :ifPresent:/1 |
		self.midiAccess.ifNil {
			system.window.navigator.requestMidiAccess.thenElse { :midiAccess |
				self.midiAccess := midiAccess;
				ifPresent(midiAccess)
			} { :message |
				self.warning('initializeMidi: no midiAccess: ' + message)
			}
		} {
			ifPresent(self.midiAccess)
		}
	}

	MidiMonitorMenu { :self :event |
		self.initializeMidi { :unusedMidiAcccess |
			|(
				onSelect = { :midiPort :event |
					self.midiMonitorOn(midiPort, event)
				},
				menu = Menu('Midi Monitor Menu', self.midiPortListEntries(onSelect:/2))
			)|
			menu.isTransient := true;
			self.addFrameWithAnimator(menu, event, 1) {
				menu.setEntries(self.midiPortListEntries(onSelect:/2))
			}
		}
	}

	midiMonitorOn { :self :midiPort :event |
		|(
			textEditor = TextEditor('Midi Monitor On ' ++ midiPort.name, 'text/plain', ''),
			messages = [],
			onMidiMessage = { :midiMessageEvent |
				messages.add(midiMessageEvent);
				textEditor.setEditorText(messages.last(25.min(messages.size)).collect { :midi |
					midi.data.asString
				}.unlines)
			},
			frame = self.addFrame(textEditor, event)
		)|
		textEditor.editable := false;
		midiPort.addEventListener('midimessage', onMidiMessage);
		frame.addEventListener('close') { :unusedEvent |
			midiPort.removeEventListener('midimessage', onMidiMessage)
		};
		frame
	}

	midiPortListEntries { :self :onSelect:/2|
		(self.midiAccess.inputs.ports ++ self.midiAccess.outputs.ports).collect { :midiPort |
			MenuItem(midiPort.type ++ '/' ++ midiPort.name, nil) { :event |
				onSelect(midiPort, event)
			}
		}
	}

	referencesTo { :self :subject :event |
		self.addFrame(
			MethodSignatureBrowser(
				system.methodSourceCodeSearch(subject).collect(signature:/1),
				false
			),
			event
		)
	}

	removeFrame { :self :frame |
		frame.outerElement.remove;
		self.frameSet.remove(frame)
	}

	WorldMenu { :self :isTransient :event |
		self.menu('World Menu', self.worldMenuEntries, isTransient, event)
	}

	worldMenuEntries { :self |
		[
			MenuItem('About Small Kansas', nil) { :event |
				self.helpFor('Small Kansas', event)
			},
			MenuItem('Analogue Clock', nil) { :event |
				self.AnalogueClock(event)
			},
			MenuItem('Category Browser', nil) { :event |
				self.CategoryBrowser(event)
			},
			MenuItem('ColourChooser', nil) { :event |
				self.ColourChooser(self, event)
			},
			MenuItem('CrystalLatticeStructureBrowser', nil) { :event |
				system.requireLibraryItem('clsLeitner').then { :clsLeitner |
					self.addFrame(CrystalLatticeStructureBrowser(clsLeitner), event)
				}
			},
			MenuItem('CrystalLatticeStructureOracle', nil) { :event |
				system.requireLibraryItem('clsLeitner').then { :clsLeitner |
					| cls = clsLeitner.atRandom, mtx = Projection3().chinese.Matrix33; |
					self.addFrame(SvgViewer(
						'Cls - ' ++ cls.name,
						cls.drawing(0.25) { :each |
							mtx.applyTo(each).xy * 50
						}),
						event
					)
				}
			},
			MenuItem('Digital Clock', nil) { :event |
				self.DigitalClock(event)
			},
			MenuItem('Font Menu', nil) { :event |
				self.fontMenuOn(self, false, event)
			},
			MenuItem('Font Size Menu', nil) { :event |
				self.fontSizeMenuOn(self, false, event)
			},
			MenuItem('Help Browser', nil) { :event |
				self.HelpBrowser(event)
			},
			MenuItem('Method Browser', nil) { :event |
				self.MethodBrowser(event)
			},
			MenuItem('Method Signature Browser', nil) { :event |
				self.MethodSignatureBrowser(event)
			},
			MenuItem('Midi Monitor Menu', nil) { :event |
				self.MidiMonitorMenu(event)
			},
			MenuItem('Midi Port Browser', nil) { :event |
				self.initializeMidi { :unusedMidiAccess |
					self.addFrame(self.MidiPortBrowser, event)
				}
			},
			MenuItem('Package Browser', nil) { :event |
				self.PackageBrowser(event)
			},
			MenuItem('Program Browser', nil) { :event |
				self.ProgramBrowser(event)
			},
			MenuItem('Program Oracle', nil) { :event |
				self.ProgramOracle(event)
			},
			MenuItem('ScSynth Reset', nil) { :event |
				system.clock.removeAll;
				system.defaultScSynth.reset
			},
			MenuItem('ScSynth Status', nil) { :event |
				self.ScSynthStatus(event)
			},
			MenuItem('Scala Ji Meta Browser', nil) { :event |
				self.ScalaJiMetaBrowser(event)
			},
			MenuItem('Scala Ji Tuning Browser', nil) { :event |
				self.ScalaJiTuningBrowser(event)
			},
			MenuItem('System Browser', nil) { :event |
				self.SystemBrowser(event)
			},
			MenuItem('Trait Browser', nil) { :event |
				self.TraitBrowser(event)
			},
			MenuItem('Transcript Viewer', nil) { :event |
				self.TranscriptViewer(event)
			},
			MenuItem('Type Browser', nil) { :event |
				self.TypeBrowser(event)
			},
			MenuItem('Window Menu', nil) { :event |
				self.WindowMenu(event)
			},
			MenuItem('Workspace', nil) { :event |
				self.addFrame(
					TextEditor('Workspace', 'text/plain', ''),
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

+Void {

	SmallKansas {
		newSmallKansas().initialize
	}

}
