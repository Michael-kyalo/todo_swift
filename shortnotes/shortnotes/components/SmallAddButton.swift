//
//  SmallAddButton.swift
//  shortnotes
//
//  Created by rt on 28/07/2022.
//

import SwiftUI

struct SmallAddButton: View {
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 50)
                .foregroundColor(.blue)
            Text("+")
                .font(.title)
                .foregroundColor(.white)
        }.frame(height:50)
    }
}

struct SmallAddButton_Previews: PreviewProvider {
    static var previews: some View {
        SmallAddButton()
    }
}
