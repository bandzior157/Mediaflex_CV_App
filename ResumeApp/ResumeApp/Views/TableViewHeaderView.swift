//
//  TableViewHeaderView.swift
//  ResumeApp
//
//  Created by Damian Tabański on 25/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

protocol TableViewHeaderViewing {
    func update(title: String?)
}

class TableViewHeaderView: UIView {
    
    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = .preferredFont(forTextStyle: .headline)
        label.textColor = .label
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        backgroundColor = .secondarySystemBackground
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    private func setupSubviews() {
        addSubview(textLabel)

        textLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            textLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            textLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            textLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
    
}

extension TableViewHeaderView: TableViewHeaderViewing {
    
    func update(title: String?) {
        textLabel.text = title
    }
    
}
