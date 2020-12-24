// swift-tools-version:5.1
//
//  Package.swift
//  PerfectNet
//
//  Created by Kyle Jessup on 2016-05-02.
//	Copyright (C) 2016 PerfectlySoft, Inc.
//
//===----------------------------------------------------------------------===//
//
// This source file is part of the Perfect.org open source project
//
// Copyright (c) 2015 - 2016 PerfectlySoft Inc. and the Perfect project authors
// Licensed under Apache License v2.0
//
// See http://perfect.org/licensing.html for license information
//
//===----------------------------------------------------------------------===//
//

import PackageDescription

#if os(Linux)
let package = Package(
    name: "PerfectNet",
    products: [
        .library(name: "PerfectNet", targets: ["PerfectNet"])
    ],
    dependencies: [
        .package(url: "https://github.com/PerfectlySoft/Perfect-Crypto.git", from: "4.0.0"),
        .package(url: "https://github.com/PerfectlySoft/Perfect-LinuxBridge.git", from: "3.0.0"),
        .package(url: "https://github.com/PerfectlySoft/Perfect-Thread.git", from: "3.0.0")
    ],
    targets: [
        .target(name: "PerfectNet", dependencies: ["Perfect-Crypto", "Perfect-LinuxBridge", "Perfect-Thread"]),
        .testTarget(name: "PerfectNetTests", dependencies: ["PerfectNet", "Perfect-Crypto", "Perfect-Thread"])
    ]
)
#else
let package = Package(
    name: "PerfectNet",
	platforms: [
		.macOS(.v10_15)
	],
    products: [
        .library(name: "PerfectNet", targets: ["PerfectNet"])
    ],
    dependencies: [
        .package(url: "https://github.com/PerfectlySoft/Perfect-Crypto.git", from: "4.0.0"),
        .package(url: "https://github.com/PerfectlySoft/Perfect-Thread.git", from: "3.0.0")
    ],
    targets: [
        .target(name: "PerfectNet", dependencies: ["Perfect-Crypto", "Perfect-Thread"]),
        .testTarget(name: "PerfectNetTests", dependencies: ["Perfect-Net", "Perfect-Crypto", "Perfect-Thread"])
    ]
)
#endif
