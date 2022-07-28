//
//  TaskRow.swift
//  shortnotes
//
//  Created by rt on 28/07/2022.
//

import SwiftUI

struct TaskRow: View {
    var task:String
    var completed: Bool
    
    var body: some View {
        HStack(spacing:20){
            Image(systemName: completed ?"checkmark.circle": "circle")
            Text(task)
        }
    }
}

struct TaskRow_Previews: PreviewProvider {
    static var previews: some View {
        TaskRow(task: "Test Swift ui", completed: false)
    }
}
