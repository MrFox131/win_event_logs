xquery version "3.1";
declare namespace event="http://schemas.microsoft.com/win/2004/08/events/event";


    <p>{
        for $event in collection('/db/apps/logsys/events')/event:Event[event:System/event:EventRecordID = '2374']
            return $event
    }</p>
