LinkedList : [Collection, SequenceableCollection]  { | firstLink lastLink |

	isEmpty { :self | self.firstLink.isNil }
	species { :self | Array }

	add { :self :aLinkOrObject | self.addLast(aLinkOrObject) }

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

	collect { :self :aBlock |
		| aLink = self.firstLink, answer = LinkedList(); |
		 { aLink == nil }.whileFalse {
			 answer.add(aBlock(aLink.value));
			 aLink := aLink.nextLink
		 };
		answer
	}

	collectThenSelect { :self :collectBlock :selectBlock |
		| answer = LinkedList(); |
		self.do { :each |
			| next = collectBlock(each); |
			selectBlock(next).ifTrue { answer.add(next) }
		};
		answer
	}

	do { :self :aBlock |
		| aLink = self.firstLink; |
		{ aLink == nil }.whileFalse {
			aBlock(aLink.value);
			aLink := aLink.nextLink
		}
	}

	linkAt { :self :index |
		self.linkAtIfAbsent(index, { self.errorSubscriptBounds(index) })
	}

	linkAtIfAbsent { :self :index :errorBlock |
		| i  = 0; |
		withReturn {
			self.linksDo { :link | i := i + 1; ifTrue(i = index) { return(link) } };
			errorBlock()
		}
	}

	linkOfIfAbsent { :self :anObject :errorBlock |
		withReturn {
			self.linksDo { :link | (link.value = anObject.value).ifTrue { return(link) } };
			errorBlock()
		}
	}

	linksDo { :self :aBlock |
		| aLink = self.firstLink; |
		{ aLink == nil }.whileFalse {
			aBlock(aLink);
			aLink := aLink.nextLink
		}
	}

	ofSize { :self :aNumber |
		(aNumber - self.size).timesRepeat { self.add(nil) };
		self
	}

	removeAll { :self |
		self.firstLink := nil;
		self.lastLink := nil
	}

	removeAllSuchThat { :self :aBlock |
		self.do { :each | aBlock(each).ifTrue { self.remove(each) } }
	}

	removeFirst { :self |
		| oldLink = self.firstLink; |
		self.emptyCheck;
		if(self.firstLink == self.lastLink) {
			self.removeAll
		} {
			self.firstLink := oldLink.nextLink
		};
		oldLink.nextLink := nil;
		oldLink.value
	}

	removeIfAbsent { :self :aLinkOrObject :aBlock |
		| link = self.linkOfIfAbsent(aLinkOrObject, { aBlock() }); |
		self.removeLinkIfAbsent(link, { aBlock() });
		aLinkOrObject
	}

	removeLast { :self |
		| oldLink = self.lastLink, aLink = nil; |
		self.emptyCheck;
		if(self.firstLink == self.lastLink) {
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

	removeLinkIfAbsent { :self :aLink :aBlock |
		withReturn {
			if(aLink == self.firstLink) {
				self.firstLink := aLink.nextLink;
				(aLink == self.lastLink).ifTrue { self.lastLink := nil }
			} {
				| tempLink = self.firstLink; |
				{
					tempLink.ifNil { return(aBlock()) };
					tempLink.nextLink == aLink
				}.whileFalse {
					tempLink := tempLink.nextLink
				};
				tempLink.nextLink := aLink.nextLink;
				(aLink == lastLink).ifTrue { self.lastLink := tempLink }
			};
			aLink
		}
	}

	select { :self :aBlock |
		| answer = LinkedList(); |
		self.do { :each | aBlock(each).ifTrue { answer.add(each) } };
		answer
	}

	selectThenCollect { :self :selectBlock :collectBlock |
		| answer = LinkedList(); |
		self.do { :each | selectBlock(each).ifTrue { answer.add(collectBlock(each)) } };
		answer
	}

}

+ Number {
	LinkedList { :self | LinkedList() }
}

+ @Collection {

	LinkedList { :self |
		| answer = LinkedList(); |
		self.do { :each | answer.add(each) };
		answer
	}

}

+ Void {
	LinkedList { LinkedList(nil, nil) }
}
