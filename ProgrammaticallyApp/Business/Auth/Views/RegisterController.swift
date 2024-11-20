//
//  RegisterController.swift
//  ProgrammaticallyApp
//
//  Created by Aslanli Faqan on 01.11.24.
//

import UIKit
final class RegisterController: BaseViewController {

    private lazy var titleLabel: UILabel = {
       let l = UILabel()
        l.text = "Welcome"
        l.textAlignment = .left
        l.numberOfLines = 0
        l.font = UIFont.systemFont(ofSize: 36, weight: .semibold)
        l.textColor = .black
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    private lazy var userField: UITextField = {
       let t = UITextField()
        t.placeholder = "Username"
        t.borderStyle = .roundedRect
        t.delegate = self
        t.translatesAutoresizingMaskIntoConstraints = false
        return t
    }()
    
    private lazy var nameField: UITextField = {
       let t = UITextField()
        t.placeholder = "Name"
        t.borderStyle = .roundedRect
        t.delegate = self
        t.translatesAutoresizingMaskIntoConstraints = false
        return t
    }()
    
    private lazy var emailField: UITextField = {
       let t = UITextField()
        t.placeholder = "Username"
        t.borderStyle = .roundedRect
        t.delegate = self
        t.translatesAutoresizingMaskIntoConstraints = false
        t.keyboardType = .emailAddress
        return t
    }()
    
    private lazy var passwordField: UITextField = {
       let t = UITextField()
        t.placeholder = "Password"
        t.borderStyle = .roundedRect
        t.delegate = self
        t.translatesAutoresizingMaskIntoConstraints = false
        t.keyboardType = .numberPad
//        t.isSecureTextEntry = true
        return t
    }()
    
    private lazy var submitButton: UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("Create", for: .normal)
        b.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        b.titleLabel?.textColor = .white
        b.backgroundColor = .orange
        b.addTarget(self, action: #selector(submitClicked), for: .touchUpInside)
        b.layer.cornerRadius = 12
        return b
    }()
    
    private lazy var stackView: UIStackView = {
        let s = UIStackView(arrangedSubviews: [userField, nameField,emailField, passwordField])
        s.axis = .vertical
        s.distribution = .fill
        s.spacing = 12
        s.alignment = .fill
        s.translatesAutoresizingMaskIntoConstraints = false
        return s
    }()
    
    private let viewModel: AuthViewModel
    
    init(viewModel: AuthViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("impl")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewModel()
    }
    
    override func configureView() {
//        view.addSubview(titleLabel)
//        view.addSubview(stackView)
//        view.addSubview(submitButton)
        view.addSubViews(titleLabel, stackView, submitButton)
        configureConstraint()
        
    }
    
    override func configureConstraint() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            userField.heightAnchor.constraint(equalToConstant: 48),
            emailField.heightAnchor.constraint(equalToConstant: 48),
            passwordField.heightAnchor.constraint(equalToConstant: 48),
            nameField.heightAnchor.constraint(equalToConstant: 48),
        ])
        
        
        NSLayoutConstraint.activate([
            submitButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            submitButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            submitButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -4),
            submitButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    fileprivate func configureViewModel() {
        viewModel.listener = { [weak self] state in
            guard let self else {return}
            switch state {
                case .success:
                    showLogin()
                case .error(let message):
                    showMessage(title: "Error", message: message)
                default: break
            }
        }
    }
    
    @objc
    fileprivate func submitClicked() {
        guard let user = userField.text,
              let name = nameField.text,
              let pass = passwordField.text,
              let email = emailField.text,
              !user.isEmpty,
              !name.isEmpty,
              !pass.isEmpty,
              !email.isEmpty else {
            showMessage(title: "Error", message: "Fieldler bos ola bilmez!")
            return
        }
        let model = UserDataModel(user: user, name: name, email: email, password: pass)
        
        viewModel.createUser(model: model)
    }
    fileprivate func showLogin() {
        let vc = LoginController(viewModel: viewModel)
        navigationController?.show(vc, sender: nil)
    }
}

extension RegisterController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = textField.text else {return}
        print(#function, text)
    }
}

