xquery version "3.1";
let $collection_uri := '/db/apps/logsys'
let $filename := request:get-uploaded-file-name('file')
let $xml := document{fn:parse-xml(util:binary-to-string(request:get-uploaded-file-data('file')))}
let $login := xmldb:login($collection_uri, 'admin', '')
let $created_collection := xmldb:create-collection('/db/apps/logsys/', 'events')
let $avail := xmldb:collection-available('/db/apps/logsys/events')
let $headers :=  response:set-header("Access-Control-Allow-Origin", "*")
let $headers2 := response:set-header("Access-Control-Allow-Headers", "origin, x-requested-with, content-type")

return
    <result>
        {{"result":"success"}}
        {
            for $event in ($xml/Events/*)
                let $result := xmldb:store('/db/apps/logsys/events', $event/System/EventID, $event)
                return ''
        }
    </result>
