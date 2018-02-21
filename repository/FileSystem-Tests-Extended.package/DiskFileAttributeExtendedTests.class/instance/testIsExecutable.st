tests - single attribute
testIsExecutable

	| file |

	file := FileLocator vmBinary resolve.
	self assert: (DiskDirectoryEntry reference: file) isExecutable.

	self assert: self fileAttributes isExecutable equals: false.
	self assert: self targetFileAttributes isExecutable equals: false.
	self assert: self symlinkAttributes isExecutable equals: false.
	self assert: self symlinkLinkAttributes isExecutable equals: false.
