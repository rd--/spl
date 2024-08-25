export function exit(code: number): never {
	return Deno.exit(code);
}

export function getArch(): string {
	return Deno.build.arch;
}

export function getCwd(): string {
	return Deno.cwd();
}

export function getEnv(variableName: string): string | null {
	return Deno.env.get(variableName) || null;
}

export function getEnviron(): Record<string, string> {
	return Deno.env.toObject();
}

export function getHostname(): string {
	return Deno.hostname();
}

export function getOs(): string {
	return Deno.build.os;
}

export function readBinaryFile(path: string | URL): Promise<Uint8Array> {
	return Deno.readFile(path);
}

export function readTextFile(path: string | URL): Promise<string> {
	return Deno.readTextFile(path);
}

export async function statMtime(path: string | URL): Promise<number> {
	return await Deno.stat(path).then(function (result) {
		return result.mtime ? result.mtime.getTime() : 0;
	}, function (_reason) {
		return 0;
	});
}

export function systemCommand(
	commandName: string,
	argumentArray: string[],
) {
	// console.debug('systemCommand', commandName, argumentArray);
	const command = new Deno.Command(commandName, { args: argumentArray });
	return command.output().then(function (result) {
		return {
			exitCode: result.code,
			outputText: new TextDecoder().decode(result.stdout),
			errorText: new TextDecoder().decode(result.stderr),
		};
	});
}

export function writeBinaryFile(
	path: string | URL,
	data: Uint8Array,
): Promise<void> {
	return Deno.writeFile(path, data);
}

export function writeTextFile(
	path: string | URL,
	data: string,
): Promise<void> {
	return Deno.writeTextFile(path, data);
}

export async function readDirectoryFileNames(
	path: string | URL,
): Promise<string[]> {
	const fileNameArray: string[] = [];
	for await (const dirEntry of Deno.readDir(path)) {
		// console.debug('readDirectoryFileNames', dirEntry.name);
		if (dirEntry.isFile) {
			fileNameArray.push(path + '/' + dirEntry.name);
		}
	}
	return fileNameArray;
}

export function readTextFileArray(pathArray: string[]): Promise<string[]> {
	return Promise.all(
		pathArray.map(function (path: string): Promise<string> {
			return Deno.readTextFile(path);
		}),
	);
}

/*
function getEnvOr(variableName: string, defaultValue: string) {
	return getEnv(variableName) || defaultValue;
}
*/
