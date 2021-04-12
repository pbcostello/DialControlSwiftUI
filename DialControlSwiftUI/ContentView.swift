//
//  ContentView.swift
//  DialControlSwiftUI
//
//  Created by Patrick Costello on 4/11/21.
//

import SwiftUI

struct ContentView: View {
    @State private var rotation0: CGFloat = 0
    @State private var rotation1: CGFloat = 0
    
    var body: some View {
        VStack {
            Text("Spin the dials").padding()
            DialView(name: "pie01", rotation: self.$rotation0).frame(width: 128, height: 128, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).background(Color.clear)
            Text(rotation0.degreesString)
            
            DialView(name: "pie02", rotation: self.$rotation1).frame(width: 128, height: 128, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).background(Color.clear)
            Text(rotation1.degreesString)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

