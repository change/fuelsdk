FuelSDK-Ruby
============

2017-02-01: Version 0.1.14
```
  Add better error handling for activity polling
```

2017-02-01: Version 0.1.13
```
  Add support for clearing data extensions
```

2017-01-24: Version 0.1.12
```
  Add support for import definitions and automation objects
```

2016-10-03: Version 0.1.11
```
  Add support for QueryDefinition and EmailSendDefinition
```

2015-05-02: Version 0.1.10
```
  Add activesupport to gemspec
```

2014-06-23: Version 0.1.9
```
  Fix ContinueRequest
```

2014-06-18: Version 0.1.8
```
  Merge pull request fixing typo
```

2014-03-13: Version 0.1.7
```
  Update setting attributes for Savon 2.3 support
```

2013-10-18: Version 0.1.6
```
  allow endpoint to be set
```

2013-10-17: Version 0.1.5
```
  moved dataextension property munging into client so not required to instantiate those objects.

  convert properties to array at last minute. fixes #14
```

2013-09-18: Version 0.1.3
```
  augment soap_cud to handle dataextensions better

  array.wrap so we can be less terse
```

2013-09-18: Version 0.1.2
```
  get dataextension properties sugar method

  clear soap client on refresh so the client gets re-established with header with new token

  refresh tests
```

2013-09-11: Version 0.1.1
```
 Added ChangeLog

 soap_configure, soap_perform with supporting tests

 make soap_cud more rubular and easier to read and support

 fixed some issues when trying to make requests after being passed a jwt
```
