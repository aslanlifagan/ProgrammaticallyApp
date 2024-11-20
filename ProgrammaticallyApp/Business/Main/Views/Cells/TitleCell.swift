//
//  TitleCell.swift
//  ProgrammaticallyApp
//
//  Created by Aslanli Faqan on 01.11.24.
//

import UIKit

final class TitleCell: UITableViewCell {
    private lazy var titleLabel: UILabel = {
       let l = UILabel()
        l.text = "Welcome"
        l.textAlignment = .left
        l.numberOfLines = 1
        l.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        l.textColor = .black
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        contentView.addSubview(titleLabel)
        titleLabel.fillSuperview()
//        NSLayoutConstraint.activate([
//            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
//            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
//        ])
    }

}
