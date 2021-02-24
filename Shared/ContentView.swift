//
//  ContentView.swift
//  Shared
//
//  Created by Aaron Wright on 7/25/20.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.undoManager) var undoManager
    @ObservedObject var document: DocExampleDocument

    var body: some View {
        TextEditor(text: .init(get: { () -> String in
            return document.text
        }, set: { (text) in
            let oldText = document.text
            document.text = text
            undoManager?.registerUndo(withTarget: document, handler: { (document) in
                document.text = oldText
            })
        }))
    }
    
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView(document: DocExampleDocument())
    }
    
}
