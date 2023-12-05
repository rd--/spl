# Preferences

```
'https://rohandrape.net/sw/spl/config/preferences.json'.asUrl.fetch.then { :response |
	response.json.then { :anObject |
		system.cache::preferences := anObject
	}
}
```
