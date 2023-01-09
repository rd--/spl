import { PriorityQueue } from '../lib/flatqueue/PriorityQueue.js'
export { PriorityQueue } from '../lib/flatqueue/PriorityQueue.js'

import { throwError } from '../lib/jssc3/ts/kernel/error.ts'

import { isOperatorName, operatorMethodName } from './operator.ts'
import { slOptions } from './options.ts'

type TypeName = string;
type Arity = number;
type MethodName = string;
type MethodSourceCode = string;
type TraitName = string;

type SlObject = object & {type: TypeName};

function isStringDictionary(anObject: SlObject): boolean {
	const c = anObject.constructor;
	return c === undefined || c.name === 'Object';
}

function objectType(anObject: SlObject): TypeName {
	return anObject instanceof Array ? 'Array' :
		(anObject instanceof Error ? 'Error' :
		 (anObject instanceof Map ? 'IdentityDictionary' :
		  (anObject instanceof Set ? 'IdentitySet' :
		   (anObject instanceof Uint8Array ? 'ByteArray' :
		    (anObject instanceof Float64Array ? 'Float64Array' :
		     (anObject instanceof Promise ? 'Promise' :
		      (anObject instanceof PriorityQueue ? 'PriorityQueue' :
		       (anObject.type ||
		        (isStringDictionary(anObject) ? 'StringDictionary' : anObject.constructor.name)))))))));
}

export function typeOf(anObject: unknown): TypeName {
	if(anObject === null || anObject === undefined) {
		return 'UndefinedObject';
	} else {
		switch (typeof anObject) {
		case 'boolean': return 'Boolean';
		case 'function': return 'Procedure';
		case 'number': return 'Number';
		case 'bigint': return 'LargeInteger';
		case 'string': return 'String';
		case 'object': return objectType(<SlObject>anObject);
		default: throwError(`typeOf: unknown type: ${anObject}`); return 'Unknown';
		}
	}
}

export function isArray<T>(anObject: unknown): anObject is Array<T> { return Array.isArray(anObject); }
export function isByteArray(anObject: unknown): anObject is Uint8Array { return anObject instanceof Uint8Array; }
export function isFunction(anObject: unknown): anObject is Function { return anObject instanceof Function; }
export function isNumber(anObject: unknown): anObject is number { return typeof anObject === 'number'; }
export function isIdentitySet<T>(anObject: unknown): anObject is Set<T> { return anObject instanceof Set; }
export function isString(anObject: unknown): anObject is string { return typeof anObject === 'string'; }

export function isByte(anObject: unknown): boolean {
	return isNumber(anObject) && Number.isInteger(anObject) && anObject >= 0 && anObject < 256;
}

// Void and Object are not ordinary types.
// Void names the place in the method table for no-argument procedures.
// Object is an implicit trait that all types inherit from.
export const typeList : string[] = ['Array', 'ByteArray', 'Number', 'Procedure', 'String', 'Void'];

export const traitTypeTable: Map<TraitName, TypeName[]> = new Map();

type MethodOrigin = string;
type MethodEntry = [Function, Arity, MethodSourceCode, MethodOrigin];

function makeMethodEntry(procedure: Function, arity: Arity, sourceCode: MethodSourceCode, origin: string): MethodEntry {
	return [procedure, arity, sourceCode, origin];
}

export const traitMethodTable: Map<TraitName, Map<MethodName, MethodEntry[]>> = new Map();

export function addTrait(traitName: TraitName): void {
	// console.debug(`addTrait: ${traitName}`);
	if(!traitTypeTable.has(traitName)) {
		traitTypeTable.set(traitName, []);
		traitMethodTable.set(traitName, new Map());
	}
}

export function addTypeTraits(typeName: TypeName, traitNameArray: TraitName[]): void {
	traitNameArray.forEach(function(traitName: TraitName) {
		// console.debug(`addTypeTraits: ${typeName}, ${traitName}`);
		traitTypeTable.get(traitName)!.push(typeName);
	});
}

// c.f. rewrite/makeMethodList
export function addTraitMethod(traitName: TraitName, methodName: MethodName, arity: Arity, method: Function, source: string): void {
	// console.debug(`addTypeTrait: ${traitName}, ${methodName}, ${arity}`);
	const trait = traitMethodTable.get(traitName)!;
	if(!trait.has(methodName)) {
		trait.set(methodName, []);
	}
	trait.get(methodName)!.push(makeMethodEntry(method, arity, source, traitName));
}

export function copyTraitToType(traitName: TraitName, typeName: TypeName): void {
	// console.debug(`copyTraitToType: ${traitName}, ${typeName}`);
	const methods = traitMethodTable.get(traitName)!;
	for (const [name, table] of methods) {
		table.forEach(function(item) {
			const [procedure, arity, source] = item;
			// console.debug(`copyTraitToType: ${traitName}, ${typeName}, ${name}, ${arity}`);
			addMethodFor(typeName, name, arity, procedure, source, traitName);
		});
	}
}

// c.f. rewrite/makeMethodList
export function extendTraitWithMethod(traitName: TraitName, name: MethodName, arity: Arity, method: Function, source: string): void {
	const types = traitName === 'Object' ? typeList : traitTypeTable.get(traitName)!;
	// console.debug(`extendTraitWithMethod: ${traitName}, ${name}`);
	addTraitMethod(traitName, name, arity, method, source);
	types.forEach(function(typeName) {
		// console.debug(`extendTraitWithMethod: ${traitName}, ${typeName}, ${name}`);
		addMethodFor(typeName, name, arity, method, source, traitName);
	});
}

type ByTypeProcedureTable = Map<TypeName, MethodEntry>;
type ByArityProcedureTable = Map<Arity, ByTypeProcedureTable>;
type ByNameProcedureTable = Map<MethodName, ByArityProcedureTable>

export const methodTable: ByNameProcedureTable = new Map();

export function lookupGeneric(methodName: MethodName, methodArity: Arity, receiverType: TypeName): MethodEntry {
	return methodTable.get(methodName)!.get(methodArity)!.get(receiverType)!;
}

export function nameWithoutArity(methodName: MethodName) {
	return methodName.split(':')[0];
}

export function applyGenericAt(methodName: MethodName, parameterArray: unknown[], receiverType: TypeName) {
	// console.log(`applyGenericAt: ${methodName}, ${parameterArray.length}, ${receiverType}`);
	const method = lookupGeneric(methodName, parameterArray.length, receiverType);
	return method[0].apply(null, parameterArray)
}

export function dispatchByType(name: string, arity: number, typeTable: ByTypeProcedureTable, parameterArray: unknown[]) {
	if(arity === 0) {
		const method = typeTable.get('Void');
		if(method) {
			return method[0].apply(null, [])
		} else {
			return throwError(`dispatchByType: no zero arity method: ${name}`);
		}
	} else {
		const receiver = parameterArray[0];
		const receiverType = typeOf(receiver);
		const typeMethod = typeTable.get(receiverType);
		if(typeMethod) {
			// console.debug(`dispatchByType: name=${name}, arity=${arity}, type=${receiverType}`);
			return typeMethod[0].apply(null, parameterArray)
		} else {
			return throwError(`dispatchByType: no method for type: ${receiverType}; arity=${arity} name=${name}`);
		}
	}
}

export function dispatchByArity(name: string, arity: number, arityTable: ByArityProcedureTable, parameterArray: unknown[]) {
	const typeTable = arityTable.get(arity);
	if(typeTable) {
		return dispatchByType(name, arity, typeTable, parameterArray);
	} else {
		return throwError(`dispatchbyArity: no entry for arity: name=${name}, arity=${arity}`);
	}
}

declare var globalThis: { [key: string]: unknown };

export function addMethodFor(typeName: TypeName, name: MethodName, arity: Arity, method: Function, source: string, origin: string): void {
	if(slOptions.requireTypeExists && !typeList.includes(typeName)) {
		console.error(`addMethodFor: type does not exist: ${typeName}`);
		return;
	}
	// console.debug(`addMethodFor: ${typeName}, ${name}, ${arity}`);
	if(!methodTable.has(name)) {
		methodTable.set(name, new Map());
		if(slOptions.simpleArityModel) {
			const prefixedName = '_' + name;
			let globalFunction = globalThis[prefixedName];
			if(globalFunction === undefined) {
				globalFunction = globalThis[prefixedName] = function(...argumentsArray: unknown[]) {
					// console.debug(`dispatchByArity: ${name}, ${JSON.stringify(argumentsArray)}`);
					return dispatchByArity(name, argumentsArray.length, arityTable, argumentsArray);
				};
				Object.defineProperty(globalFunction, "name", { value: name });
				Object.defineProperty(globalFunction, "hasRestParameters", { value: true });
			}
		}
	}
	let arityTable = methodTable.get(name)!;
	if(!arityTable.has(arity)) {
		arityTable.set(arity, new Map());
		if(!slOptions.simpleArityModel) {
			const prefixedNameWithArity = `_${name}_${arity}`;
			let globalFunctionWithArity = globalThis[prefixedNameWithArity];
			if(globalFunctionWithArity === undefined) {
				const typeTable = arityTable.get(arity)!;
				globalFunctionWithArity = globalThis[prefixedNameWithArity] = function(...argumentsArray: unknown[]) {
					// console.debug(`dispatchByType: ${name}, ${JSON.stringify(argumentsArray)}`);
					return dispatchByType(name, arity, typeTable, argumentsArray);
				};
				Object.defineProperty(globalFunctionWithArity, "name", { value: `${name}:/${arity}` });
				Object.defineProperty(globalFunctionWithArity, "length", { value: arity }); // c.f. makeCheckedAritySpecificFunction
			}
		}
	}
	const existingEntry = arityTable.get(arity)!.get(typeName);
	// Todo: this is not a correct test, it needs to not over-write less specific traits as well... it works for stdlib
	if(existingEntry && existingEntry[3] === typeName && origin !== typeName) {
		// console.debug('addMethodFor: existing more specific entry');
	} else {
		arityTable.get(arity)!.set(typeName, makeMethodEntry(method, arity, source, origin));
	}
}

// c.f. rewrite/makeMethodList
export function addMethod(typeName: TypeName, name: MethodName, arity: Arity, method: Function, source: string): void {
	return addMethodFor(typeName, name, arity, method, source, typeName);
}

// This is run for built-in types. The class predicate method is required.  Assumes non-kernel types have at least one slot.
export function addType(typeName: TypeName, slotNames: string[]): void {
	const slots = slotNames.map(each => `${each}: ${each}`).join(', ');
	const defType = slotNames.length === 0 ? '' : `extendTraitWithMethod('Object', 'new${typeName}', ${slotNames.length}, function(${slotNames.join(', ')}) { return {type: '${typeName}', ${slots} }; }, '<primitive>')`;
	const defPredicateFalse = `extendTraitWithMethod('Object', 'is${typeName}', 1, function(anObject) { return false; }, '<primitive>')`;
	const defPredicateTrue = `addMethod('${typeName}', 'is${typeName}', 1, function(anInstance) { return true; }, '<primitive>')`;
	const defSlotAccess = slotNames.map(each => `addMethod('${typeName}', '${each}', 1, function(anInstance) { return anInstance.${each} }, '<primitive>');`).join('; ');
	const defSlotMutate = slotNames.map(each => `addMethod('${typeName}', '${each}', 2, function(anInstance, anObject) { anInstance.${each} = anObject; return anObject; }, '<primitive>');`).join('; ');
	// console.debug(`addType: ${typeName}, ${slotNames}`);
	typeList.push(typeName);
	eval(defType);
	eval(defPredicateFalse);
	eval(defPredicateTrue);
	eval(defSlotAccess);
	eval(defSlotMutate);
}

// Until the <primitive:> parser allows escaped >...
export function shiftRight(lhs: number, rhs: number): number {
	return lhs >> rhs;
}

export function methodName(name: string): MethodName {
	return isOperatorName(name) ? operatorMethodName(name) : name;
}

export function arrayCheckIndex(anArray: unknown[], anInteger: number): boolean {
	return Number.isInteger(anInteger) && anInteger >= 0 && anInteger < anArray.length;
}

declare global {
	var _pi: number;
	var _inf: number;
	var _implicitDictionary: Map<string,unknown>;
	var _system: Map<string,any>;
	var _workspace: Map<string,unknown>;
}

export function assignGlobals() {
	globalThis._pi = Math.PI;
	globalThis._inf = Infinity;
	globalThis._implicitDictionary = new Map();
	globalThis._system = new Map([
		['methodTable', methodTable],
		['traitTypeTable', traitTypeTable],
		['traitMethodTable', traitMethodTable],
		['typeList', typeList],
		['nextUniqueId', 1],
	]);
	globalThis._workspace = new Map();
}
