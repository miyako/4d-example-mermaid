//%attributes = {"invisible":true}
#DECLARE($params : Object)

If (Count parameters:C259=0)
	
	//execute in a worker to process callbacks
	CALL WORKER:C1389(1; Current method name:C684; {})
	
Else 
	
	var $mermaid : cs:C1710.mermaid.mermaid
	$mermaid:=cs:C1710.mermaid.mermaid.new()
	
	var $tasks : Collection
	$tasks:=[]
	
	var $file : Variant
	
	$file:="graph TD\n    A[Start] --> B{Is it working?}\n    B -- Yes --> C[Great!]\n    B -- No --> D[Check the code]\n    D --> B\n    C --> E[End]"
	$tasks.push({file: $file})
	
	$file:="graph TD\n    A[Start] --> B{Is it working?}\n    B -- Yes --> C[Great!]\n    B -- No --> D[Check the code]\n    D --> B\n    C --> E[End]"
	$tasks.push({file: $file})
	
/*
if not formula is passed in $2
the call is atomic
results are a collection of svg text
*/
	
	$results:=$mermaid.render($tasks)
	
	Folder:C1567(fk desktop folder:K87:19).file("0.svg").setText($results[0])
	Folder:C1567(fk desktop folder:K87:19).file("1.svg").setText($results[1])
	
End if 