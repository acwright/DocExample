//
//  DocExampleApp.swift
//  Shared
//
//  Created by Aaron Wright on 7/25/20.
//

import SwiftUI

@main
struct DocExampleApp: App {
    
    var body: some Scene {
        DocumentGroup(newDocument: {
            DocExampleDocument()
        }) { file in
            ContentView(document: file.document)
        }
    }
    
}
