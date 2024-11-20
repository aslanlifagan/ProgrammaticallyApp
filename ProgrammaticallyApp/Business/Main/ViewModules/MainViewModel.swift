//
//  MainViewModel.swift
//  ProgrammaticallyApp
//
//  Created by Aslanli Faqan on 06.11.24.
//

import Foundation

//protocol MainViewModelDelegate: AnyObject {
//    func listener(state: ViewState)
//}

final class MainViewModel {
    //MARK: ViewState
    enum ViewState {
        case loading
        case loaded
        case success
        case bgColorChanged 
        case error(String)
    }
    
    private var selectedIndex = 0 {
        didSet {
            print(#function, selectedIndex)
            generateSegment()
        }
    }
    
//    weak var delegate: MainViewModelDelegate?
    
    var listener: ((ViewState) -> Void)?
    private var people: [Person] = []
    private var managers: [Manager] = []
    private var branches: [Branch] = []
    private var students: [Student] = []
    func setIndex(index: Int) {
        self.selectedIndex = index
    }
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.listener?(.bgColorChanged)
        }
    }
    fileprivate func generateSegment() {
        switch selectedIndex {
        case 0: generatePeople()
        case 1: generateManagers()
        case 2: generateBranches()
        default: generateStudents()
        }
        listener?(.success)
//        delegate?.listener(state: .success)
    }
    
    fileprivate func generatePeople() {
        guard people.isEmpty else {
//            delegate?.listener(state: .success)
            listener?(.success)
            return
        }
//        delegate?.listener(state: .loading)
        listener?(.loading)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.people = [
                Person(name: "Kenan", age: 18),
                Person(name: "Bextiyar", age: 62),
                Person(name: "Ehmed", age: 34),
                Person(name: "Yusif", age: 28),
                Person(name: "Cavidan", age: 32),
            ]
//            self.delegate?.listener(state: .loaded)
//            self.delegate?.listener(state: .success)
            self.listener?(.loaded)
            self.listener?(.success)
        }
        
        print(#function, people)
    }
    
    fileprivate func generateManagers() {
        guard managers.isEmpty else {return}
//        delegate?.listener(state: .error("Menecer meluamatlari yoxdur"))
        listener?(.error("Menecer meluamatlari yoxdur"))
        //        managers = [
        //            Manager(name: "Nicat", role: "T"),
        //            Manager(name: "Orxan", role: "M"),
        //            Manager(name: "Mehemmed", role: "S")
        //        ]
        print(#function, managers)
    }
    
    fileprivate func generateBranches() {
        guard branches.isEmpty else {return}
//        delegate?.listener(state: .error("Branch meluamatlari yoxdur"))
        listener?(.error("Branch meluamatlari yoxdur"))
        //        branches = [
        //            Branch(title: "Nesimi", address: "28 may"),
        //            Branch(title: "Nizami", address: "5 merteb"),
        //            Branch(title: "Fizuli", address: "Park"),
        //            Branch(title: "Qara Qarayev", address: "Ozbekistan kucesi"),
        //        ]
        print(#function, branches)
    }
    
    fileprivate func generateStudents() {
        guard students.isEmpty else {return}
        students = [
            Student(name: "Kenan", point: 18),
            Student(name: "Cavidan", point: 32),
        ]
        print(#function, people)
    }
    
    func getModel(index: Int) -> TitleSubtitleModel {
        switch selectedIndex {
        case 0: return TitleSubtitleModel(from: people[index])
        case 1: return TitleSubtitleModel(from: managers[index])
        case 2: return TitleSubtitleModel(from: branches[index])
        default: return TitleSubtitleModel(from: students[index])
        }
    }
    
    func getProtocol(index: Int) -> TitleSubtitleProtocol {
        switch selectedIndex {
        case 0: return people[index]
        case 1: return managers[index]
        case 2: return branches[index]
        default: return students[index]
        }
    }
    
    func getItems() -> Int {
        switch selectedIndex {
        case 0: return people.count
        case 1: return managers.count
        case 2: return branches.count
        default: return students.count
        }
    }
}
