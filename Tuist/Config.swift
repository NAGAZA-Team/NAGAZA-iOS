import ProjectDescription

let config = Config(
    plugins: [
        .git(url: "https://github.com/tuist/tuist-plugin-lint", tag: "0.3.0"),
//        .git(url: "https://github.com/SwiftGen/SwiftGenPlugin", tag: "6.6.0")
    ]
)
