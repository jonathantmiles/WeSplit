//
//  ContentView.swift
//  WeSplit
//
//  Created by Jonathan T. Miles on 10/22/19.
//  Copyright © 2019 Jonathan T. Miles. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("Hello World 0")
                }
            }
            .navigationBarTitle("SwiftUI", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
