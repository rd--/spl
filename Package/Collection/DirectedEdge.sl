DirectedEdge : [Object, Store, Equal, Compare, At] {

	| vertexList |

	Association { :self |
		let [from, to] = self.vertexList;
		from -> to
	}

	at { :self :index |
		self.vertexList[index]
	}

	compare { :self :anEdge |
		self.vertexList.compare(
			anEdge.vertexList
		)
	}

	DirectedEdge { :self |
		self
	}

	Edge { :self |
		self
	}

	forDot { :self :isMixed |
		let [from, to] = self.vertexList;
		'% -> %;'.format([from, to])
	}

	head { :self |
		self.vertexList[2]
	}

	includes { :self :vertex |
		self.vertexList.includes(vertex)
	}

	isDirected { :self |
		true
	}

	isEdge { :self |
		true
	}

	isSelfLoop { :self |
		let [i, j] = self.vertexList;
		i = j
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
		let [i, j] = self.vertexList;
		aDictionary[i] --> aDictionary[j]
	}

	size { :unused |
		2
	}

	tail { :self |
		self.vertexList[1]
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

	--> { :self :anInteger |
		DirectedEdge(self, anInteger)
	}

	DirectedEdge { :self :anInteger |
		newDirectedEdge().initializeSlots([self, anInteger])
	}

}
