helper methods
targetFileLinkAttributes

	| file |
	
	file := self tempFileResource targetFile resolve.
	^DiskSymlinkDirectoryEntry reference: file.