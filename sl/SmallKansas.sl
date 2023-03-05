@UserEventTarget {

	addEventListener { :self :aString :aProcedure:/1 |
		self.eventListeners.atIfPresentIfAbsent(aString) { :aSet |
			aSet.add(aProcedure:/1)
		} {
			self.eventListeners[aString] := IdentitySet([aProcedure:/1])
		}
	}

	dispatchEvent { :self :event |
		self.eventListeners.atIfPresent(event.type) { :aSet |
			aSet.do { :each |
				each.value(event)
			}
		}
	}

}

@View {

	frame { :self :aFrame |
	}

	frameMenuItems { :self |
		[]
	}

	name { :self |
		self.title.replaceAll(' ', '')
	}

	outerElement { :self |
		self.subclassResponsibility
	}

	title { :self |
		self.typeOf
	}

}

AnalogueClock : [Object, View] { | clockPane hourHand minuteHand secondHand |

	createElements { :self |
		|
		document = system.window.document,
		svg = document.createSvgElement(
			'svg',
			(
				height: '200',
				width: '200'
			)
		),
		group = document.createSvgElement(
			'g',
			(
				transform: 'translate(100, 100) scale(1, -1)'
			)
		),
		circle = document.createSvgElement(
			'circle',
			(
				cx: '0',
				cy: '0',
				r: '90',
				fill: 'aquamarine'
			)
		);
		|
		self.clockPane := 'div'.createElement;
		self.clockPane.setAttribute('class', 'clockPane');
		self.hourHand := document.createSvgElement(
			'line',
			(
				x1: '0',
				y1: '0',
				x2: '0',
				y2: '60',
				stroke: 'cornflowerblue',
				'stroke-width': '2'
			)
		);
		self.hourHand.setAttribute('class', 'hourHand');
		self.minuteHand := document.createSvgElement(
			'line',
			(
				x1: '0',
				y1: '0',
				x2: '0',
				y2: '90',
				stroke: 'coral',
				'stroke-width': '2'
			)
		);
		self.minuteHand.setAttribute('class', 'minuteHand');
		self.secondHand := document.createSvgElement(
			'line',
			(
				x1: '0',
				y1: '0',
				x2: '0',
				y2: '90',
				stroke: 'darkseagreen',
				'stroke-width': '1'
			)
		);
		self.secondHand.setAttribute('class', 'secondHand');
		group.appendChildren([
			circle,
			self.hourHand,
			self.minuteHand,
			self.secondHand
		]);
		svg.appendChild(group);
		self.clockPane.appendChild(svg)
	}

	initialize { :self |
		self.createElements;
		self.tick;
		self
	}

	moveHourHand { :self :hour :minute |
		|
			fractionalHour = hour + (minute / 60),
			theta = fractionalHour - 3 / 12 * 2 * pi,
			point = PolarPoint(70, theta.negated);
		|
		self.hourHand.setAttribute('x2', point.x);
		self.hourHand.setAttribute('y2', point.y)
	}

	moveMinuteHand { :self :minute |
		|
			theta = minute - 15 / 60 * 2 * pi,
			point = PolarPoint(90, theta.negated);
		|
		self.minuteHand.setAttribute('x2', point.x);
		self.minuteHand.setAttribute('y2', point.y)
	}

	moveSecondHand { :self :minute |
		|
			theta = minute - 15 / 60 * 2 * pi,
			point = PolarPoint(90, theta.negated);
		|
		self.secondHand.setAttribute('x2', point.x);
		self.secondHand.setAttribute('y2', point.y)
	}

	outerElement { :self |
		self.clockPane
	}

	tick { :self |
		| dateAndTime = system.Date; |
		self.moveHourHand(dateAndTime.hours, dateAndTime.minutes);
		self.moveMinuteHand(dateAndTime.minutes);
		self.moveSecondHand(dateAndTime.seconds)
	}

	title { :self |
		'Analogue Clock'
	}

}

+Void {

	AnalogueClock {
		newAnalogueClock().initialize
	}

}

ColumnBrowser : [Object, View] { | browserPane columnsPane previewPane textEditor columnLists statusPane statusText title |

	addKeyBindings { :self :aProcedure:/1 |
		self.textEditor.addKeyBindings(self.textEditor.aProcedure)
	}

	createElements { :self :numberOfColumns :mimeType :withFilter :withStatus |
		self.browserPane := 'div'.createElement;
		self.columnsPane :=  'div'.createElement;
		self.previewPane := 'div'.createElement;
		self.textEditor := newTextEditor().initialize(
			'ColumnBrowserTextEditor', mimeType, ''
		);
		self.columnLists := (1 .. numberOfColumns).collect { :index |
			FilterSelect(withFilter & { index = 1 })
		};
		self.columnsPane.appendChildren(self.columnLists.collect(container:/1));
		self.previewPane.appendChild(self.textEditor.outerElement);
		self.browserPane.appendChildren([
			self.columnsPane,
			self.previewPane
		]);
		withStatus.ifTrue {
			self.statusPane := 'div'.createElement;
			self.statusPane.setAttribute('class', 'statusPane');
			self.statusText := 'span'.createElement;
			self.statusPane.appendChild(self.statusText);
			self.browserPane.appendChild(self.statusPane)
		}
	}

	initialize { :self :title :mimeType :withFilter :withStatus :columnProportions :clientKeyBindings :onAccept:/1 :onChange:/2  |
		| numberOfColumns = columnProportions.size; |
		self.title := title;
		self.createElements(numberOfColumns, mimeType, withFilter, withStatus);
		self.setEntries(1, onChange(self, []));
		self.setAttributes(columnProportions, 6);
		self.setEventHandlers(numberOfColumns, onChange:/2);
		clientKeyBindings.isProcedure.ifTrue {
			self.addKeyBindings(clientKeyBindings)
		};
		onAccept:/1.isProcedure.ifTrue {
			self.textEditor.addEventListener('accept') { :event |
				event.detail.onAccept
			}
		};
		self
	}

	outerElement { :self |
		self.browserPane
	}

	path { :self |
		self.columnLists.collect { :each | each.select.value }
	}

	path { :self :path |
		path.withCollect(self.columnLists.first(path.size)) { :aString :aColumn |
			aColumn.select.select(aString)
		};
		self.columnLists[path.size].select.dispatchEvent(Event('change'));
		self
	}

	setAttributes { :self :columnProportions :listSize |
		self.browserPane.setAttribute('class', 'browserPane');
		self.columnsPane.setAttribute('class', 'columnsPane');
		columnProportions.size.do { :index |
			| list = self.columnLists[index].select; |
			list.size := listSize;
			list.style.setProperties((
				'flex-grow': columnProportions[index].asString
			))
		};
		self.previewPane.setAttribute('class', 'previewPane')
	}

	setEntries { :self :columnIndex :entries |
		self.columnLists[columnIndex].setEntries(entries)
	}

	setEventHandlers { :self :numberOfColumns :onChange:/2 |
		numberOfColumns.do { :index |
			self.columnLists[index].select.addEventListener('change') { :unusedEvent |
				|
					next = onChange(self, (1 .. index).collect { :each |
						self.columnLists[each].select.value
					});
				|
				(index = numberOfColumns).if {
					next.then { :view |
						self.textEditor.setEditorText(view.asString)
					}
				} {
					self.textEditor.setEditorText('');
					(numberOfColumns - index - 1).do { :each |
						self.columnLists[index + each + 1].select.removeAll
					};
					self.setEntries(index + 1, next)
				}
			}
		}
	}

	setStatus { :self :aString |
		self.statusText.ifNotNil {
			self.statusText.textContent := aString
		}
	}

}

+String {

	ColumnBrowser { :self :mimeType :withFilter :withStatus :columnProportions :clientKeyBindings :onAccept:/1 :onChange:/2 |
		newColumnBrowser().initialize(
			self,
			mimeType,
			withFilter,
			withStatus,
			columnProportions,
			clientKeyBindings,
			onAccept:/1,
			onChange:/2
		)
	}

}

FilterSelect : [Object] { | container filterText select entries ignoreCase |

	applyFilter { :self |
		|
		caseRule:/1 = self.ignoreCase.if {
			asLowercase:/1
		} {
			identity:/1
		},
		filter = self.filterText.isNil.if {
			{
				true
			}
		} {
			| matchString = self.filterText.value.caseRule; |
			{ :aString |
				aString.caseRule.includesSubstring(matchString)
			}
		};
		|
		self.select.removeAll;
		self.select.appendChildren(self.entries.select(filter).collect { :each |
			TextOption(each, each)
		});
		self.select.deselect
	}

	initialize { :self :withFilter |
		self.ignoreCase := true;
		withFilter.if {
			self.container := 'div'.createElement;
			self.filterText := TextInput('');
			self.select := 'select'.createElement;
			self.container.setAttribute('class', 'column');
			self.filterText.setAttribute('class', 'filterText');
			self.filterText.addEventListener('change') { :event |
				self.applyFilter
			};
			self.container.appendChildren([
				self.filterText,
				self.select
			])
		} {
			self.select := 'select'.createElement;
			self.filterText := nil;
			self.container := self.select
		};
		self
	}

	setEntries { :self :entries |
		self.entries := entries;
		self.applyFilter
	}

}

+Boolean {

	FilterSelect { :self |
		newFilterSelect().initialize(self)
	}

}

Frame : [Object, UserEventTarget] { | framePane titlePane closeButton menuButton titleText inMove x y x0 y0 eventListeners |

	bringToFront { :self |
		self.zIndex := workspace::smallKansas.zIndices.max + 1
	}

	close { :self |
		self.dispatchEvent(Event('close'));
		workspace::smallKansas.removeFrame(self)
	}

	colour { :self :aColour |
		self.framePane.style.setProperty('background-color', aColour.hexString, '')
	}

	createElements { :self :subject |
		self.framePane := 'div'.createElement;
		self.titlePane :=  'div'.createElement;
		self.closeButton := 'span'.createElement;
		self.titleText := 'span'.createElement;
		self.menuButton := 'span'.createElement;
		self.titlePane.appendChildren([
			self.closeButton,
			self.titleText,
			self.menuButton
		]);
		self.framePane.appendChildren([
			self.titlePane,
			subject.outerElement
		]);
		self.closeButton.textContent := '×';
		self.menuButton.textContent := '☰';
		self.inMove := false
	}

	font { :self :fontName|
		self.framePane.style.setProperty('--font-family', fontName, '')
	}

	fontSize { :self :fontSize |
		self.framePane.style.setProperty('--font-size', fontSize, '')
	}

	initialize { :self :subject |
		self.createElements(subject);
		self.setAttributes(subject);
		self.setEventHandlers(subject);
		self.title := subject.title;
		self.eventListeners := IdentityDictionary();
		self
	}

	outerElement { :self |
		self.framePane
	}

	menuItems { :self |
		[
			MenuItem('Colour Chooser', nil) { :event |
				workspace::smallKansas.colourChooser(self, event)
			},
			MenuItem('Font Menu', nil) { :event |
				workspace::smallKansas.fontMenuOn(self, true, event)
			},
			MenuItem('Font Size Menu', nil) { :event |
				workspace::smallKansas.fontSizeMenuOn(self, true, event)
			}
		]
	}

	moveTo { :self :x :y |
		self.x := x;
		self.y := y;
		self.framePane.style.setProperty('left', x.asString ++ 'px', '');
		self.framePane.style.setProperty('top', y.asString ++ 'px', '')
	}

	setAttributes { :self :subject |
		self.framePane.setAttribute('class', ['framePane', subject.typeOf, subject.name].unwords);
		self.titlePane.setAttribute('class', 'titlePane');
		self.closeButton.setAttribute('class', 'closeButton');
		self.titleText.setAttribute('class', 'titleText');
		self.menuButton.setAttribute('class', 'menuButton')
	}

	setEventHandlers { :self :subject |
		self.closeButton.addEventListener('click') { :event |
			event.preventDefault;
			self.close
		};
		self.menuButton.addEventListener('click') { :event |
			event.preventDefault;
			workspace::smallKansas.menu('Frame Menu', subject.frameMenuItems ++ self.menuItems, true, event)
		};
		self.titlePane.addEventListener('contextmenu') { :event |
			(* ... *)
		};
		self.titlePane.addEventListener('pointerdown') { :event |
			| titleRect = event.target.getBoundingClientRect; |
			event.preventDefault;
			self.bringToFront;
			event.target.setPointerCapture(event.pointerId);
			self.inMove := true;
			self.x0 := event.x - titleRect.x;
			self.y0 := event.y - titleRect.y
		};
		self.titlePane.addEventListener('pointermove') { :event |
			self.inMove.ifTrue {
				event.stopPropagation;
				event.cancelable.ifTrue {
					event.preventDefault
				};
				self.moveTo(
					event.x - self.x0,
					event.y- self.y0
				)
			}
		};
		self.titlePane.addEventListener('pointerup') { :event |
			event.target.releasePointerCapture(event.pointerId);
			self.inMove := false
		};
		self.framePane.addEventListener('keydown') { :event |
			event.ctrlKey.ifTrue {
				(event.key = 'Escape').ifTrue {
					self.close
				}
			}
		}

	}

	title { :self |
		self.titleText.textContent
	}

	title { :self :aString |
		self.titleText.textContent := aString
	}

	zIndex { :self |
		self.framePane.style.getPropertyValue('z-index').parseInteger(10)
	}

	zIndex { :self :anInteger |
		self.framePane.style.setProperty('z-index', anInteger.asString, '')
	}

}

+@View {

	Frame { :self |
		newFrame().initialize(self)
	}

}

ColourChooser : [Object, View] { | colourChooserPane colourInput |

	hexString { :self |
		self.colourInput.getAttribute('value')
	}

	initialize { :self :initialColour :onSelect:/1 |
		self.colourChooserPane := 'div'.createElement;
		self.colourInput := 'input'.createElement;
		self.colourInput.setAttribute('type', 'color');
		self.colourInput.setAttribute('value', initialColour.hexString);
		self.colourChooserPane.appendChild(self.colourInput);
		self.colourChooserPane.setAttribute('class', 'colourChooser');
		self.colourChooserPane.setAttribute('class', 'colourInput');
		self.colourInput.addEventListener('input') { :event |
			onSelect(event.target.value.parseHexColour)
		};
		self
	}

	outerElement { :self |
		self.colourChooserPane
	}

	title { :self |
		'Colour Chooser'
	}

}

+Colour {

	ColourChooser { :self :onSelect:/1 |
		newColourChooser().initialize(self, onSelect:/1)
	}

}

+Procedure {

	ColourChooser { :self |
		Colour(0.5, 0.5, 0.5, 0.5).ColourChooser(self)
	}

}

MenuItem : [Object] { | name accessKey onSelect |

	accessKeyDislayText { :self |
		self.accessKey.notNil.if {
			' (' ++ self.accessKey ++ ')'
		} {
			''
		}
	}

	displayText { :self |
		self.name ++ self.accessKeyDislayText
	}

}

+String {

	MenuItem { :self :accessKey :onSelect |
		newMenuItem().initializeSlots(self, accessKey, onSelect)
	}

}

Menu : [Object, View] { | frame menuPane listPane menuList title isTransient |

	createElements { :self |
		self.menuPane := 'div'.createElement;
		self.listPane := 'div'.createElement;
		self.menuList := 'select'.createElement;
		self.listPane.appendChild(self.menuList);
		self.menuPane.appendChild(self.listPane)
	}

	frameMenuItems { :self |
		[
			self.isTransient.if {
				MenuItem('Mark Not Transient', nil) { :unusedEvent |
					self.isTransient := false
				}
			} {
				MenuItem('Mark Transient', nil) { :unusedEvent |
					self.isTransient := true
				}
			}
		]
	}

	initialize { :self :title :entries |
		self.title := title;
		self.isTransient := false;
		self.createElements;
		self.setAttributes;
		self.setEntries(entries);
		self
	}

	outerElement { :self |
		self.menuPane
	}

	setAttributes { :self |
		self.menuPane.setAttribute('class', 'menuPane');
		self.listPane.setAttribute('class', 'listPane')
	}

	setEntries { :self :entries |
		self.menuList.removeAllChildren;
		self.menuList.size := entries.size;
		entries.collect { :menuItem |
			|
				listItem = TextOption(menuItem.displayText, menuItem.displayText),
				dispatchEvent = { :event |
					event.preventDefault;
					menuItem.onSelect . (event);
					self.isTransient.ifTrue {
						self.frame.ifNotNil {
							self.frame.close
						}
					}
				};
			|
			self.menuList.appendChild(listItem);
			listItem.addEventListener('pointerdown', dispatchEvent)
		}
	}

}

+String {

	Menu { :self :entries |
		newMenu().initialize(self, entries)
	}

}

PngViewer : [Object, View] { | pngPane title pngData pngUrl |

	createElements { :self |
		| img = 'img'.createElement; |
		self.pngPane := 'div'.createElement;
		self.pngPane.setAttribute('class', 'pngPane');
		img.src := self.pngUrl;
		self.pngPane.appendChild(img)
	}

	frame { :self :aFrame |
		aFrame.addEventListener('close') { :event |
			self.pngUrl.revokeObjectURL
		}
	}

	initialize { :self :title :pngData |
		self.title := title;
		self.pngData := pngData;
		self.pngUrl := pngData.createObjectURL;
		self.createElements;
		self
	}

	outerElement { :self |
		self.pngPane
	}

}


+String {

	PngViewer { :self :pngData |
		newPngViewer().initialize(self, pngData)
	}

}

SmallKansas : [Object] { | container frameSet midiAccess helpIndex programIndex |

	addFrameWithAnimator { :self :subject :event :intervalInSeconds :aProcedure:/0 |
		|
			timerId = aProcedure:/0.evaluateEveryMilliseconds(intervalInSeconds * 1000),
			frame = self.addFrame(subject, event);
		|
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

	AnalogueClock { :self :event |
		|
			clock = AnalogueClock(),
			frame = self.addFrameWithAnimator(clock, event, 1) {
				clock.tick
			};
		|
		frame
	}

	browserOn { :self :path :event |
		system.isTypeName(path[1]).if {
			self.addFrame(TypeBrowser().path(path), event)
		} {
			system.isTraitName(path[1]).if {
				self.addFrame(TraitBrowser().path(path), event)
			} {
				('SmallKansas>>browserOn: not type or trait: ' ++ path[1]).postLine
			}
		}
	}

	CategoryBrowser { :self :event |
		self.addFrame(CategoryBrowser(), event)
	}

	colour { :self :aColour |
		self.container.style.setProperty('background-color', aColour.hexString, '')
	}

	ColourChooser { :self :subject :event |
		self.addFrame(ColourChooser({ :aColour |
			subject.colour(aColour)
		}), event)
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

	DigitalClock { :self :event |
		|
			getTime = {
				system.unixTimeInMilliseconds.roundTo(1000).TimeStamp.iso8601
			},
			textEditor = TextEditor('Digital Clock', 'text/plain', getTime()),
			frame = self.addFrameWithAnimator(textEditor, event, 1) {
				textEditor.setEditorText(getTime())
			};
		|
		textEditor.editable := false;
		frame.outerElement.style.setProperties((height: '1em', width: '18em'));
		frame
	}

	font { :self |
		self.container.style.getPropertyValue('--font-family')
	}

	font { :self :fontName|
		self.container.style.setProperty('--font-family', fontName, '')
	}

	fontMenuEntriesOn { :self :subject |
		['APL333', 'Los Altos', 'Parc Place'].collect { :fontName |
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

	helpAreas { :self |
		['spl', 'sc', 'sk']
	}

	HelpBrowser { :self |
		ColumnBrowser(
			'Help Browser',
			'text/markdown',
			false,
			false,
			[1, 1, 3],
			nil,
			nil,
			{ :browser :path |
				path.size.caseOf([
					0 -> {
						self.helpAreas
					},
					1 -> {
						self.helpKind(path[1])
					},
					2 -> {
						self.helpNames(path[1], path[2])
					},
					3 -> {
						self.helpFetch(path)
					}
				])
			}
		)
	}

	HelpBrowser { :self :event |
		self.addFrame(self.HelpBrowser, event)
	}

	helpFetch { :self :path |
		path.ifNotNil {
			('SmallKansas>>helpFetch: ' ++ path.joinSeparatedBy('/')).postLine;
			system.window.fetchString(self.helpUrl(path[1], path[2], path[3]), (cache: 'no-cache'))
		}
	}

	helpFetchFor { :self :subject |
		self.helpFetch(self.helpFind(subject))
	}

	helpFind { :self :name |
		self.helpIndex.detectIfNone { :each |
			each[3] = name
		} {
			('SmallKansas>>helpFind: no help for: ' ++ name).postLine;
			nil
		}
	}

	helpFor { :self :subject :event |
		self.helpFetchFor(subject).then { :aString |
			self.addFrame(
				TextEditor('Help For', 'text/markdown', aString),
				event
			)
		}
	}

	helpKind { :self :area |
		['doc', 'help']
	}

	helpNames { :self :area :kind |
		self.helpIndex.select { :each |
			each[1] = area & {
				each[2] = kind
			}
		}.collect(third:/1).IdentitySet.Array.sorted
	}

	helpParse { :self :aString |
		| [kind, area, name] = aString.replace('.help.sl', '').splitRegExp(RegExp('/')); |
		[area, kind, name]
	}

	helpProject { :self :area |
		area.caseOf([
			'sc' -> { 'stsc3' },
			'sk' -> { 'spl' },
			'spl' -> { 'spl' }
		])
	}

	helpUrl { :self :area :kind :name |
		['./lib/', self.helpProject(area), '/', kind, '/', area, '/', name, '.help.sl'].join
	}

	implementorsOf { :self :subject :event |
		|
			bracketedSubject = '>>' ++ subject ++ ':/',
			methodSignatures = system.allMethods.collect(signature:/1).select { :each |
				each.includesSubstring(bracketedSubject)
			}.IdentitySet.Array.sorted ;
		|
		self.addFrame(MethodSignatureBrowser(methodSignatures, false), event)
	}

	initialize { :self |
		self.container := 'smallKansas'.getElementById;
		self.frameSet := IdentitySet();
		self.container.addEventListener('contextmenu') { :event |
			event.preventDefault;
			(event.target == self.container).ifTrue {
				self.WorldMenu(true, event)
			}
		};
		self.loadHelpIndex;
		self.loadProgramIndex;
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

	loadHelpIndex { :self |
		system.window.fetchString('./text/smallhours-help.text', (cache: 'no-cache')).then { :aString |
			self.helpIndex := aString.lines.select(notEmpty:/1).collect { :each |
				self.helpParse(each)
			}
		}
	}

	loadProgramIndex { :self |
		system.window.fetchString('./text/smallhours-programs.text', (cache: 'no-cache')).then { :aString |
			self.programIndex := aString.lines.select(notEmpty:/1).collect { :each |
				self.programParse(each)
			}
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

	MethodBrowser { :self :event |
		self.addFrame(MethodBrowser(), event)
	}

	MethodSignatureBrowser { :self :event |
		self.addFrame(MethodSignatureBrowser(), event)
	}

	MidiMonitorMenu { :self :event |
		self.initializeMidi { :unusedMidiAcccess |
			|
				onSelect = { :midiPort :event |
					self.midiMonitorOn(midiPort, event)
				},
				menu = Menu('Midi Monitor Menu', self.midiPortListEntries(onSelect:/2));
			|
			menu.isTransient := true;
			self.addFrameWithAnimator(menu, event, 1) {
				menu.setEntries(self.midiPortListEntries(onSelect:/2))
			}
		}
	}

	midiMonitorOn { :self :midiPort :event |
		|
			textEditor = TextEditor('Midi Monitor On ' ++ midiPort.name, 'text/plain', ''),
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
		frame.addEventListener('close') { :unusedEvent |
			midiPort.removeEventListener('midimessage', onMidiMessage)
		};
		frame
	}

	MidiPortBrowser { :self |
		ColumnBrowser('Midi Port Browser', 'text/plain', false, false, [1, 1, 3], nil, nil) { :browser :path |
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
		} { :textEditor |
		}
	}

	midiPortListEntries { :self :onSelect:/2|
		(self.midiAccess.inputs.ports ++ self.midiAccess.outputs.ports).collect { :midiPort |
			MenuItem(midiPort.type ++ '/' ++ midiPort.name, nil)  { :event |
				onSelect(midiPort, event)
			}
		}
	}

	PngViewer { :self :title :png |
		self.addFrame(PngViewer(title, png), nil)
	}

	programAuthors { :self :category |
		self.programIndex.select { :each |
			each[1] = category
		}.collect(second:/1).IdentitySet.Array.sorted
	}

	ProgramBrowser { :self |
		ColumnBrowser(
			'Program Browser',
			'text/plain',
			false,
			false,
			[1, 1, 3],
			nil,
			nil,
			{ :browser :path |
				path.size.caseOf([
					0 -> {
						self.programCategories
					},
					1 -> {
						self.programAuthors(path[1])
					},
					2 -> {
						self.programNames(path[1], path[2])
					},
					3 -> {
						self.programFetch(path[1], path[2], path[3])
					}
				])
			}
		)
	}

	ProgramBrowser { :self :event |
		self.addFrame(self.ProgramBrowser, event)
	}

	programCategories { :self |
		self.programIndex.collect(first:/1).IdentitySet.Array.sorted.reject { :each |
			each = 'collect'
		}
	}

	programFetch { :self :category :author :name |
		system.window.fetchString(self.programUrl(category, author, name), (cache: 'no-cache'))
	}

	programNames { :self :category :author |
		self.programIndex.select { :each |
			each[1] = category & {
				each[2] = author
			}
		}.collect(third:/1).IdentitySet.Array.sorted
	}

	programParse { :self :aString |
		aString.replace('.sl', '').splitRegExp(RegExp(' - |/'))
	}

	programUrl { :self :category :author :name |
		['./lib/stsc3/help/', category, '/', author, ' - ', name, '.sl'].join
	}

	removeFrame { :self :frame |
		frame.outerElement.remove;
		self.frameSet.remove(frame)
	}

	ScalaJiTuningBrowser { :self :scalaJi :event |
		self.addFrame(scalaJi.ScalaJiTuningBrowser, event)
	}

	SvgViewer { :self :title :svg |
		self.addFrame(SvgViewer(title, svg), nil)
	}

	SystemBrowser { :self :event |
		self.addFrame(SystemBrowser(), event)
	}

	TableViewer { :self :title :tableData |
		self.addFrame(TableViewer(title, tableData), nil)
	}

	TraitBrowser { :self :event |
		self.addFrame(TraitBrowser(), event)
	}

	TypeBrowser { :self :event |
		self.addFrame(TypeBrowser(), event)
	}

	windowMenuEntries { :self |
		self.frameSet.Array.collect { :frame |
			MenuItem(frame.title, nil) { :unusedEvent |
				frame.bringToFront
			}
		}
	}

	WindowMenu { :self :event |
		| menu = Menu('Window Menu', self.windowMenuEntries); |
		self.addFrameWithAnimator(menu, event, 1) {
			menu.setEntries(self.windowMenuEntries)
		}
	}

	WorldMenu { :self :isTransient :event |
		self.menu('World Menu', self.worldMenuEntries, isTransient, event)
	}

	worldMenuEntries { :self |
		[
			MenuItem('Analogue Clock', nil) { :event |
				self.AnalogueClock(event)
			},
			MenuItem('Category Browser', nil) { :event |
				self.CategoryBrowser(event)
			},
			MenuItem('ColourChooser', nil) { :event |
				self.ColourChooser(self, event)
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
			MenuItem('Program Browser', nil) { :event |
				self.ProgramBrowser(event)
			},
			MenuItem('Reset Synthesiser', nil) { :event |
				workspace::clock.clear;
				system.defaultScSynth.reset
			},
			MenuItem('System Browser', nil) { :event |
				self.SystemBrowser(event)
			},
			MenuItem('Trait Browser', nil) { :event |
				self.TraitBrowser(event)
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

+Array {

	ScalaJiTuningBrowser { :self |
		|
			degrees = self.collect { :each |
				each::degree
			}.IdentitySet.Array.sorted.collect(asString:/1);
		|
		ColumnBrowser('Scala Ji Tuning Browser', 'text/html', false, true, [1, 1, 4], nil, nil) { :browser :path |
			path.size.caseOf([
				0 -> {
					browser.setStatus('Degree/Limit/Name');
					degrees
				},
				1 -> {
					browser.setStatus('Degree = ' ++ path[1]);
					self.select { :each |
						each::degree = path[1].parseInteger(10)
					}.collect { :each |
						each::limit
					}.IdentitySet.Array.sorted.collect(asString:/1)
				},
				2 -> {
					browser.setStatus(['Degree = ', path[1], ', Limit = ', path[2]].join);
					self.select { :each |
						each::degree = path[1].parseInteger(10) & {
							each::limit = path[2].parseInteger(10)
						}
					}.collect { :each |
						each::name
					}
				},
				3 -> {
					|
						selected = self.detect { :each |
							each::name = path[3]
						},
						ratio1 = selected::tuning[1],
						ratios = selected::tuning.collect { :each |
							Fraction(each, ratio1).reduced
						};
					|
					browser.setStatus(selected::description);
					[
						[1 .. selected::degree],
						ratios,
						ratios.collect { :each |
							(each.asFloat.RatioMidi * 100).rounded
						},
						selected::tuning
					].transpose.asHtmlTable.outerHTML
				}
			])
		}
	}

	MethodSignatureBrowser { :self :withFilter |
		| selectedMethod = nil; |
		ColumnBrowser('Method Signature Browser', 'text/plain', withFilter, true, [1], nil) { :accepted |
			selectedMethod.definition := accepted
		} { :browser :path |
			path.size.caseOf([
				0 -> {
					self
				},
				1 -> {
					selectedMethod := system.methodLookupAtSignature(path[1]);
					browser.setStatus(selectedMethod.origin.typeOf);
					selectedMethod.definition
				}
			])
		}
	}

}

+Void {

	SmallKansas {
		newSmallKansas().initialize
	}

	MethodBrowser {
		|
			methodNames = system.allMethods.collect(qualifiedName:/1).IdentitySet.Array.sorted,
			selectedMethod = nil;
		|
		ColumnBrowser('Method Browser', 'text/plain', true, true, [3, 1], nil) { :accepted |
			selectedMethod.definition := accepted
		} { :browser :path |
			path.size.caseOf([
				0 -> {
					methodNames
				},
				1 -> {
					system.methodTraits(path[1]) ++ system.methodTypes(path[1])
				},
				2 -> {
					browser.setStatus(
						system.isTypeName(path[2]).if {
							'Type'
						} {
							'Trait'
						}
					);
					selectedMethod := system.traitOrType(path[2]).methodDictionary[path[1]];
					selectedMethod.definition
				}
			])
		}
	}

	MethodSignatureBrowser {
		MethodSignatureBrowser(
			system.allMethods.collect(signature:/1).IdentitySet.Array.sorted,
			true
		)
	}

	CategoryBrowser {
		|
			typeNames = system.typeDictionary.keys.sorted,
			categoryNames = typeNames.collect { :each | system.categoryOf(each) }.IdentitySet.Array.sorted,
			methodSet = nil,
			selectedMethod = nil;
		|
		ColumnBrowser('Category Browser', 'text/plain', false, true, [1, 1, 3], nil) { :accepted |
			selectedMethod.definition := accepted
		} { :browser :path |
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
					selectedMethod := methodSet.detect { :each |
						each.qualifiedName = path[3]
					};
					browser.setStatus(selectedMethod.origin.name);
					selectedMethod.definition
				}
			])
		}
	}

	SystemBrowser {
		| typeNames = system.typeDictionary.keys.sorted, methodSet = nil, selectedMethod = nil; |
		ColumnBrowser('System Browser', 'text/plain', false, true, [1, 3], nil) { :accepted |
			selectedMethod.definition := accepted
		} { :browser :path |
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
					selectedMethod := methodSet.detect { :each |
						each.qualifiedName = path[2]
					};
					browser.setStatus(selectedMethod.origin.name);
					selectedMethod.definition
				}
			])
		}
	}

	TraitBrowser {
		| traitNames = system.traitDictionary.keys.sorted; |
		ColumnBrowser('Trait Browser', 'text/plain', false, true, [1, 3], nil, nil) { :browser :path |
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
		}
	}

	TypeBrowser {
		| typeNames = system.typeDictionary.keys.sorted, selectedMethod = nil; |
		ColumnBrowser('Type Browser', 'text/plain', false, true, [1, 3], nil) { :accepted |
			selectedMethod.definition := accepted
		} { :browser :path |
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
					selectedMethod := system.typeDictionary[path[1]].methodDictionary[path[2]];
					selectedMethod.definition
				}
			])
		}
	}

}

SvgViewer : [Object, View] { | svgPane title svg |

	createElements { :self |
		self.svgPane := 'div'.createElement;
		self.svgPane.setAttribute('class', 'svgPane');
		self.svgPane.appendChild(self.svg)
	}

	initialize { :self :title :svg |
		self.title := title;
		self.svg := svg;
		self.createElements;
		self
	}

	outerElement { :self |
		self.svgPane
	}

}

+String {

	SvgViewer { :self :svg |
		newSvgViewer().initialize(self, svg)
	}

}

TableViewer : [Object, View] { | title tablePane |

	createElements { :self :tableData |
		self.tablePane := 'div'.createElement;
		self.tablePane.setAttribute('class', 'tablePane');
		self.tablePane.appendChild(
			tableData.asHtmlTable
		)
	}

	initialize { :self :title :tableData |
		self.title := title;
		self.createElements(tableData);
		self
	}

	outerElement { :self |
		self.tablePane
	}

}

+String {

	TableViewer { :self :tableData |
		newTableViewer().initialize(self, tableData)
	}

}

TextEditor : [Object, UserEventTarget, View] { | editorPane editorText mimeType title clientKeyBindings eventListeners |

	addKeyBindings { :self :aCollection |
		self.clientKeyBindings.addAll(aCollection)
	}

	createElements { :self |
		self.editorPane := 'div'.createElement;
		self.editorText := (self.mimeType = 'text/plain').if {
			'pre'.createElement
		} {
			'div'.createElement
		};
		self.editorPane.appendChild(self.editorText)
	}

	currentText { :self |
		| text = system.window.getSelectedText; |
		text.isEmpty.ifTrue {
			text := self.editorText.textContent
		};
		text
	}

	currentWord { :self |
		| text = system.window.getSelectedText; |
		text.isEmpty.ifTrue {
			(* This should get the word at point, but it doesn't! *)
			nil
		};
		text
	}

	editable { :self :aBoolean |
		self.editorText.setAttribute('contentEditable', aBoolean.printString)
	}

	initialize { :self :title :mimeType :contents |
		self.title := title;
		self.mimeType := mimeType;
		self.clientKeyBindings := OrderedCollection();
		self.createElements;
		self.setAttributes;
		self.setEventHandlers;
		self.setEditorText(contents);
		self.eventListeners := IdentityDictionary();
		self
	}

	insertText { :self :aString |
		aString.insertAtCursor
	}

	keyBindings { :self |
		[
			MenuItem('Accept It', 'a') { :event |
				self.dispatchEvent(
					CustomEvent(
						'accept',
						(
							detail: self.editorText.textContent
						)
					)
				)
			},
			MenuItem('Browse It', 'b') { :event |
				workspace::smallKansas.browserOn([self.currentWord], event)
			},
			MenuItem('Do It', 'd') { :event |
				self.currentText.eval
			},
			MenuItem('Help For It', 'h') { :event |
				workspace::smallKansas.helpFor(self.currentWord.asMethodName, event)
			},
			MenuItem('Implementors Of It', 'm') { :event |
				workspace::smallKansas.implementorsOf(self.currentWord.asMethodName, event)
			},
			MenuItem('Play It', 'Enter') { :event |
				('{ ' ++ self.currentText ++ ' }.play').eval
			},
			MenuItem('Print It', 'p') { :event |
				self.insertText(' ' ++ self.currentText.eval.asString)
			},
			MenuItem('Reset Synthesiser', '.') { :event |
				workspace::clock.clear;
				system.defaultScSynth.reset
			}
		] ++ self.clientKeyBindings.Array
	}

	outerElement { :self |
		self.editorPane
	}

	setAttributes { :self |
		self.editorPane.setAttribute('class', 'editorPane');
		self.editorText.setAttribute('class', 'editorText');
		self.editorText.setAttributes((contentEditable: 'true', spellcheck: 'false'))
	}

	setEventHandlers { :self |
		self.editorText.addEventListener('contextmenu') { :event |
			event.preventDefault;
			self.textEditorMenu(event)
		};
		self.editorText.addEventListener('keydown') { :event |
			| bindingsArray = self.keyBindings.collect { :menuItem |
				menuItem.accessKey -> {
					event.preventDefault;
					menuItem.onSelect . (nil)
				}
			}; |
			event.ctrlKey.ifTrue {
				event.key.caseOfOtherwise(
					bindingsArray,
					{ :key |
						('TextEditor>keydown: not handled: ' ++ key).postLine
					}
				)
			}
		}
	}

	setEditorText { :self :aString |
		self.mimeType.caseOfOtherwise([
			'text/html' -> {
				self.editorText.innerHTML := aString
			},
			'text/markdown' -> {
				self.editorText.innerHTML := aString.markdownToHtml
			},
			'text/plain' -> {
				self.editorText.textContent := aString
			}
		]) {
			('TextEditor>>setEditorText: unkown mimeType: ' ++ self.mimeType).postLine
		}
	}

	textEditorMenu { :self :event |
		workspace::smallKansas.menu(
			'Text Editor Menu',
			self.keyBindings,
			true,
			event
		)
	}

}

+String {

	TextEditor { :self :mimeType :contents |
		newTextEditor().initialize(self, mimeType, contents)
	}

}

+String {

	TextButton { :self :aDictionary |
		| button = 'button'.createElement; |
		button.innerText := self;
		button.setAttributes(aDictionary);
		button
	}

	TextInput { :self |
		| input = 'input'.createElement; |
		input.setAttributes((
			type: 'text',
			value: self
		));
		input
	}

	TextListItem { :self |
		| listItem = 'li'.createElement; |
		listItem.textContent := self;
		listItem
	}

	TextOption { :self :value |
		| option = 'option'.createElement; |
		option.text := self.isEmpty.if {
			'Unspecified*'
		} {
			self
		};
		option.value := value;
		option
	}

}
