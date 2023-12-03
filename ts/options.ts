export const slOptions = {
	insertArityCheck: true, // decide if an arity check is inserted block definitions
	requireTypeExists: true, // decide if type must exist to be extended
	simpleArityModel: false, // decide to compile the simple or the complicated arity model
	multipleNamesForLocalBlocks: false, // in complicated model decide to bind f as well as f:/n,
	uncheckedIndexing: false, // decide if at and atPut syntax compiles to checked access
};
