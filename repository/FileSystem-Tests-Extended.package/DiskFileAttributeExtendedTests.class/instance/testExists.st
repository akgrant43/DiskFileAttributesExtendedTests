tests - single attribute
testExists

	| file |
	file := self tempFileResource file resolve.
	self assert: (DiskDirectoryEntry exists: file path in: file fileSystem)