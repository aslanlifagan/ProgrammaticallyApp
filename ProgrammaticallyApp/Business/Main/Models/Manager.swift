//
//  Manager.swift
//  ProgrammaticallyApp
//
//  Created by Aslanli Faqan on 04.11.24.
//

import Foundation
struct Manager {
    let name: String
    let role: String
}

extension Manager: TitleSubtitleProtocol {
    var titleString: String {
        name
    }
    
    var subtitleString: String {
        role
    }
    
}
