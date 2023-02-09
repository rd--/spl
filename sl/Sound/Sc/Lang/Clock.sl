Clock : [Object] { | priorityQueue nextEntryTime existingDelay |

	schedule { :self :deltaTime :aProcedure |
		(*
			Schedule aProcedure for deltaTime.
			When aProcedure is evaluated the answer is either an interval at which to re-schedule, or nil to halt.
		*)
		|
			currentTime = system.systemTimeInMilliseconds,
			scheduledTime = deltaTime * 1000 + currentTime,
			wakeupTime = self.nextEntryTime;
		|
		self.priorityQueue.push(aProcedure, scheduledTime);
		(wakeupTime = nil | { scheduledTime < wakeupTime }).ifTrue {
			self.nextEntryTime := scheduledTime;
			self.existingDelay.ifNotNil { self.existingDelay.cancel };
			self.existingDelay := { self.wakeup(scheduledTime) }.evaluateAfterMilliseconds(deltaTime * 1000)
		};
	}

	scheduleInjecting { :self :deltaTime :anObject :aProcedure:/1 |
		(*
			Schedule applying aProcedure to anObject for deltaTime.
			When evaluated the answer is a [delay, nextValue] pair to continue, or nil to halt.
		*)
		self.schedule(deltaTime) {
			| reply = aProcedure(anObject); |
			reply.ifNotNil {
				self.scheduleInjecting(reply[1], reply[2], aProcedure:/1)
			};
			nil
		}
	}

	wakeup { :self :scheduledTime |
		|
			currentTime = system.systemTimeInMilliseconds,
			queue = self.priorityQueue,
			front = self.nextEntryTime;
		|
		{ front ~= nil & { front <= currentTime } }.whileTrue {
			| activity = queue.pop, rescheduleAfter = activity.value; |
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
		workspace::clock.schedule(self, aProcedure)
	}

	scheduleInjecting { :self :anObject :aProcedure |
		workspace::clock.scheduleInjecting(self, anObject, aProcedure)
	}

}

+ Procedure {

	schedule { :self |
		workspace::clock.schedule(0, self)
	}

	scheduleInjecting { :self :anObject |
		workspace::clock.scheduleInjecting(0, anObject, self)
	}

}

+ Void {

	Clock {
		newClock().initialize(PriorityQueue(), nil, nil)
	}

}
