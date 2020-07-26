//
//  ContentView.swift
//  Shared
//
//  Created by Aaron Wright on 7/25/20.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var document: DocExampleDocument

    var body: some View {
        TextEditor(text: $document.text)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView(document: DocExampleDocument())
    }
    
}
