//
//  AuthViewModel.swift
//  ProgrammaticallyApp
//
//  Created by Aslanli Faqan on 20.11.24.
//

import Foundation
import RealmSwift

final class AuthViewModel {
    enum ViewState {
        case error(String)
        case success
        case showMain
    }
    var listener: ((ViewState) -> Void)?
    private var userList: Results<UserDTO>?
    let realm = try! Realm()
    
    init() {
        print(realm.configuration.fileURL ?? "")
    }
    
    func fetchUserList() {
        userList = realm.objects(UserDTO.self)
    }
    
    func createUser(model: UserDataModel) {
        guard model.user.isValidName() else {
            listener?(.error("User min 3 olmalidir"))
            return
        }
        guard model.name.isValidName() else {
            listener?(.error("Name min 3 olmalidir"))
            return
        }
        guard model.password.isValidPassword() else {
            listener?(.error("pass min 8 olmalidir"))
            return
        }
        
        guard model.email.isValidEmailMask() else {
            listener?(.error("email min 3 olmalidir"))
            return
        }
        
        guard model.email.isValidEmail() else {
            listener?(.error("Duzgun format deyil"))
            return
        }
        createUserRequest(model: model)
        print(#function)
    }
    
    func checkUser(model: UserDataModel) {
        guard model.user.isValidName() else {
            listener?(.error("User min 3 olmalidir"))
            return
        }
        guard model.password.isValidPassword() else {
            listener?(.error("pass min 8 olmalidir"))
            return
        }
        checkUserfromDB(model: model)
    }
    
    func checkUserfromDB(model: UserDataModel) {
        guard let userList = userList else {return}
        if let user = userList.first(where: {$0.user == model.user}) {
            if user.password == model.password {
                listener?(.showMain)
            } else {
                listener?(.error("parol yanlishdir"))
            }
        } else {
            listener?(.error("Bele bir user yoxdur"))
        }
    }
    
    fileprivate func createUserRequest(model: UserDataModel) {
        let dto = UserDTO()
        dto.name = model.name
        dto.user = model.user
        dto.password = model.password
        dto.email = model.email
        do  {
            try realm.write {
                realm.add(dto)
            }
            
            listener?(.success)
        } catch {
            listener?(.error("User yaradilmadi"))
        }
    }
}
