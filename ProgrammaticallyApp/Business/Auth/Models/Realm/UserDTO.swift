//
//  UserDTO.swift
//  ProgrammaticallyApp
//
//  Created by Aslanli Faqan on 20.11.24.
//

import RealmSwift
class UserDTO: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var user: String?
    @Persisted var name: String?
    @Persisted var email: String?
    @Persisted var password: String?
}

extension UserDTO {
    func mapFrom(from model: UserDataModel) {

    }
}
