//
//  PersonView.swift
//  Mediaflex_CV_App
//
//  Created by Łukasz Bazior on 22/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

class PersonView: UIView {
    
    private static let imageViewSide: CGFloat = 80
    
    lazy var imageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.crop.circle")
        imageView.tintColor = .gray
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = PersonView.imageViewSide
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        var label = UILabel()
        label.font = .preferredFont(forTextStyle: .headline)
        return label
    }()
    
    lazy var roleLabel: UILabel = {
        var label = UILabel()
        label.font = .preferredFont(forTextStyle: .subheadline)
        return label
    }()
    
    lazy var separatorView: UIView = {
        var view = UIView()
        view.backgroundColor = .label
        return view
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
        
        let stackView = UIStackView(arrangedSubviews: [imageView, nameLabel, roleLabel])
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.spacing = 8
        
        let stackView2 = UIStackView(arrangedSubviews: [stackView, separatorView])
        stackView2.alignment = .center
        stackView2.axis = .vertical
        stackView2.spacing = 32
        
        addSubview(stackView2)
        bringSubviewToFront(stackView2)
                
        layoutImageView()
        layoutSeparatorView()
        layout(contentView: stackView2)
    }
    
    private func placeholderSetup() {
        nameLabel.text = "ABCDEFGHIJKLMNOPRS"
        roleLabel.text = "ABCDEFGHIJK"
        
        setLabelsVisible(false)
    }
    
    internal func setLabelsVisible(_ visible: Bool) {
        let textColor : UIColor = visible ? .label : .clear
        let backgroundColor: UIColor = visible ? .clear : .lightGray
        nameLabel.textColor = textColor
        roleLabel.textColor = textColor
        
        nameLabel.backgroundColor = backgroundColor
        roleLabel.backgroundColor = backgroundColor
        
    }
    
    
    // MARK: - Layout
    
    private func layoutImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(getImageViewConstraints())
    }
    
    private func layoutSeparatorView() {
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(getSeparatorViewConstraints())
    }
    
    private func layout(contentView view: UIView) {
        let constraints = NSLayoutConstraint.anchorConstraints(view: view, in: safeAreaLayoutGuide, margins: Margins(vertical: 32, horizontal: 16))
                
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints)
    }
    
    
    // MARK: - Constraints
    
    private func getSeparatorViewConstraints() -> [NSLayoutConstraint] {
        [separatorView.heightAnchor.constraint(equalToConstant: 1),
         separatorView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.8)]
    }
    
    private func getImageViewConstraints() -> [NSLayoutConstraint] {
        [imageView.heightAnchor.constraint(equalToConstant: PersonView.imageViewSide),
        imageView.widthAnchor.constraint(equalToConstant: PersonView.imageViewSide)]
    }
    
}
