//
//  EffectProtocol.swift
//  YPhEditor
//
//  Created by Эдгар Кусков on 28.02.24.
//

import Foundation
import UIKit

protocol EffectProtocol: AdjustProtocol {
    
    var effectIcon: UIImage { get }
    
    func apply(for image: CIImage?) -> CIImage?
}
