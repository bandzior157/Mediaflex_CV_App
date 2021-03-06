//
//  CellPresentableModel+InitEducationRecord.swift
//  ResumeApp
//
//  Created by Łukasz Bazior on 29/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import Foundation

extension CellPresentableModel {
    
    init(educationRecord: EducationRecord) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM.yyyy"
        
        let title = "\(educationRecord.schoolName)\n\(educationRecord.degree), \(educationRecord.specialization)"
        let subtitle = "\(dateFormatter.string(from: educationRecord.dateFrom)) - \(dateFormatter.string(from: educationRecord.dateTo))"
        let image = ImagePresentableModel(type: .url(string: educationRecord.schoolLogoUrlString), size: Size(width: 80, height: 80))
        let selectable = false
        
        self.init(title: title, subtitle: subtitle, image: image, selectable: selectable)
    }
    
}
