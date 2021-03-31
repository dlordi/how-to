strComputer = "."

Set wbemServices = GetObject("winmgmts:\\" & strComputer)
Set wbemObjectSet = wbemServices.InstancesOf("Win32_NTLogEvent")

For Each wbemObject In wbemObjectSet
	WScript.Echo "Log File: " & wbemObject.LogFile & vbCrLf & _
		"Record Number: " & wbemObject.RecordNumber & vbCrLf & _
		"Type: " & wbemObject.Type & vbCrLf & _
		"Time Generated: " & wbemObject.TimeGenerated & vbCrLf & _
		"Source: " & wbemObject.SourceName & vbCrLf & _
		"Category: " & wbemObject.Category & vbCrLf & _
		"Category String: " & wbemObject.CategoryString & vbCrLf & _
		"Event: " & wbemObject.EventCode & vbCrLf & _
		"User: " & wbemObject.User & vbCrLf & _
		"Computer: " & wbemObject.ComputerName & vbCrLf & _
		"Message: " & wbemObject.Message
Next
