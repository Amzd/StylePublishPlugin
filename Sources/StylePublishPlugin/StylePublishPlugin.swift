//
//  StylePublishPlugin.swift
//
//
//  Created by Casper Zandbergen on 04/12/2019.
//

import Foundation
import Publish
import Ink

public extension Plugin {
    static func styleCodeBlocks() -> Self {
        Plugin(name: "Stlye code blocks") { context in
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
