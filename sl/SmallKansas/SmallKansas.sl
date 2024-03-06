{- Requires: Dom Duration Set -}

@SmallKansan {

	openIn { :self :smallKansas :event |
		self.typeResponsibility('@SmallKansan>>openIn')
	}

}

SmallKansas : [Object, Cache] { | container frameSet cache |

	addFrameWithAnimator { :self :subject :event :delay :aBlock:/0 |
		let timerId = aBlock:/0.valueEveryMilliseconds(delay.asSeconds * 1000);
		let frame = self.addFrame(subject, event);
		frame.addEventListener('close') { :unusedEvent |
			timerId.cancel
		};
		frame
	}

	addFrame { :self :subject :event |
		let frame = Frame(self, subject);
		subject.frame := frame;
		frame.zIndex := self.zIndices.max + 1;
		event.ifNotNil {
			frame.moveTo(event.x, event.y)
		};
		self.frameSet.basicInclude(frame);
		self.container.appendChild(frame.outerElement);
		frame
	}

	browserOn { :self :path :event |
		system.isTypeName(path[1]).if {
			self.addFrame(self.TypeBrowser.setPath(path), event)
		} {
			system.isTraitName(path[1]).if {
				self.addFrame(self.TraitBrowser.setPath(path), event)
			} {
				self.warning('browserOn: not type or trait: ' ++ path[1])
			}
		}
	}

	colour { :self :aColour |
		self.container.style.setProperty('background-color', aColour.hexString, '')
	}

	dialog { :self :subject :event |
		let dialog = 'dialog'.createElement;
		dialog.appendChild(subject.outerElement);
		dialog.style.setProperty('left', event.x.asString ++ 'px', '');
		dialog.style.setProperty('top', event.y.asString ++ 'px', '');
		self.container.appendChild(dialog);
		subject.dialog(dialog);
		dialog.showModal;
		dialog
	}

	evaluate { :self :aString :event |
		system.evaluateNotifying(aString) { :err |
			self.inspectorOn(err, event);
			err
		}
	}

	font { :self |
		self.container.style.getPropertyValue('--font-family')
	}

	font { :self :fontName |
		self.container.style.setProperty('--font-family', fontName, '')
	}

	fontMenuEntriesOn { :self :subject |
		['APL333', 'Los Altos', 'Monaco', 'Neo Euler', 'Parc Place'].collect { :fontName |
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
		let bracketedSubject = '>>' ++ subject ++ ':/';
		let methodSignatures = system.allMethods.collect(signature:/1).select { :each |
			each.includesSubstring(bracketedSubject)
		}.copyWithoutIdenticalElements.sort;
		self.addFrame(self.MethodSignatureBrowser(methodSignatures, false), event)
	}

	initialize { :self |
		self.container := 'smallKansas'.getElementById;
		self.frameSet := Set();
		self.cache := Record();
		self.container.addEventListener('contextmenu') { :event |
			(event.target == self.container).ifTrue {
				event.preventDefault;
				self.WorldMenu(true, event)
			}
		};
		self
	}

	referencesTo { :self :subject :event |
		self.addFrame(
			self.MethodSignatureBrowser(
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

	midiAccess { :self |
		self.whenCached('midiAccess') {
			system.window.navigator.requestMidiAccess
		}
	}

	withMidiAccess { :self :aBlock:/1 |
		self.midiAccess.thenElse { :midiAccess |
			aBlock(midiAccess)
		} { :message |
			self.warning('withMidiAccess: no midiAccess: ' + message)
		}
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

}

+System {

	smallKansans { :self |
		self.traitTypes('SmallKansan').collect { :each |
			system.typeLookup(each)
		}
	}

}

