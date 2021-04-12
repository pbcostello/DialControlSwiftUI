//
//  DialView.swift
//  DialControlSwiftUI
//
//  Created by Patrick Costello on 4/12/21.
//

import Foundation
import SwiftUI

struct DialViewRepresentable: UIViewRepresentable {
    @Binding var rotation: CGFloat
    var backgroundName: String?
    
    class Coordinator: NSObject, DialUIViewProtocol {
        var dialViewRepresentable: DialViewRepresentable
        
        @objc func dialUIViewMoved(_ dialUIView: DialUIView) {
            dialViewRepresentable.rotation = dialUIView.rotation
        }
        
        init(dialView: DialViewRepresentable) {
            self.dialViewRepresentable = dialView
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(dialView: self)
    }
    
    init(backgroundName: String?, rotation binding: Binding<CGFloat>) {
        self._rotation = binding
        self.backgroundName = backgroundName
    }
    
    func makeUIView(context: Context) -> DialUIView {
        let dialView: DialUIView = DialUIView(CGRect.zero, backgroundName: backgroundName)
        dialView.delegate = context.coordinator
        return dialView
    }
    
    func updateUIView(_ uiView: DialUIView, context: Context) {
    }
    
}

struct DialView: View {
    var backgroundName: String?
    @Binding var rotation :CGFloat
    
    init(name: String, rotation binding: Binding<CGFloat>) {
        self.backgroundName = name
        self._rotation = binding
    }
    
    var body: some View {
        return DialViewRepresentable(backgroundName: backgroundName, rotation: self.$rotation)
    }
}


