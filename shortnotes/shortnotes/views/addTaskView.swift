//
//  addTaskView.swift
//  shortnotes
//
//  Created by rt on 28/07/2022.
//

import SwiftUI

struct addTaskView: View {
    @State private var title: String = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var realmManager : RealmManager
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            Text("Create a new task")
                .font(.title3).bold()
                .frame(maxWidth:.infinity, alignment: .leading)
            TextField("Enter task", text: $title)
                .textFieldStyle(.roundedBorder)
            Button{
                if(title != ""){
                    print(title)
                    realmManager.addTask(taskTitle: title)
                }
                
                dismiss()
            }label:{
                Text("Add task")
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(.blue)
                    .cornerRadius(30)
            }
            Spacer()
        }
        .padding(.top,40)
        .padding(.horizontal)
        .background(Color(hue: 0.086, saturation: 0.141, brightness: 0.972))
    }
}

struct addTaskView_Previews: PreviewProvider {
    static var previews: some View {
        addTaskView()
            .environmentObject(RealmManager())
    }
}
