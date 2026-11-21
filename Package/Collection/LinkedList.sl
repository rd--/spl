LinkedList : [Object, New, Copy, Store, Equal, Compare, Do, At, Indices, Put, Collection, Add, Remove, Sequence] {

	| firstLink lastLink |

	[List, linkedListToList] { :self |
		let answer = List(self.size, nil);
		let index = 1;
		self.do { :each |
			answer[index] := each;
			index := index + 1
		};
		answer
	}

	addFirst! { :self :anObject |
		let aLink = Link(anObject, self.firstLink);
		self.isEmpty.ifTrue {
			self.lastLink := aLink
		};
		self.firstLink := aLink;
		aLink
	}

	[addLast!, add!] { :self :anObject |
		let aLink = Link(anObject, nil);
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

	collect { :self :aFunction/1 |
		let aLink = self.firstLink;
		let answer = LinkedList();
		{
			aLink = nil
		}.whileFalse {
			answer.add!(aFunction(aLink.value));
			aLink := aLink.nextLink
		};
		answer
	}

	do { :self :aFunction/1 |
		self.ifNotEmpty {
			self.firstLink.do(aFunction/1)
		}
	}

	indices { :self :index |
		Range(1, self.size)
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

	linkAtIfAbsent { :self :index :errorFunction/0 |
		self.ifEmpty {
			errorFunction()
		} {
			self.firstLink.linkAtIfAbsent(index, errorFunction/0)
		}
	}

	linkOf { :self :anObject |
		self.ifEmpty {
			self.error('linkOf: empty')
		} {
			self.firstLink.linkOf(anObject)
		}
	}

	linkOfIfAbsent { :self :anObject :errorFunction/0 |
		self.ifEmpty {
			errorFunction()
		} {
			self.firstLink.linkOfIfAbsent(anObject, errorFunction/0)
		}
	}

	linksDo { :self :aFunction/1 |
		self.ifNotEmpty {
			self.firstLink.linksDo(aFunction/1)
		}
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
				Link(anObject, nil)
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

	removeAllSuchThat! { :self :aFunction/1 |
		self.do { :each |
			aFunction(each).ifTrue {
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

	removeIfAbsent! { :self :anObject :aFunction/0 |
		let link = self.linkOfIfAbsent(anObject, aFunction/0);
		self.removeLinkIfAbsent!(link) {
			aFunction()
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

	removeLinkIfAbsent! { :self :aLink :aFunction/0 |
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
						aFunction().return
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

	reverse { :self |
		let answer = LinkedList();
		self.do { :each |
			answer.addFirst!(each)
		};
		answer
	}

	select { :self :aFunction/1 |
		let answer = LinkedList();
		self.do { :each |
			each.aFunction.ifTrue {
				answer.add!(each)
			}
		};
		answer
	}

	size { :self |
		self.isEmpty.if {
			0L
		} {
			self.firstLink.size
		}
	}

	species { :unused |
		LinkedList/0.emptySpecies
	}

	storeString { :self |
		'LinkedList(%)'.format([self.List.storeString])
	}

}

+@Collection {

	[LinkedList, collectionToLinkedList] { :self |
		let answer = LinkedList();
		answer.addAll!(self);
		answer
	}

}

+Void {

	[LinkedList, emptyLinkedList] {
		newLinkedList().initializeSlots(nil, nil)
	}

}
