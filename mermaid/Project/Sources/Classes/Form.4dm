property method : Text
property Markdown : Text
property Diagram : Picture
property body : Object
property Message : Text

Class constructor
	
	This:C1470.method:="POST"
	This:C1470.Markdown:="flowchart TD\n    A[Start] --> B{Is it working?}\n    B -- Yes --> C[Great!]\n    B -- No --> D[Check logs]\n    D --> E{Found error?}\n    E -- Yes --> F[Fix the issue]\n    E -- No --> G[Ask for help]\n    F --> B\n    G --> B"
	This:C1470.Message:=""
	
Function render()
	
	This:C1470.Message:="Processing..."
	
	var $body : Object
	$body:={format: "png"; scale: 2}
	$body.text:=OBJECT Get name:C1087(Object with focus:K67:3)="Markdown" ? Get edited text:C655 : Form:C1466.Markdown
	
	This:C1470.body:=$body
	
	var $request : 4D:C1709.HTTPRequest
	$request:=4D:C1709.HTTPRequest.new("http://127.0.0.1:8282/render"; This:C1470)
	
Function onResponse($request : 4D:C1709.HTTPRequest; $event : Object)
	
	If (Form:C1466#Null:C1517)
		If ($request.response.status=200)
			var $png : Picture
			BLOB TO PICTURE:C682($request.response.body; $png; ".png")
			Form:C1466.Diagram:=$png
			This:C1470.Message:="Success!"
		Else 
			This:C1470.Message:="Error! "+$request.response.body.message
		End if 
	End if 
	
Function onError($request : 4D:C1709.HTTPRequest; $event : Object)
	
	This:C1470.Message:="Network Error!"