xquery version "3.1";
declare namespace event="http://schemas.microsoft.com/win/2004/08/events/event";
let $headers :=  response:set-header("Access-Control-Allow-Origin", "*")
let $headers2 := response:set-header("Access-Control-Allow-Headers", "origin, x-requested-with, content-type")
let $query_filter := request:get-parameter('query', '')

return
    <Events>
        {
            if(fn:compare($query_filter, '') = 0) then
                for $event in util:eval("collection('/db/apps/logsys/events')/event:Event")
                    return $event
            else
                for $event in util:eval(fn:concat("collection('/db/apps/logsys/events')/event:Event",fn:concat(fn:concat('[',$query_filter), ']')))
                    return $event
        }
</Events>
