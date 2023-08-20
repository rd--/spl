Queens : [Object] { | freeMaxs freeRows freeMins queenRows |

	benchmark { :self |
		| result = true; |
		1.toDo(10) { :i |
			result := result & { self.queens }
		};
		result
	}

	queens { :self |
		self.freeRows := Array(8, true);
		self.freeMaxs := Array(16, true);
		self.freeMins := Array(16, true);
		self.queenRows := Array(8, -1);
		self.placeQueen(1)
	}

	placeQueen { :self :c |
		valueWithReturn { :return:/1 |
			1.toDo(8) { :r |
				self.rowColumn(r, c).ifTrue {
					self.queenRows[r] := c;
					self.rowColumnPut(r, c, false);
					(c = 8).ifTrue {
						true.return
					};
					self.placeQueen(c + 1).ifTrue {
						true.return
					};
					self.rowColumnPut(r, c, true)
				}
			};
			false
		}
	}

	rowColumn { :self :r :c |
		self.freeRows[r] & {
			self.freeMaxs[c + r] & {
				self.freeMins[c - r + 8]
			}
		}
	}

	rowColumnPut { :self :r :c :v |
		self.freeRows[r] := v;
		self.freeMaxs[c + r] := v;
		self.freeMins[c - r + 8] := v
	}

}

+Void {

	Queens {
		newQueens().benchmark
	}

}

(*

{ Queens() }.millisecondsToRun

*)
