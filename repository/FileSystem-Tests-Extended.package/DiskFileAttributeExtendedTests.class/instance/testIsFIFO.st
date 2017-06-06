tests - single attribute
testIsFIFO

	self assert: self fileAttributes isFIFO equals: false.
	self assert: self targetFileAttributes isFIFO equals: false.
	self assert: self symlinkAttributes isFIFO equals: false.
	self assert: self symlinkLinkAttributes isFIFO equals: false.
