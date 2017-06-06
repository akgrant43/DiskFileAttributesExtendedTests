tests - single attribute
testIsBlock

	self assert: self fileAttributes isBlock equals: false.
	self assert: self targetFileAttributes isBlock equals: false.
	self assert: self symlinkAttributes isBlock equals: false.
	self assert: self symlinkLinkAttributes isBlock equals: false.
