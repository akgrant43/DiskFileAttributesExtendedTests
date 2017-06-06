tests - single attribute
testChangeTime

	| resource changeTime |

	resource := self tempFileResource.

	changeTime := self fileAttributes changeTime.
	self assert: (resource timestamps at: 3) <= changeTime.
	self assert: resource timestamps last >= changeTime.

	changeTime := self targetFileAttributes changeTime.
	self assert: resource timestamps first <= changeTime.
	self assert: (resource timestamps at: 2) >= changeTime.

	changeTime := self targetFileLinkAttributes changeTime.
	self assert: resource timestamps first <= changeTime.
	self assert: (resource timestamps at: 2) >= changeTime.

	changeTime := self symlinkAttributes changeTime.
	self assert: (resource timestamps at: 1) <= changeTime.
	self assert: (resource timestamps at: 2) >= changeTime.

	changeTime := self symlinkLinkAttributes changeTime.
	self assert: (resource timestamps at: 3) <= changeTime.
	self assert: (resource timestamps at: 4) >= changeTime.

	"Requesting the change time from the symbolic link attributes should be the same as the change time of the target file"
	self assert: self symlinkAttributes changeTime
			equals: self targetFileAttributes changeTime.