//
//  RealmManager.swift
//  shortnotes
//
//  Created by rt on 28/07/2022.
//

import Foundation
import RealmSwift

class RealmManager: ObservableObject{
    private(set) var localRealm: Realm?
    @Published private(set) var tasks:[Task] = []
    
    init() {
        openRealm()
        getTasks()
    } 
    
    func openRealm(){
        do{
            let config = Realm.Configuration(schemaVersion:1)
            Realm.Configuration.defaultConfiguration = config
            
            localRealm = try Realm()
        }catch{print("Error oppening Realm:\(error)")}
    }
    func addTask(taskTitle:String){
        if let localRealm = localRealm {
            do{
                try localRealm.write{
                    let newTask = Task(value: ["title": taskTitle, "completed":false])
                    localRealm.add(newTask)
                    print("task added: \(newTask)")
                    getTasks()
                }
            }catch{
                print("Error adding task: \(error)")
            }
        }
    }
    func getTasks(){
        if let localRealm = localRealm {
           let allTasks = localRealm.objects(Task.self).sorted(byKeyPath: "completed")
           tasks = []
            allTasks.forEach { task in
                tasks.append(task)
            }
        }
    }
    
    func updateTask(id:ObjectId, completed:Bool){
        if let localRealm = localRealm {
            do{
               let taskToUpdate = localRealm.objects(Task.self).filter(NSPredicate(format: "id== %@", id))
                
                guard !taskToUpdate.isEmpty else {return}
                try localRealm.write{
                    taskToUpdate[0].completed = completed
                    getTasks()
                    print("updated taask")
                }
                
            }catch{
                print("Error updatimg task")
            }
        }
    }
    func deleteTask(id:ObjectId){
        if let localRealm = localRealm {
            do{
               let taskToDelete = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id))
                
                guard !taskToDelete.isEmpty else {return}
                try localRealm.write{
                    localRealm.delete(taskToDelete)
                    getTasks()
                    print("deleted task")
                }
                
            }catch{
                print("Error updatimg task")
            }
        }
    }
}
