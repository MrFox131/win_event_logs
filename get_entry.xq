xquery version "3.1";
declare namespace event="http://schemas.microsoft.com/win/2004/08/events/event";


    <p>{
        for $event in collection('/db/apps/logsys/events')/event:Event[xs:dateTime(event:System/event:TimeCreated/@SystemTime) = xs:dateTime('2021-11-29T09:58:27.2017230Z')]
            return $event
    }</p>
