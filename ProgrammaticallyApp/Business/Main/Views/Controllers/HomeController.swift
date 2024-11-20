//
//  HomeController.swift
//  ProgrammaticallyApp
//
//  Created by Aslanli Faqan on 06.11.24.
//

import Foundation
final class HomeController: BaseViewController {
    private let viewModel: MainViewModel
    
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.setIndex(index: 10)
    }
    override func configureView() {
        super.configureView()
    }
    override func configureConstraint() {
        super.configureConstraint()
    }
    override func configureTargets() {
        super.configureTargets()
    }
}
