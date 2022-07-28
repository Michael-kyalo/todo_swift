//
//  Task.swift
//  shortnotes
//
//  Created by rt on 28/07/2022.
//

import Foundation
import RealmSwift

class Task : Object, ObjectKeyIdentifiable{
    @Persisted(primaryKey: true) var id :ObjectId
    @Persisted var title = ""
    @Persisted var completed = false
}
