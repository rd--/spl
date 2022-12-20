Promise {

	catch { :self :aProcedure |
		<primitive: return _self.catch(_aProcedure);>
	}

	finally { :self :aProcedure |
		<primitive: return _self.finally(_aProcedure);>
	}

	then { :self :aProcedure |
		<primitive: return _self.then(_aProcedure);>
	}

	thenElse { :self :onResolve :onReject |
		<primitive: return _self.then(_onResolve, _onReject);>
	}

}

+ Procedure {

	Promise { :self |
		<primitive: return new Promise(_self);>
	}

}

+ Void {

	Promise { 'Promise()'.error }

}
