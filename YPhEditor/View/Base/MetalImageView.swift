//
//  MetalImageView.swift
//  YPhEditor
//
//  Created by Эдгар Кусков on 2.02.24.
//

import Foundation
import MetalKit

class MetalImageView: MTKView {
    
    var commandQueue: MTLCommandQueue!
    var sourceTexture: MTLTexture?
    var context: CIContext!
    var loader: MTKTextureLoader!
    let colorSpace = CGColorSpaceCreateDeviceRGB()
    
    convenience init(frame: CGRect) {
        
        let device: MTLDevice = ImageProcessingManager.shared.device
        self.init(frame: frame, device: device)
        
        framebufferOnly = false
        commandQueue = device.makeCommandQueue()
        context = CIContext(mtlDevice: device)
        loader = MTKTextureLoader(device: device)
    }
    
    func setTexture(from cgImage: CGImage?) {
//        print("cgImage in setTexture: ", cgImage)
//        do {
//            print("result of texture loading: ", try loader.newTexture(cgImage: cgImage!, options: [MTKTextureLoader.Option.origin: MTKTextureLoader.Origin.flippedVertically]))
//        }
//        catch {
//            print("source texture error: ", error)
//        }
//        
        guard let cgImage,
              let sourceTexture = try? loader.newTexture(cgImage: cgImage, options: [MTKTextureLoader.Option.origin: MTKTextureLoader.Origin.flippedVertically])
        else {
            debugPrint(":: Error: MetalImageView -> setTexture: Unable to set texture")
            return
        }
        
        self.sourceTexture = sourceTexture
    }
}
