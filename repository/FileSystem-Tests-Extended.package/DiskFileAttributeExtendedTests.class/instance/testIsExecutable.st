tests
testIsExecutable

	| file filesystem path |

	file := FileLocator vmBinary resolve.
	filesystem := file fileSystem.
	path := file path.
	self assert: (DiskFileAttributes store: filesystem store path: path) isExecutable.

	self assert: self fileAttributes isExecutable equals: false.
	self assert: self targetFileAttributes isExecutable equals: false.
	self assert: self symlinkAttributes isExecutable equals: false.
	self assert: self symlinkLinkAttributes isExecutable equals: false.
