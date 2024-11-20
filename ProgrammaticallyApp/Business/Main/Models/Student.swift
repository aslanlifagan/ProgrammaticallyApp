//
//  Student.swift
//  ProgrammaticallyApp
//
//  Created by Aslanli Faqan on 04.11.24.
//

import Foundation
struct Student {
    let name: String
    let point: Double
}

extension Student: TitleSubtitleProtocol {
    var titleString: String {
        name
    }
    var subtitleString: String {
        point.convertToString()
    }
}
