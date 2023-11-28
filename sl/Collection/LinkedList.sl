@Link {

	asLink { :self |
		self
	}

	nextLink { :self |
		self.typeResponsibility('nextLink')
	}


}

+@Object {

	asLink { :self |
		ValueLink(self)
	}

}

LinkedList : [Object, Iterable, Collection, Extensible, Removable, Sequenceable] { | firstLink lastLink |

	add { :self :aLinkOrObject |
		self.addLast(aLinkOrObject)
	}

	addFirst { :self :aLinkOrObject |
		| aLink = aLinkOrObject.asLink; |
		self.isEmpty.ifTrue {
			self.lastLink := aLink
		};
		aLink.nextLink := self.firstLink;
		self.firstLink := aLink;
		aLink
	}

	addLast { :self :aLinkOrObject |
		| aLink = aLinkOrObject.asLink; |
		self.isEmpty.if {
			self.firstLink := aLink
		} {
			self.lastLink.nextLink := aLink
		};
		self.lastLink := aLink;
		aLink
	}

	asArray { :self |
		| answer = Array(self.size), index = 1; |
		self.do { :each |
			answer[index] := each;
			index +:= 1
		};
		answer
	}

	at { :self :index |
		self.linkAt(index).value
	}

	atPut { :self :index :anObject |
		self.atPutLink(index, self.linkOfIfAbsent(anObject) {
			anObject.asLink
		})
	}

	atPutLink { :self :index :aLink |
		(* Putting a link which is already in the list will create an infinite loop *)
		self.validIndex(index).ifFalse {
			'LinkedList>>atPutLink: errorOutOfBounds'.error
		};
		(index = 1).if {
			aLink.nextLink(self.firstLink.nextLink);
			self.firstLink := aLink;
			aLink.nextLink.ifNil {
				self.lastLink := aLink
			}
		} {
			|(
				previousLink = self.linkAt(index - 1),
				nextLink = previousLink.nextLink.nextLink
			)|
			nextLink.ifNil {
				aLink.nextLink(self.lastLink)
			} {
				aLink.nextLink(nextLink)
			};
			previousLink.nextLink(aLink);
			nextLink.ifNil {
				self.lastLink := aLink;
				aLink.nextLink(nil)
			}
		};
		aLink
	}

	collect { :self :aBlock:/1 |
		|(
			aLink = self.firstLink,
			answer = LinkedList()
		)|
		{
			aLink = nil
		}.whileFalse {
			answer.add(aBlock(aLink.value));
			aLink := aLink.nextLink
		};
		answer
	}

	do { :self :aBlock:/1 |
		| aLink = self.firstLink; |
		{
			aLink = nil
		}.whileFalse {
			aBlock(aLink.value);
			aLink := aLink.nextLink
		}
	}

	isEmpty { :self |
		self.firstLink.isNil
	}

	linkAt { :self :index |
		self.linkAtIfAbsent(index) {
			self.errorInvalidIndex('linkAt', index)
		}
	}

	linkAtIfAbsent { :self :index :errorBlock:/0 |
		| counter = 0; |
		valueWithReturn { :return:/1 |
			self.linksDo { :link |
				counter +:= 1;
				(counter = index).ifTrue {
					link.return
				}
			};
			errorBlock()
		}
	}

	linkOf { :self :anObject |
		self.linkOfIfAbsent(anObject) {
			'LinkedList>>linkOf: no such element'.error
		}
	}

	linkOfIfAbsent { :self :anObject :errorBlock:/0 |
		valueWithReturn { :return:/1 |
			self.linksDo { :link |
				(link.value = anObject.value).ifTrue {
					link.return
				}
			};
			errorBlock()
		}
	}

	linksDo { :self :aBlock:/1 |
		| aLink = self.firstLink; |
		{
			aLink = nil
		}.whileFalse {
			aBlock(aLink);
			aLink := aLink.nextLink
		}
	}

	ofSize { :self :aNumber |
		(aNumber - self.size).timesRepeat {
			self.add(nil)
		};
		self
	}

	postCopy { :self |
		self.firstLink.ifNotNil {
			| aLink = self.firstLink := self.firstLink.copy; |
			{ aLink.nextLink.isNil }.whileFalse {
				aLink.nextLink(aLink := aLink.nextLink.copy)
			};
			self.lastLink := aLink
		}
	}

	removeAll { :self |
		self.firstLink := nil;
		self.lastLink := nil
	}

	removeAllSuchThat { :self :aBlock:/1 |
		self.do { :each |
			aBlock(each).ifTrue {
				self.remove(each)
			}
		}
	}

	removeFirst { :self |
		| oldLink = self.firstLink; |
		self.emptyCheck;
		(self.firstLink == self.lastLink).if {
			self.removeAll
		} {
			self.firstLink := oldLink.nextLink
		};
		oldLink.nextLink := nil;
		oldLink.value
	}

	removeIfAbsent { :self :aLinkOrObject :aBlock:/0 |
		| link = self.linkOfIfAbsent(aLinkOrObject, aBlock:/0); |
		self.removeLinkIfAbsent(link) {
			aBlock()
		};
		aLinkOrObject
	}

	removeLast { :self |
		| oldLink = self.lastLink, aLink = nil; |
		self.emptyCheck;
		(self.firstLink == self.lastLink).if {
			self.removeAll
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

	removeLinkIfAbsent { :self :aLink :aBlock:/0 |
		valueWithReturn { :return:/1 |
			(aLink == self.firstLink).if {
				self.firstLink := aLink.nextLink;
				(aLink == self.lastLink).ifTrue {
					self.lastLink := nil
				}
			} {
				| tempLink = self.firstLink; |
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

	select { :self :aBlock:/1 |
		| answer = LinkedList(); |
		self.do { :each |
			each.aBlock.ifTrue {
				answer.add(each)
			}
		};
		answer
	}

	species { :self |
		Array:/1
	}

	validIndex { :self :index |
		(index > 0) & {
			index <= self.size
		}
	}

}

+@Collection {

	asLinkedList { :self |
		| answer = LinkedList(); |
		self.do { :each |
			answer.add(each)
		};
		answer
	}

}

+Void {

	LinkedList {
		newLinkedList()
	}

}

ValueLink : [Object, Link] { | nextLink value |

	= { :self :anObject |
		anObject.isValueLink & {
			self.value = anObject.value & {
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
