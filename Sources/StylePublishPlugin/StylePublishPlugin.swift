//
//  StylePublishPlugin.swift
//
//
//  Created by Casper Zandbergen on 04/12/2019.
//

import Foundation
import Publish
import Ink

/// Example:
///
/// ```style
/// table {
///     table-layout: fixed !important;
/// }
/// ```
///
/// Will get converted to
///
/// <link rel="stylesheet" href="data:text/css,table%20%7B%0A%20%20%20%20table%2Dlayout%3A%20fixed%20%21important%3B%0A%7D%0A" />
///
///

public extension Plugin {
    static func styleBlocks() -> Self {
        Plugin(name: "Stlye blocks") { context in
            context.markdownParser.addModifier(.styleCodeBlocks)
        }
    }
}

extension Modifier {
    public static var styleCodeBlocks = Modifier(target: .codeBlocks) { html, markdown in
        if markdown.hasPrefix("```style\n") {
            let withoutTicks = markdown
                .drop(while: { !$0.isNewline }).dropFirst().reversed()
                .drop(while: { !$0.isNewline }).reversed()
            
            if let encoded = String(withoutTicks).addingPercentEncoding(withAllowedCharacters: .letters) {
                return "<link rel=\"stylesheet\" href=\"data:text/css,\(encoded)\" />"
            } else {
                return html
            }
        }
        return html
    }
}
