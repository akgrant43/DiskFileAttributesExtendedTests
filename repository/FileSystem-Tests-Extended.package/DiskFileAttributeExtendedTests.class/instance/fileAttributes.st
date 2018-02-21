helper methods
fileAttributes

	| file |
	
	file := self tempFileResource file resolve.
	^DiskDirectoryEntry reference: file.