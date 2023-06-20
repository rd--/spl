# System -- system

Type representing the system (interpreter and host).

The global value _system_ is the singular instance.

Type, trait and method dictionaries, timers, random number and unique identifier generators are implemented at _System_.

	system.typeOf = 'System'
	system.typeDictionary.keys.includes('System') = true
	system.randomFloat < 1
	system.uniqueId ~= system.uniqueId
