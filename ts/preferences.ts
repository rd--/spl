export type Preferences = Record<string, any>;

export function preferencesRead<T>(
	preferences: Preferences,
	key: string,
): Preferences {
	// console.debug('preferencesRead', preferences, key);
	const configuration: string = preferences['Configuration'];
	const configurationEntry: T | null = preferences[configuration][key];
	if (configurationEntry) {
		return configurationEntry;
	} else {
		const defaultEntry: T | null = preferences['Default'][key];
		if (defaultEntry) {
			return defaultEntry;
		} else {
			throw new Error(`preferencesRead: unknown key: ${key}`);
		}
	}
}
