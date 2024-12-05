DirectedEdge : [Object] { | contents |

	asDot { :self |
		let [from, to] = self.contents;
		'% -> %;'.format([from, to])
	}

	asDirectedEdge { :self |
		self
	}

	asEdge { :self |
		self
	}

	asUndirectedEdge { :self |
		let [i, j] = self.contents;
		UndirectedEdge(i, j)
	}

	at { :self :index |
		self.contents[index]
	}

	head { :self |
		self[2]
	}

	isEdge { :self |
		true
	}

	isUndirectedEdge { :self |
		false
	}

	matchesEdge { :self :edge |
		self = edge | {
			edge.isUndirectedEdge.if {
				edge.matchesEdge(self)
			} {
				false
			}
		}
	}

	printString { :self |
		let [i, j] = self.contents;
		'% --> %'.format([i, j])
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

	tail { :self |
		self[1]
	}

}

+Association {

	asEdge { :self |
		DirectedEdge(self.key, self.value)
	}

}

+SmallFloat {

	--> { :self :anInteger |
		DirectedEdge(self, anInteger)
	}

	DirectedEdge { :self :anInteger |
		newDirectedEdge().initializeSlots([self, anInteger])
	}

}
