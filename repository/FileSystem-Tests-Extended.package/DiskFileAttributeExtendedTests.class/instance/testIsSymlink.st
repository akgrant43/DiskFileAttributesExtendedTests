tests
testIsSymlink

	self assert: self fileAttributes isSymlink equals: false.
	self assert: self targetFileAttributes isSymlink equals: false.
	self assert: self symlinkAttributes isSymlink equals: true.
	self assert: self symlinkLinkAttributes isSymlink equals: true.
