//
//  main.swift
//  
//
//  Created by George on 2017/9/25.
//

import PerfectLib
import PerfectHTTP
import PerfectHTTPServer

// An example request handler.
// This 'handler' function can be referenced directly in the configuration below.
func handler(data: [String:Any]) throws -> RequestHandler {
    return {
        request, response in
        // Respond with a simple message.
        SysLogger().info(message: request.uri, true)
        response.setHeader(.contentType, value: "text/html")
        response.appendBody(string: "<html><title>Hello, world!</title><body>Hello, world!</body></html>")
        // Ensure that response.completed() is called when your processing is done.
        response.completed()
    }
}

// Configuration data for an example server.
// This example configuration shows how to launch a server
// using a configuration dictionary.


let confData = [
    "servers": [
        // Configuration data for one server which:
        //    * Serves the hello world message at <host>:<port>/
        //    * Serves static files out of the "./webroot"
        //        directory (which must be located in the current working directory).
        //    * Performs content compression on outgoing data when appropriate.
        [
            "name":"localhost",
            "port":8181,
            "routes":[
                ["method":["get", "post"], "uri":"/", "handler":handler],
                ["method":"get", "uri":"/**", "handler":PerfectHTTPServer.HTTPHandler.staticFiles,
                 "documentRoot":"./webroot",
                 "allowResponseFilters":true]
            ]
        ]
    ]
]

do {
    // Launch the servers based on the configuration data.
    try HTTPServer.launch(configurationData: confData)
} catch {
    fatalError("\(error)") // fatal error launching one of the servers
}
