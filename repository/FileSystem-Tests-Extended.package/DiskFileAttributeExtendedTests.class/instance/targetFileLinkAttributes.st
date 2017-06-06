helper methods
targetFileLinkAttributes

	| file |
	
	file := self tempFileResource targetFile resolve.
	^DiskSymlinkAttributes store: file fileSystem store path: file path.