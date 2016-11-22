on todayFormat()
	set theDate to (current date)
	set y to text -4 thru -1 of ("0000" & (year of theDate))
	set m to text -2 thru -1 of ("00" & ((month of theDate) as integer))
	set d to text -2 thru -1 of ("00" & (day of theDate))
	return (d & "/" & m & "/" & y) as text
end todayFormat

on lastCommitLog()
	set theDate to (current date)
	set y to text -4 thru -1 of ("0000" & (year of theDate))
	set m to text -2 thru -1 of ("00" & ((month of theDate) as integer))
	set d to text -2 thru -1 of ("00" & (day of theDate))
	set h to text -2 thru -1 of ("00" & ((hours of theDate) - 1)) #this doesn't handle commits at the start/end of day.
	set filename to (y & "-" & m & "-" & d & "-" & h) as text
	return "/Users/gavin/.git/logger/logs/commits-" & filename & ".html"
end lastCommitLog

on readFile(unixPath)
try 
	exists file (POSIX file unixPath) 
	return (do shell script "cat '" & unixPath & "'")
	end
	return ""
end readFile

-- Prepare a name for the new note
set theNoteName to "Commit Log - " & my todayFormat()

tell application "Evernote"
	set commitContent to (my readFile(my lastCommitLog()))
	if commitContent is not equal to "" then
		try
			set matches to find notes "notebook:Inbox " & theNoteName
			if matches is equal to {} then
				set commitLog to create note title theNoteName tags "journal" with html ""
			else
				set commitLog to first item in matches
			end if
			commitLog append html (commitContent)
			rescue
		end try
	end if
end tell
