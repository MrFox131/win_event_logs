xquery version "3.1";

(:~ This library module contains XQSuite tests for the logsystem app.
 :
 : @author MrNansy
 : @version 1.0.0
 : @see http://exist-db.org
 :)

module namespace tests = "http://localhost/apps/logsys/tests";

import module namespace app = "http://localhost/apps/logsys/templates" at "../../modules/app.xql";
 
declare namespace test="http://exist-db.org/xquery/xqsuite";


declare variable $tests:map := map {1: 1};

declare
    %test:name('dummy-templating-call')
    %test:arg('n', 'div')
    %test:assertEquals("<p>Dummy templating function.</p>")
    function tests:templating-foo($n as xs:string) as node(){
        app:foo(element {$n} {}, $tests:map)
};
