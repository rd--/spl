UndirectedEdge : [Object, Store, Equal, Compare, At] {

	| vertexList |

	at { :self :index |
		self.vertexList[index]
	}

	compare { :self :anEdge |
		self.vertexList.compare(anEdge.vertexList)
	}

	DirectedEdge { :self |
		let [i, j] = self.vertexList;
		DirectedEdge(i, j)
	}

	Edge { :self |
		self
	}

	forDot { :self :isMixed |
		let [i, j] = self.vertexList;
		isMixed.if {
			'% -> % [dir=none];'.format([i, j])
		} {
			'% -- %;'.format([i, j])
		}
	}

	hasCommonVertex { :self :anEdge |
		let [i, j] = anEdge.vertexList;
		self.vertexList.includes(i) | {
			self.vertexList.includes(j)
		}
	}

	includes { :self :vertex |
		self.vertexList.includes(vertex)
	}

	isDirected { :self |
		false
	}

	isEdge { :self |
		true
	}

	isSelfLoop { :self |
		let [i, j] = self.vertexList;
		i = j
	}

	isUndirected { :self |
		true
	}

	matchesEdge { :self :edge |
		self.vertexList = edge.vertexList.sort
	}

	printString { :self |
		let [i, j] = self.vertexList;
		'% --- %'.format([i, j])
	}

	rename { :self :aDictionary |
		let [i, j] = self.vertexList;
		aDictionary[i] --- aDictionary[j]
	}

	UndirectedEdge { :self |
		self
	}

}

+List {

	Edge { :self |
		let [i, j] = self;
		UndirectedEdge(i, j)
	}

}

+SmallFloat {

	--- { :self :anInteger |
		UndirectedEdge(self, anInteger)
	}

	UndirectedEdge { :self :anInteger |
		newUndirectedEdge().initializeSlots(
			[self, anInteger].sort!
		)
	}

}
