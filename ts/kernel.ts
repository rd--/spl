import { PriorityQueue } from '../lib/flatqueue/PriorityQueue.js'
export { PriorityQueue } from '../lib/flatqueue/PriorityQueue.js'

import { consoleDebug, throwError } from '../lib/jssc3/ts/kernel/error.ts'
import { stringCapitalizeFirstLetter } from '../lib/jssc3/ts/kernel/string.ts'

import { isOperatorName, operatorNameTable } from './operator.ts'

type TypeName = string;
type Arity = number;
type MethodName = string;
type TraitName = string;

type SlObject = object & {type: TypeName};

function objectType(anObject: SlObject): TypeName {
	return anObject instanceof Array ? 'Array' :
		(anObject instanceof Error ? 'Error' :
		 (anObject instanceof Map ? 'IdentityDictionary' :
		  (anObject instanceof Set ? 'IdentitySet' :
		   (anObject instanceof Uint8Array ? 'ByteArray' :
		    (anObject instanceof Float64Array ? 'Float64Array' :
		     (anObject instanceof Promise ? 'Promise' :
		      (anObject instanceof PriorityQueue ? 'PriorityQueue' :
		       (anObject.type || anObject.constructor.name))))))));
}

export function typeOf(anObject: unknown): TypeName {
	if(anObject === null || anObject === undefined) {
		return 'Nil';
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

export const typeList : string[] = [];

export const traitTypes: Map<TraitName, TypeName[]> = new Map();

type MethodTuple = [Function, Arity, string];

function makeMethodTuple(procedure: Function, arity: Arity, source: string): MethodTuple {
	return [procedure, arity, source];
}

export const traitMethods: Map<TraitName, Map<MethodName, MethodTuple[]>> = new Map();

export function addTrait(traitName: TraitName): void {
	consoleDebug(`addTrait: ${traitName}`);
	if(!traitTypes.has(traitName)) {
		traitTypes.set(traitName, []);
		traitMethods.set(traitName, new Map());
	}
}

export function addTypeTraits(typeName: TypeName, traitNameArray: TraitName[]): void {
	traitNameArray.forEach(function(traitName: TraitName) {
		consoleDebug(`addTypeTraits: ${typeName}, ${traitName}`);
		traitTypes.get(traitName)!.push(typeName);
	});
}

export function addTraitMethod(traitName: TraitName, name: MethodName, arity: Arity, method: Function, source: string): void {
	consoleDebug(`addTypeTrait: ${traitName}, ${name}, ${arity}`);
	const trait = traitMethods.get(traitName)!;
	if(!trait.has(name)) {
		trait.set(name, []);
	}
	trait.get(name)!.push(makeMethodTuple(method, arity, source));
}

export function copyTraitToType(traitName: TraitName, typeName: TypeName): void {
	consoleDebug(`copyTraitToType: ${traitName}, ${typeName}`);
	const methods = traitMethods.get(traitName)!;
	for (const [name, table] of methods) {
		table.forEach(function(item) {
			const [procedure, arity, source] = item;
			consoleDebug(`copyTraitToType: ${traitName}, ${typeName}, ${name}, ${arity}`);
			addMethod(typeName, name, arity, procedure, source);
		});
	}
}

export function extendTraitWithMethod(traitName: TraitName, name: MethodName, arity: Arity, method: Function, source: string): void {
	const types = traitTypes.get(traitName)!;
	consoleDebug(`extendTraitWithMethod: ${traitName}, ${name}`);
	addTraitMethod(traitName, name, arity, method, source);
	types.forEach(function(typeName) {
		consoleDebug(`extendTraitWithMethod: ${traitName}, ${typeName}, ${name}`);
		addMethod(typeName, name, arity, method, source);
	});
}

type GenericProcedureTable = Map<Arity, Map<TypeName, MethodTuple>>;

export const genericProcedures: Map<MethodName, GenericProcedureTable> = new Map();

export function applyGenericAt(methodName: MethodName, parameterArray: unknown[], receiverType: TypeName) {
	const method = genericProcedures.get(methodName)!.get(parameterArray.length)!.get(receiverType)!;
	return method[0].apply(null, parameterArray)
}

export function dispatch(name: string, genericProcedureTable: GenericProcedureTable, parameterArray: unknown[]) {
	const arity = parameterArray.length;
	const typeTable = genericProcedureTable.get(arity);
	if(typeTable) {
		if(arity === 0) {
			const method = typeTable.get('Void');
			if(method) {
				return method[0].apply(null, [])
			} else {
				return throwError(`dispatch: no zero arity method: ${name}`);
			}
		} else {
			const receiver = parameterArray[0];
			const receiverType = typeOf(receiver);
			const typeMethod = typeTable.get(receiverType);
			if(typeMethod) {
				consoleDebug(`dispatch: name=${name}, arity=${arity}, type=${receiverType}`);
				return typeMethod[0].apply(null, parameterArray)
			} else {
				const defaultMethod = typeTable.get('Object');
				if(defaultMethod) {
					return defaultMethod[0].apply(null, parameterArray)
				} else {
					return throwError(`dispatch: no method for type: ${receiverType}; arity=${arity} name=${name}`);
				}
			}
		}
	} else {
		return throwError(`dispatch: no entry for arity: name=${name}, arity=${arity}`);
	}
}

declare var globalThis: { [key: string]: unknown };

export function addMethod(typeName: TypeName, name: MethodName, arity: Arity, method: Function, source: string): void {
	const prefixedName = '_' + name;
	let globalFunction = globalThis[prefixedName];
	if(!genericProcedures.has(name)) {
		genericProcedures.set(name, new Map());
	}
	let genericProcedure = genericProcedures.get(name)!;
	if(globalFunction === undefined) {
		globalFunction = globalThis[prefixedName] = function(...argumentsArray: unknown[]) {
			consoleDebug(`dispatch: ${name}, ${JSON.stringify(argumentsArray)}`);
			return dispatch(name, genericProcedure, argumentsArray)
		};
		Object.defineProperty(globalFunction, "name", { value: name });
	}
	if(!genericProcedure.has(arity)) {
		genericProcedure.set(arity, new Map());
	}
	consoleDebug(`addMethod: ${typeName}, ${name}, ${arity}`);
	genericProcedure.get(arity)!.set(typeName, makeMethodTuple(method, arity, source));
}

// This is run for built-in types. The class access and predicate methods are required.  Assumes non-kernel types have at least one slot.
export function addType(typeName: TypeName, slotNames: string[]): void {
	const slots = slotNames.map(each => `${each}: ${each}`).join(', ');
	const defType = slotNames.length === 0 ? '' : `addMethod('Object', '${typeName}', ${slotNames.length}, function(${slotNames.join(', ')}) { return {type: '${typeName}', ${slots} }; }, '<primitive>')`;
	const defClassAccess = `addMethod('${typeName}', 'class', 1, function(anInstance) { return _${typeName}; }, '<primitive>')`;
	const defPredicateTrue = `addMethod('${typeName}', 'is${typeName}', 1, function(anInstance) { return true; }, '<primitive>')`;
	const defPredicateFalse = `addMethod('Object', 'is${typeName}', 1, function(anObject) { return false; }, '<primitive>')`;
	const defSlotAccess = slotNames.map(each => `addMethod('${typeName}', '${each}', 1, function(anInstance) { return anInstance.${each} }, '<primitive>');`).join('; ');
	const defSlotMutate = slotNames.map(each => `addMethod('${typeName}', '${each}', 2, function(anInstance, anObject) { anInstance.${each} = anObject; return anObject; }, '<primitive>');`).join('; ');
	consoleDebug(`addType: ${typeName}, ${slotNames}`);
	typeList.push(typeName);
	eval(defType);
	eval(defClassAccess);
	eval(defPredicateTrue);
	eval(defPredicateFalse);
	eval(defSlotAccess);
	eval(defSlotMutate);
}

// Until the <primitive:> parser allows escaped >...
export function shiftRight(lhs: number, rhs: number): number {
	return lhs >> rhs;
}

export function operatorMethodName(operator: string): string {
	const words = [...operator].map((letter) => operatorNameTable[letter]);
	return words.slice(0, 1).concat(words.slice(1).map(stringCapitalizeFirstLetter)).join('');
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
		['genericProcedures', genericProcedures],
		['traitTypes', traitTypes],
		['traitMethods', traitMethods],
		['typeList', typeList]
	]);
	globalThis._workspace = new Map();
}
