tests - single attribute
testIsDirectory

	| file |

	self assert: self fileAttributes isDirectory equals: false.
	self assert: self targetFileAttributes isDirectory equals: false.
	self assert: self symlinkAttributes isDirectory equals: false.
	self assert: self symlinkLinkAttributes isDirectory equals: false.

	file := FileLocator temp resolve.
	self assert: (DiskFileAttributes store: file fileSystem store path: file path) isDirectory.