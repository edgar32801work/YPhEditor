//
//  ImagePickerAlert.swift
//  YPhEditor
//
//  Created by Эдгар Кусков on 12.02.24.
//

import UIKit

final class ImagePickerAlert: UIAlertController {
    
    var completion: ((UIAlertAction)->())?
    
    convenience init(completion: ((UIAlertAction)->Void)? = nil) {
        self.init(
            title: Resources.Strings.Gallery.alertTitle,
            message: nil,
            preferredStyle: .actionSheet)
        self.completion = completion
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
}

extension ImagePickerAlert {
    
    func configure() {
        
        let alertActionGallery = UIAlertAction(
            title: Resources.Strings.Gallery.alertActionGallery,
            style: .default,
            handler: completion)
        addAction(alertActionGallery)
        
        let alertActionCamera = UIAlertAction(
            title: Resources.Strings.Gallery.alertActionCamera,
            style: .default,
            handler: completion)
        addAction(alertActionCamera)
        
        let alertActionCancel = UIAlertAction(
            title: Resources.Strings.Gallery.alertActionCancel,
            style: .cancel) { _ in
                self.dismiss(animated: true)
            }
        addAction(alertActionCancel)
    }
}


