import PackageDescription

#if os(OSX)
let package = Package(
    name: "OpenCC",
    dependencies: [
        .Package(url: "https://github.com/shiningdracon/COpenCC-OSX.git", majorVersion: 1)
    ]
)
#else
let package = Package(
    name: "OpenCC",
    dependencies: [
        .Package(url: "https://github.com/shiningdracon/COpenCC-Linux.git", majorVersion: 1)
    ]
)
#endif
