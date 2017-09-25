//
//  Package.swift
//  Perefect
//
//  Created by George on 2017/9/25.
//  Copyright © 2017年 George. All rights reserved.
//

import Foundation
import PackageDescription

let package = Package(
    name: "MyCardMessageCrawl",
    dependencies: [
        .Package(
            url: "https://github.com/Geor9eLau/MessageCrawl.git",
            majorVersion: 10
        )
    ]
)
