//
//  Package.swift
//  Perefect
//
//  Created by George on 2017/9/25.
//  Copyright © 2017年 George. All rights reserved.
//

import PackageDescription

let package = Package(
    name: "MessageCrawl",
    dependencies: [
        .Package(
            url: "https://github.com/PerfectlySoft/Perfect-HTTPServer.git",
            majorVersion: 2, minor: 0)
    ]
)
