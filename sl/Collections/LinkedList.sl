@Link { (* nextLink *)

	asLink { :self |
		self
	}

}

+@Object {

	asLink { :self |
		ValueLink(self)
	}

}

LinkedList : [Object, Collection, SequenceableCollection] { | firstLink lastLink |

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

	Array { :self |
		| answer = Array(self.size), index = 1; |
		self.do { :each |
			answer[index] := each;
			index := index + 1
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

	collect { :self :aProcedure:/1 |
		|(
			aLink = self.firstLink,
			answer = LinkedList()
		)|
		{
			aLink = nil
		}.whileFalse {
			answer.add(aProcedure(aLink.value));
			aLink := aLink.nextLink
		};
		answer
	}

	do { :self :aProcedure:/1 |
		| aLink = self.firstLink; |
		{
			aLink = nil
		}.whileFalse {
			aProcedure(aLink.value);
			aLink := aLink.nextLink
		}
	}

	isEmpty { :self |
		self.firstLink.isNil
	}

	linkAt { :self :index |
		self.linkAtIfAbsent(index) {
			self.errorSubscriptBounds(index)
		}
	}

	linkAtIfAbsent { :self :index :errorProcedure:/0 |
		| i = 0; |
		valueWithReturn { :return:/1 |
			self.linksDo { :link |
				i := i + 1;
				(i = index).ifTrue {
					link.return
				}
			};
			errorProcedure()
		}
	}

	linkOf { :self :anObject |
		self.linkOfIfAbsent(anObject) {
			'LinkedList>>linkOf: no such element'.error
		}
	}

	linkOfIfAbsent { :self :anObject :errorProcedure:/0 |
		valueWithReturn { :return:/1 |
			self.linksDo { :link |
				(link.value = anObject.value).ifTrue {
					link.return
				}
			};
			errorProcedure()
		}
	}

	linksDo { :self :aProcedure:/1 |
		| aLink = self.firstLink; |
		{
			aLink = nil
		}.whileFalse {
			aProcedure(aLink);
			aLink := aLink.nextLink
		}
	}

	ofSize { :self :aNumber |
		(aNumber - self.size).timesRepeat {
			self.add(nil)
		};
		self
	}

	removeAll { :self |
		self.firstLink := nil;
		self.lastLink := nil
	}

	removeAllSuchThat { :self :aProcedure:/1 |
		self.do { :each |
			aProcedure(each).ifTrue {
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

	removeIfAbsent { :self :aLinkOrObject :aProcedure:/0 |
		| link = self.linkOfIfAbsent(aLinkOrObject, aProcedure:/0); |
		self.removeLinkIfAbsent(link) {
			aProcedure()
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

	removeLinkIfAbsent { :self :aLink :aProcedure:/0 |
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
						aProcedure().return
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

	select { :self :aProcedure:/1 |
		| answer = LinkedList(); |
		self.do { :each |
			each.aProcedure.ifTrue {
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

	LinkedList { :self |
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

Stack : [Object] { | linkedList |

	errorEmptyStack { :self |
		'Stack: this stack is empty'.error
	}

	ifNotEmpty { :self :aBlock:/0 |
		self.isEmpty.if {
			self.errorEmptyStack
		} {
			aBlock()
		}
	}

	isEmpty { :self |
		self.linkedList.isEmpty
	}

	pop { :self |
		self.ifNotEmpty {
			self.linkedList.removeFirst.value
		}
	}

	push { :self :anObject |
		self.linkedList.addFirst(anObject);
		anObject
	}

	size { :self |
		self.linkedList.size
	}

	top { :self |
		self.ifNotEmpty {
			self.linkedList.first.value
		}
	}

}

+Void {

	Stack {
		newStack().initializeSlots(LinkedList())
	}

}
