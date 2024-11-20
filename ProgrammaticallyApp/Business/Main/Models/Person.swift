//
//  Person.swift
//  ProgrammaticallyApp
//
//  Created by Aslanli Faqan on 04.11.24.
//

import Foundation
struct Person {
    let name: String
    let age: Int
}

extension Person: TitleSubtitleProtocol {

    var titleString: String {
        name
    }
    
    var subtitleString: String {
        age.convertToString()
    }
    
}
