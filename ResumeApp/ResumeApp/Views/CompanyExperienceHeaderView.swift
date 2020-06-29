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
        imageView.image = UIImage(systemName: "person.crop.circle")
        imageView.tintColor = .gray
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = CompanyExperienceHeaderView.imageViewSide/2
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
        
        let stackView = UIStackView(arrangedSubviews: [imageView, companyLabel, roleLabel])
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
        
        setLabelsVisible(false)
    }
    
    internal func setLabelsVisible(_ visible: Bool) {
        let textColor : UIColor = visible ? .label : .clear
        let backgroundColor: UIColor = visible ? .clear : .lightGray
        companyLabel.textColor = textColor
        roleLabel.textColor = textColor
        
        companyLabel.backgroundColor = backgroundColor
        roleLabel.backgroundColor = backgroundColor
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