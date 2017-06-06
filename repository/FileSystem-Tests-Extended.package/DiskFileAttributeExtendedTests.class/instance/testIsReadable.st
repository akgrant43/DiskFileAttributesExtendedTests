tests - single attribute
testIsReadable

	self assert: self fileAttributes isReadable equals: true.
	self assert: self targetFileAttributes isReadable equals: true.
	self assert: self symlinkAttributes isReadable equals: true.
	self assert: self symlinkLinkAttributes isReadable equals: true.
