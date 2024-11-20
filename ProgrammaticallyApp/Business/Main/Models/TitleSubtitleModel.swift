//
//  TitleSubtitleModel.swift
//  ProgrammaticallyApp
//
//  Created by Aslanli Faqan on 04.11.24.
//

import Foundation
struct TitleSubtitleModel {
    let title: String
    let subtitle: String
    
    init(from dto: Person) {
        self.title = dto.name
        self.subtitle = dto.age.convertToString()
    }
    
    init(from dto: Manager) {
        self.title = dto.name
        self.subtitle = dto.role
    }
    
    init(from dto: Branch) {
        self.title = dto.title
        self.subtitle = dto.address
    }
    
    init(from dto: Student) {
        self.title = dto.name
        self.subtitle = dto.point.convertToString()
    }
}
