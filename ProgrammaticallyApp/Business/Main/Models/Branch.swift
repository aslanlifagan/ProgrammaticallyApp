//
//  Branch.swift
//  ProgrammaticallyApp
//
//  Created by Aslanli Faqan on 04.11.24.
//

import Foundation
struct Branch {
    let title: String
    let address: String
}

extension Branch: TitleSubtitleProtocol {
    var titleString: String {
        title
    }
    
    var subtitleString: String {
        address
    }
    
    
}
