import XCTest
@testable import StylePublishPlugin
import Ink

final class StylePublishPluginTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let parser = MarkdownParser(modifiers: [.styleCodeBlocks])
        let html = parser.html(from: """
        An actual code block
        ```
        let int = 7
        ```
        A style block
        ```style
        table {
            table-layout: fixed !important;
        }
        ```
        """)

        
        let result = """
        <p>An actual code block</p><pre><code>let int = 7
        </code></pre><p>A style block</p><link rel="stylesheet" href="data:text/css,table%20%7B%0A%20%20%20%20table%2Dlayout%3A%20fixed%20%21important%3B%0A%7D%0A" />
        """
        
        XCTAssertEqual(html, result)
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
