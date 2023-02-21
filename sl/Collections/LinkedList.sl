LinkedList : [Object, Collection, SequenceableCollection]  { | firstLink lastLink |

	isEmpty { :self |
		self.firstLink.isNil
	}

	species { :self |
		Array:/1
	}

	add { :self :aLinkOrObject |
		self.addLast(aLinkOrObject)
	}

	addFirst { :self :aLinkOrObject |
		| aLink = aLinkOrObject.asLink; |
		self.isEmpty.ifTrue { self.lastLink := aLink };
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
		self.do { :each | answer[index] := each; index := index + 1 };
		answer
	}

	at { :self :index |
		self.linkAt(index).value
	}

	collect { :self :aProcedure:/1 |
		| aLink = self.firstLink, answer = LinkedList(); |
		 { aLink == nil }.whileFalse {
			 answer.add(aProcedure(aLink.value));
			 aLink := aLink.nextLink
		 };
		answer
	}

	collectThenSelect { :self :collectProcedure:/1 :selectProcedure:/1 |
		| answer = LinkedList(); |
		self.do { :each |
			| next = collectProcedure(each); |
			selectProcedure(next).ifTrue {
				answer.add(next)
			}
		};
		answer
	}

	do { :self :aProcedure:/1 |
		| aLink = self.firstLink; |
		{ aLink == nil }.whileFalse {
			aProcedure(aLink.value);
			aLink := aLink.nextLink
		}
	}

	linkAt { :self :index |
		self.linkAtIfAbsent(index) { self.errorSubscriptBounds(index) }
	}

	linkAtIfAbsent { :self :index :errorProcedure:/0 |
		| i  = 0; |
		withReturn {
			self.linksDo { :link | i := i + 1; ifTrue(i = index) { return(link) } };
			errorProcedure()
		}
	}

	linkOfIfAbsent { :self :anObject :errorProcedure:/0 |
		withReturn {
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
		{ aLink == nil }.whileFalse {
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
			{ aLink.nextLink == oldLink }.whileFalse {
				aLink := aLink.nextLink
			};
			aLink.nextLink := nil;
			self.lastLink := aLink
		};
		oldLink.nextLink := nil;
		oldLink.value
	}

	removeLinkIfAbsent { :self :aLink :aProcedure:/0 |
		withReturn {
			(aLink == self.firstLink).if {
				self.firstLink := aLink.nextLink;
				(aLink == self.lastLink).ifTrue { self.lastLink := nil }
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
				(aLink == self.lastLink).ifTrue { self.lastLink := tempLink }
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

	selectThenCollect { :self :selectProcedure:/1 :collectProcedure:/1 |
		| answer = LinkedList(); |
		self.do { :each |
			each.selectProcedure.ifTrue {
				answer.add(collectProcedure(each))
			}
		};
		answer
	}

}

+ Number {

	LinkedList { :self |
		LinkedList()
	}

}

+ @Collection {

	LinkedList { :self |
		| answer = LinkedList(); |
		self.do { :each |
			answer.add(each)
		};
		answer
	}

}

+ Void {

	LinkedList {
		newLinkedList()
	}

}
