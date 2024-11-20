//
//  TitleSubtitleCell.swift
//  ProgrammaticallyApp
//
//  Created by Aslanli Faqan on 01.11.24.
//

import UIKit
final class TitleSubtitleCell: UITableViewCell {
    private lazy var titleLabel: UILabel = {
       let l = UILabel()
        l.text = ""
        l.textAlignment = .left
        l.numberOfLines = 1
        l.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        l.textColor = .label
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    private lazy var subtitleLabel: UILabel = {
       let l = UILabel()
        l.text = ""
        l.textAlignment = .left
        l.numberOfLines = 1
        l.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        l.textColor = .secondaryLabel
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    private lazy var stackView: UIStackView = {
       let s = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        s.axis = .vertical
        s.spacing = 4
        s.alignment = .fill
        s.distribution = .fill
        s.translatesAutoresizingMaskIntoConstraints = false
        return s
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func configureUI() {
//        selectionStyle = .none
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo:topAnchor, constant: 4),
            stackView.leftAnchor.constraint(equalTo:leftAnchor, constant: 4),
            stackView.bottomAnchor.constraint(equalTo:bottomAnchor, constant: -4),
            stackView.rightAnchor.constraint(equalTo:rightAnchor, constant: -4)
        ])
    }
    
    func configureCell(model: TitleSubtitleModel) {
        titleLabel.text = model.title
        subtitleLabel.text = model.subtitle
    }
    
    func configureCell(model: TitleSubtitleProtocol) {
        titleLabel.text = model.titleString
        subtitleLabel.text = model.subtitleString
    }
}
