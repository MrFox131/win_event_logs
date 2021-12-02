xquery version "3.1";

let $collection := '/db/app/logsys/events'
let $filename := request:get-uploaded-file-name('file')


return
<results>
    <message>AllGonnaBeOK return $filename</message>
</results>
