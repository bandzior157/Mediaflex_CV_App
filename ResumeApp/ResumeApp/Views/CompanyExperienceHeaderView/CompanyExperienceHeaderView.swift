//
//  CompanyExperienceHeaderView.swift
//  ResumeApp
//
//  Created by Damian Tabański on 29/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

class CompanyExperienceHeaderView: UIView {
    
    private static let imageViewSide: CGFloat = 120
    
    lazy var imageView: UIImageView = {
        var imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.tintColor = .gray
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var companyLabel: UILabel = {
        var label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    lazy var roleLabel: UILabel = {
        var label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    lazy var datesLabel: UILabel = {
        var label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        nil
    }
    
    private func setup() {
        backgroundColor = .systemBackground
        
        placeholderSetup()
        
        let stackView = UIStackView(arrangedSubviews: [imageView, companyLabel, roleLabel, datesLabel])
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.spacing = 16
        
        addSubview(stackView)
        layoutImageView()
        layout(contentView: stackView)
    }
    
    private func placeholderSetup() {
        companyLabel.text = "ABCDEFGHIJKLMNOPRS"
        roleLabel.text = "ABCDEFGHIJK"
        datesLabel.text = "ABCDEFGHIJK"
        
        setLabelsVisible(false)
    }
    
    internal func setLabelsVisible(_ visible: Bool) {
        let labels = [companyLabel, roleLabel, datesLabel]
        
        let textColor : UIColor = visible ? .label : .clear
        let backgroundColor: UIColor = visible ? .clear : .lightGray
        
        labels.forEach { $0.textColor = textColor }
        labels.forEach { $0.backgroundColor = backgroundColor }
    }
    
    
    // MARK: - Layout
    
    private func layoutImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(getImageViewConstraints())
    }
    
    private func layout(contentView view: UIView) {
        let constraints = NSLayoutConstraint.anchorConstraints(view: view, in: safeAreaLayoutGuide, margins: Margins(vertical: 32, horizontal: 16))
                
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints)
    }
    
    
    // MARK: - Constraints
    
    private func getImageViewConstraints() -> [NSLayoutConstraint] {
        [imageView.heightAnchor.constraint(equalToConstant: CompanyExperienceHeaderView.imageViewSide),
        imageView.widthAnchor.constraint(equalToConstant: CompanyExperienceHeaderView.imageViewSide)]
    }
    
}

extension CompanyExperienceHeaderView: CompanyExperienceHeaderViewing {
    
    func update(viewModel: CompanyExperienceHeaderViewModel) {
        companyLabel.text = viewModel.companyName
        
        if let url = URL(string: viewModel.companyLogoUrlString) {
            imageView.sd_setImage(with: url)
        }
        
        roleLabel.text = viewModel.role
        datesLabel.text = viewModel.dates
        
        setLabelsVisible(true)
    }
    
}
