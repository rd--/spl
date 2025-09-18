DirectedEdge : [Object, Comparable, Indexable] { | vertexList |

	asAssociation { :self |
		let [from, to] = self.vertexList;
		from -> to
	}

	asDirectedEdge { :self |
		self
	}

	asEdge { :self |
		self
	}

	asUndirectedEdge { :self |
		let [i, j] = self.vertexList;
		UndirectedEdge(i, j)
	}

	at { :self :index |
		self.vertexList.at(index)
	}

	compare { :self :anEdge |
		self.vertexList.compare(anEdge.vertexList)
	}

	forDot { :self :isMixed |
		let [from, to] = self.vertexList;
		'% -> %;'.format([from, to])
	}

	head { :self |
		self[2]
	}

	includes { :self :vertex |
		self.vertexList.includes(vertex)
	}

	indices { :self |
		[1 2]
	}

	isDirected { :self |
		true
	}

	isEdge { :self |
		true
	}

	isUndirected { :self |
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
		let [i, j] = self.vertexList;
		'% --> %'.format([i, j])
	}

	rename { :self :aDictionary |
		aDictionary[self[1]] --> aDictionary[self[2]]
	}

	size { :self |
		2
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
