@Link {

	do { :self :aBlock/1 |
		self.linksDo { :each |
			aBlock(each.value)
		}
	}

	lastLink { :self |
		let answer = self;
		{ answer.nextLink.isNil }.whileFalse {
			answer := answer.nextLink
		};
		answer
	}

	linkAt { :self :index |
		self.linkAtIfAbsent(index) {
			self.errorInvalidIndex('linkAt', index)
		}
	}

	linkAtIfAbsent { :self :index :errorBlock/0 |
		let counter = 0;
		withReturn { :return/1 |
			self.linksDo { :link |
				counter := counter + 1;
				(counter = index).ifTrue {
					link.return
				}
			};
			errorBlock()
		}
	}

	linkOf { :self :anObject |
		self.linkOfIfAbsent(anObject) {
			'linkOf: no such element'.error
		}
	}

	linkOfIfAbsent { :self :anObject :errorBlock/0 |
		withReturn { :return/1 |
			self.linksDo { :link |
				(link.value = anObject).ifTrue {
					link.return
				}
			};
			errorBlock()
		}
	}

	linksDo { :self :aBlock/1 |
		let link = self;
		{ link.isNil }.whileFalse {
			aBlock(link);
			link := link.nextLink
		}
	}

	[List, linkToList] { :self |
		let h = self;
		let answer = [];
		{
			h.isNotNil
		}.whileTrue {
			answer.add!(h.value);
			h := h.nextLink
		};
		answer
	}

	nextLink { :self |
		self.typeResponsibility('nextLink')
	}

}

LinkedList : [Object, Copy, Store, Equal, Compare, Do, At, Put, New, Collect, FiniteCollection, Add, Remove, Sequence] {

	| firstLink lastLink |

	addFirst! { :self :anObject |
		let aLink = ValueLink(anObject);
		self.isEmpty.ifTrue {
			self.lastLink := aLink
		};
		aLink.nextLink := self.firstLink;
		self.firstLink := aLink;
		aLink
	}

	[addLast!, add!] { :self :anObject |
		let aLink = ValueLink(anObject);
		self.isEmpty.if {
			self.firstLink := aLink
		} {
			self.lastLink.nextLink := aLink
		};
		self.lastLink := aLink;
		aLink
	}

	atIfAbsent { :self :index :ifAbsent/0 |
		self.linkAtIfAbsent(index, ifAbsent/0).value
	}

	collect { :self :aBlock/1 |
		let aLink = self.firstLink;
		let answer = LinkedList();
		{
			aLink = nil
		}.whileFalse {
			answer.add!(aBlock(aLink.value));
			aLink := aLink.nextLink
		};
		answer
	}

	do { :self :aBlock/1 |
		self.ifNotEmpty {
			self.firstLink.do(aBlock/1)
		}
	}

	includesIndex { :self :index |
		index.betweenAnd(1, self.size)
	}

	isEmpty { :self |
		self.firstLink.isNil
	}

	linkAt { :self :index |
		self.ifEmpty {
			self.error('linkAt: empty')
		} {
			self.firstLink.linkAt(index)
		}
	}

	linkAtIfAbsent { :self :index :errorBlock/0 |
		self.ifEmpty {
			errorBlock()
		} {
			self.firstLink.linkAtIfAbsent(index, errorBlock/0)
		}
	}

	linkOf { :self :anObject |
		self.ifEmpty {
			self.error('linkOf: empty')
		} {
			self.firstLink.linkOf(anObject)
		}
	}

	linkOfIfAbsent { :self :anObject :errorBlock/0 |
		self.ifEmpty {
			errorBlock()
		} {
			self.firstLink.linkOfIfAbsent(anObject, errorBlock/0)
		}
	}

	linksDo { :self :aBlock/1 |
		self.ifNotEmpty {
			self.firstLink.linksDo(aBlock/1)
		};
		nil
	}

	[List, linkedListToList] { :self |
		let answer = List(self.size, nil);
		let index = 1;
		self.do { :each |
			answer[index] := each;
			index := index + 1
		};
		answer
	}

	postCopy { :self |
		self.firstLink.ifNotNil {
			let aLink = self.firstLink := self.firstLink.copy;
			{
				aLink.nextLink.isNil
			}.whileFalse {
				aLink.nextLink := (aLink := aLink.nextLink.copy)
			};
			self.lastLink := aLink
		}
	}

	put! { :self :index :anObject |
		self.putLink!(
			index,
			self.linkOfIfAbsent(anObject) {
				ValueLink(anObject)
			}
		)
	}

	putLink! { :self :index :aLink |
		/* Putting a link which is already in the list will create an infinite loop */
		self.includesIndex(index).ifFalse {
			'LinkedList>>putLink!: errorOutOfBounds'.error
		};
		(index = 1).if {
			aLink.nextLink := self.firstLink.nextLink;
			self.firstLink := aLink;
			aLink.nextLink.ifNil {
				self.lastLink := aLink
			}
		} {
			let previousLink = self.linkAt(index - 1);
			let nextLink = previousLink.nextLink.nextLink;
			nextLink.ifNil {
				aLink.nextLink := self.lastLink
			} {
				aLink.nextLink := nextLink
			};
			previousLink.nextLink := aLink;
			nextLink.ifNil {
				self.lastLink := aLink;
				aLink.nextLink := nil
			}
		};
		aLink
	}

	removeAll! { :self |
		self.firstLink := nil;
		self.lastLink := nil
	}

	removeAllSuchThat! { :self :aBlock/1 |
		self.do { :each |
			aBlock(each).ifTrue {
				self.remove!(each)
			}
		}
	}

	removeFirst! { :self |
		let oldLink = self.firstLink;
		self.emptyCheck;
		(self.firstLink == self.lastLink).if {
			self.removeAll!
		} {
			self.firstLink := oldLink.nextLink
		};
		oldLink.nextLink := nil;
		oldLink.value
	}

	removeIfAbsent! { :self :anObject :aBlock/0 |
		let link = self.linkOfIfAbsent(anObject, aBlock/0);
		self.removeLinkIfAbsent!(link) {
			aBlock()
		};
		anObject
	}

	removeLast! { :self |
		let oldLink = self.lastLink;
		let aLink = nil;
		self.emptyCheck;
		(self.firstLink == self.lastLink).if {
			self.removeAll!
		} {
			aLink := self.firstLink;
			{
				aLink.nextLink == oldLink
			}.whileFalse {
				aLink := aLink.nextLink
			};
			aLink.nextLink := nil;
			self.lastLink := aLink
		};
		oldLink.nextLink := nil;
		oldLink.value
	}

	removeLinkIfAbsent! { :self :aLink :aBlock/0 |
		withReturn { :return/1 |
			(aLink == self.firstLink).if {
				self.firstLink := aLink.nextLink;
				(aLink == self.lastLink).ifTrue {
					self.lastLink := nil
				}
			} {
				let tempLink = self.firstLink;
				{
					tempLink.ifNil {
						aBlock().return
					};
					tempLink.nextLink == aLink
				}.whileFalse {
					tempLink := tempLink.nextLink
				};
				tempLink.nextLink := aLink.nextLink;
				(aLink == self.lastLink).ifTrue {
					self.lastLink := tempLink
				}
			};
			aLink
		}
	}

	select { :self :aBlock/1 |
		let answer = LinkedList();
		self.do { :each |
			each.aBlock.ifTrue {
				answer.add!(each)
			}
		};
		answer
	}

	species { :self |
		LinkedList/0
	}

	storeString { :self |
		'LinkedList(%)'.format([self.List.storeString])
	}

}

+@FiniteCollection {

	LinkedList { :self |
		let answer = LinkedList();
		answer.addAll!(self);
		answer
	}

}

+Void {

	LinkedList {
		newLinkedList().initializeSlots(nil, nil)
	}

}

ValueLink : [Object, Copy, Store, Equal, Link] {

	| nextLink value |

	equalBy { :self :anObject :aBlock/2 |
		anObject.isValueLink & {
			aBlock(self.value, anObject.value) & {
				self.nextLink == anObject.nextLink
			}
		}
	}

}

+@Object {

	ValueLink { :self |
		newValueLink().initializeSlots(nil, self)
	}

}
