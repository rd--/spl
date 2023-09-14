@SmallKansan {

	openIn { :self :smallKansas :event |
		self.typeResponsibility('SmallKansan>>openIn')
	}

}

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
		|(
			parseProgramIndex = { :aString |
				aString.lines.select(notEmpty:/1).collect { :each |
					each.replaceString('.sl', '').splitRegExp(RegExp(' - |/'))
				}
			}
		)|
		system.addLibraryItem(
			LibraryItem(
				'helpIndex',
				'https://rohandrape.net/sw/jssc3/text/smallhours-help.text',
				'text/plain',
				{ :aString |
					aString.lines.select(notEmpty:/1).collect { :each |
						| [kind, area, name] = each.replaceString('.help.sl', '').splitRegExp(RegExp('/')); |
						[area, kind, name]
					}
				}
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
				parseProgramIndex:/1
			)
		);
		system.addLibraryItem(
			LibraryItem(
				'programOracle',
				'https://rohandrape.net/sw/jssc3/text/smallhours-oracle.text',
				'text/plain',
				parseProgramIndex:/1
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

	withMidiAccess { :self :aBlock:/1 |
		self.midiAccess.ifNil {
			system.window.navigator.requestMidiAccess.thenElse { :midiAccess |
				self.midiAccess := midiAccess;
				aBlock(midiAccess)
			} { :message |
				system.warning('withMidiAccess: no midiAccess: ' + message)
			}
		} {
			aBlock(self.midiAccess)
		}
	}

	WorldMenu { :self :isTransient :event |
		self.menu('World Menu', self.worldMenuEntries, isTransient, event)
	}

	worldMenuEntries { :self |
		|(
			static = [
				MenuItem('About Small Kansas', nil) { :event |
					self.helpFor('Small Kansas', event)
				},
				MenuItem('Colour Chooser', nil) { :event |
					self.colourChooserOn(self, event)
				},
				MenuItem('Font Menu', nil) { :event |
					self.fontMenuOn(self, false, event)
				},
				MenuItem('Font Size Menu', nil) { :event |
					self.fontSizeMenuOn(self, false, event)
				},
				MenuItem('ScSynth Reset', nil) { :event |
					system.clock.removeAll;
					system.defaultScSynth.reset
				},
				MenuItem('Workspace', nil) { :event |
					self.addFrame(
						TextEditor('Workspace', 'text/plain', ''),
						event
					)
				}
			],
			dynamic = system.smallKansans.collect { :each |
				MenuItem(each.name, nil) { :event |
					each.instanceOf.openIn(self, event)
				}
			}
		)|
		(static ++ dynamic).sort
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

+@Cache {

	smallKansas { :self |
		self.cached('smallKansas') {
			SmallKansas()
		}
	}

	smallKansans { :self |
		self.traitTypes('SmallKansan').collect { :each |
			system.typeLookup(each)
		}
	}

}

