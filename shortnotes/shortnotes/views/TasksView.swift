//
//  TasksView.swift
//  shortnotes
//
//  Created by rt on 28/07/2022.
//

import SwiftUI

struct TasksView: View {
    @EnvironmentObject var realmManager : RealmManager
    
    var body: some View {
        VStack {
           Text("My Tasks")
                .font(.title3).bold()
                .padding()
                .frame(maxWidth:.infinity,alignment: .leading)
            List{
                ForEach(realmManager.tasks, id: \.id) {
                    task in TaskRow(task: task.title, completed: task.completed)
                        .onTapGesture {
                            realmManager.updateTask(id: task.id, completed: !task.completed)
                        }
                        .swipeActions(edge:.trailing) {
                            Button(role: .destructive){
                                realmManager.deleteTask(id: task.id)
                            } label: {
                                
                            }
                        }
                }.listRowSeparator(.hidden)
                    
            }
            .onAppear{
                UITableView.appearance().backgroundColor = UIColor.clear
                UITableViewCell.appearance().backgroundColor = UIColor.clear
            }
        }
        .frame(maxWidth:.infinity, maxHeight: .infinity)
        .background(Color(hue: 0.086, saturation: 0.141, brightness: 0.972))
    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView( )
            .environmentObject(RealmManager())
    }
}
