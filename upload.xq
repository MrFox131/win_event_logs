xquery version "3.1";
let $collection_uri := '/db/apps/logsys/events'
let $filename := request:get-uploaded-file-name('file')
let $xml := document{fn:parse-xml(util:binary-to-string(request:get-uploaded-file-data('file')))}
let $login := xmldb:login($collection_uri, 'admin', '')
let $created_collection := xmldb:create-collection('/db/apps/logsys/', 'events')
let $avail := xmldb:collection-available($collection_uri)


return
    <p>File {$filename} uploaded successfully:
        {
            for $event in ($xml/Events/*)
                let $hui := xmldb:store($collection_uri, $event/System/EventID, $event)
                return $event
        }
    </p>
