import PackageDescription

let package = Package(
    name: "OpenCC",
    dependencies: [
        .Package(url: "https://github.com/shiningdracon/COpenCC-OSX.git", majorVersion: 1)
    ]
)
