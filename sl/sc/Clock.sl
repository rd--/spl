Clock { | priorityQueue nextEntryTime existingDelay |

	schedule { :self :deltaTime :aProcedure |
		(* Schedule aProcedure for deltaTime.  When evaluated the answer is either an interval at which to re-schedule, or nil to halt. *)
		| currentTime = systemTimeInMilliseconds(), scheduledTime = deltaTime * 1000 + currentTime, wakeupTime = self.nextEntryTime; |
		self.priorityQueue.push(aProcedure, scheduledTime);
		(wakeupTime = nil | { scheduledTime < wakeupTime }).ifTrue {
			self.nextEntryTime := scheduledTime;
			self.existingDelay.ifNotNil { self.existingDelay.cancel };
			self.existingDelay := { self.wakeup(scheduledTime) }.evaluateAfterMilliseconds(deltaTime * 1000)
		};
	}

	scheduleInjecting { :self :deltaTime :anObject :aProcedure |
		(* Schedule aProcedure(anObject) for deltaTime.  When evaluated the answer is a [delay, nextValue] pair to continue, or nil to halt. *)
		self.schedule(deltaTime) {
			| reply = aProcedure(anObject); |
			reply.ifNotNil {
				self.scheduleInjecting(reply[1], reply[2], aProcedure)
			};
			nil
		}
	}

	wakeup { :self :scheduledTime |
		| currentTime = systemTimeInMilliseconds(), queue = self.priorityQueue, front = self.nextEntryTime; |
		{ front ~= nil & { front <= currentTime } }.while {
			| activity = queue.pop, rescheduleAfter = activity(); |
			rescheduleAfter.isNumber.ifTrue { self.priorityQueue.push(activity, rescheduleAfter * 1000 + scheduledTime) };
			front := queue.peekPriority
		};
		self.nextEntryTime := front;
		front.ifNotNil {
			self.existingDelay.ifNotNil { self.existingDelay.cancel };
			self.existingDelay := { self.wakeup(front) }.evaluateAfterMilliseconds(front - currentTime)
		}
	}

	clear { :self |
		self.priorityQueue.clearAndShrink;
		self.existingDelay.ifNotNil { self.existingDelay.cancel };
		self.nextEntryTime := nil;
		self.existingDelay := nil;
	}

}

+ Number {

	schedule { :self :aProcedure |
		system::clock.schedule(self, aProcedure)
	}

	scheduleInjecting { :self :anObject :aProcedure |
		system::clock.scheduleInjecting(self, anObject, aProcedure)
	}

}

+ Procedure {

	schedule { :self |
		system::clock.schedule(0, self)
	}

	scheduleInjecting { :self :anObject |
		system::clock.scheduleInjecting(0, anObject, self)
	}

}

+ Void {

	Clock { Clock(PriorityQueue(), nil, nil) }

}
