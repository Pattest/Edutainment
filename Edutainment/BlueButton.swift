//
//  BlueButton.swift
//  Edutainment
//
//  Created by Baptiste Cadoux on 10/09/2021.
//

import SwiftUI

struct BlueButton: View {
    var name: String
    let action: () -> Void

    var body: some View {
        Button(name, action: action)
            .font(.title)
            .padding()
            .foregroundColor(.white)
            .frame(width: 200, height: 40)
            .background(Color.blue)
            .border(Color.blue, width: 2)
            .clipShape(Capsule())
    }
}
