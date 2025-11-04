//%attributes = {"invisible":true,"preemptive":"capable"}
#DECLARE($worker : 4D:C1709.SystemWorker; $params : Object)

TRACE:C157

var $text : Text
$text:=$worker.response

var $file : 4D:C1709.File
$file:=$params.context

$file.setText($text)