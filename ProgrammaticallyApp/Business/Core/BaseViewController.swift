//
//  BaseViewController.swift
//  ProgrammaticallyApp
//
//  Created by Aslanli Faqan on 01.11.24.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureView()
        configureConstraint()
        configureTargets()
    }
    
    open func configureView() {}
    
    open func configureConstraint() {}
    open func configureTargets() {}

}
