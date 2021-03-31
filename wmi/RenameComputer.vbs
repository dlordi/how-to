Set objWMIService = GetObject("winmgmts:{impersonationLevel=impersonate}!\\.\root\cimv2")
Set colComputers = objWMIService.ExecQuery("Select * from Win32_ComputerSystem")
For Each objComputer in colComputers
  errReturn = ObjComputer.Rename("NewName")
  WScript.Echo "Computer name is now " & objComputer.Name
Next
