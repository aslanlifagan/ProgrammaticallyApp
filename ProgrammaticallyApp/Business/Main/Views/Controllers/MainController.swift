//
//  MainController.swift
//  ProgrammaticallyApp
//
//  Created by Aslanli Faqan on 01.11.24.

import UIKit
final class MainController: BaseViewController {
    //MARK: ViewFactory
    private lazy var segmentView: UISegmentedControl = {
        let s = UISegmentedControl(items: items)
        s.selectedSegmentIndex = 0
        s.addTarget(self, action: #selector(segmentClicked), for: .valueChanged)
        s.translatesAutoresizingMaskIntoConstraints = false
        return s
    }()
    
    private lazy var table: UITableView = {
       let t = UITableView()
        t.delegate = self
        t.dataSource = self
//        t.register(TitleSubtitleCell.self, forCellReuseIdentifier: "TitleSubtitleCell")
        t.register(cell: TitleSubtitleCell.self)
        t.separatorStyle = .none
        return t
    }()

    private lazy var loadingView: UIActivityIndicatorView = {
        let v = UIActivityIndicatorView(style: .large)
        v.tintColor = .red
        return v
    }()
    private let viewModel: MainViewModel
    private let items = ["People","Manager","Branch", "Student"] // UI logic
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewModel()
        viewModel.setIndex(index: 0)
//        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
//            let vc = HomeController(viewModel: self.viewModel)
//            self.present(vc, animated: true)
//        }
    }
    
    override func configureView() {
        super.configureView()
        view.addSubview(segmentView)
        view.addSubview(table)
        view.addSubview(loadingView)
        
        loadingView.startAnimating()
    }
    
    override func configureConstraint() {
        super.configureConstraint()
        NSLayoutConstraint.activate([
            segmentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            segmentView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            segmentView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            segmentView.heightAnchor.constraint(equalToConstant: 48)
        ])
        table.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: segmentView.bottomAnchor, constant: 0),
            table.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            table.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            table.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        loadingView.fillSuperview()
        
    }
    
    override func configureTargets() {
        super.configureTargets()
    }
    
    fileprivate func configureViewModel() {
        viewModel.listener = { [weak self] state in
            guard let self else {return}
            switch state {
            case .loading:
                loadingView.startAnimating()
            case .loaded:
                loadingView.stopAnimating()
            case .success:
                reloadTableView()
            case .bgColorChanged:
                view.backgroundColor = .red
            case .error(let message):
                showMessage(title: "Warning", message: message)
            default: break
            }
            
        }
//        viewModel.delegate = self
    }
    //MARK: Private Functions
    
    fileprivate func reloadTableView() {
        DispatchQueue.main.async { [weak self] in
            self?.table.reloadData()
        }
    }
    
    @objc
    fileprivate func segmentClicked() {
        viewModel.setIndex(index: segmentView.selectedSegmentIndex)
        print(segmentView.selectedSegmentIndex, #function)
    }
}
extension MainController: UITableViewDelegate, UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        viewModel.getItems()
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: TitleSubtitleCell.self, for: indexPath)
        let item = viewModel.getProtocol(index: indexPath.row)
//        let item = getModel(index: indexPath.row)
        cell.configureCell(model: item)
        return cell
    }
}

//extension MainController: MainViewModelDelegate {
//    func listener(state: ViewState) {
//        switch state {
//        case .loading:
//            loadingView.startAnimating()
//        case .loaded:
//            loadingView.stopAnimating()
//        case .success:
//            reloadTableView()
//        case .error(let message):
//            showMessage(title: "Warning", message: message)
//        }
//    }
//    
//}
