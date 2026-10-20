DirectedEdge : [Object, Store, Equal, Compare, At, Indices] {

	| vertexList |

	Association { :self |
		let [from, to] = self.vertexList;
		from -> to
	}

	at { :self :index |
		self.vertexList.at(index)
	}

	compare { :self :anEdge |
		compareOn(self, anEdge, vertexList/1)
	}

	[DirectedEdge, Edge] { :self |
		self
	}

	forDot { :self :isMixed |
		let [from, to] = self.vertexList;
		'% -> %;'.format([from, to])
	}

	head { :self |
		self.vertexList.at(2)
	}

	includes { :self :vertex |
		self.vertexList.includes(vertex)
	}

	indices { :unused |
		[1, 2]
	}

	isDirected { :unused |
		true
	}

	isEdge { :unused |
		true
	}

	isSelfLoop { :self |
		let [i, j] = self.vertexList;
		i = j
	}

	isUndirected { :unused |
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
		let [i, j] = self.vertexList;
		aDictionary[i] --> aDictionary[j]
	}

	size { :unused |
		2
	}

	tail { :self |
		self.vertexList.at(1)
	}

	UndirectedEdge { :self |
		let [i, j] = self.vertexList;
		UndirectedEdge(i, j)
	}

}

+Association {

	Edge { :self |
		DirectedEdge(self.key, self.value)
	}

}

+SmallFloat {

	[DirectedEdge, -->] { :self :anInteger |
		newDirectedEdge().initializeSlots([self, anInteger])
	}

}
