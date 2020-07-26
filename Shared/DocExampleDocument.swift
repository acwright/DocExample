//
//  DocExampleDocument.swift
//  Shared
//
//  Created by Aaron Wright on 7/25/20.
//

import SwiftUI
import UniformTypeIdentifiers

extension UTType {
    
    static var exampleText: UTType {
        UTType(importedAs: "com.example.plain-text")
    }
    
}

class DocExampleDocument: ReferenceFileDocument {
    
    @Published var text: String

    init(text: String = "Hello, world!") {
        self.text = text
    }

    static var readableContentTypes: [UTType] { [.exampleText] }

    required init(fileWrapper: FileWrapper, contentType: UTType) throws {
        guard let data = fileWrapper.regularFileContents,
              let string = String(data: data, encoding: .utf8)
        else {
            throw CocoaError(.fileReadCorruptFile)
        }
        text = string
    }
    
    func snapshot(contentType: UTType) throws -> String {
        return self.text
    }
    
    func write(snapshot: String, to fileWrapper: inout FileWrapper, contentType: UTType) throws {
        let data = snapshot.data(using: .utf8)!
        fileWrapper = FileWrapper(regularFileWithContents: data)
    }
    
}
