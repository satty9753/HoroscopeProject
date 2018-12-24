//
//  FadeInPresentationManager.swift
//  HoroscopeProject
//
//  Created by michelle on 2018/12/18.
//  Copyright © 2018年 michelle. All rights reserved.
//

import Foundation
import UIKit

class ZoomInPresentationManager: NSObject {
    var toFrame:CGRect!
    var fromFrame:CGRect!
    var image:UIImage!
    
    init(toFrame:CGRect, fromFrame:CGRect, image:UIImage){
        self.toFrame = toFrame
        self.fromFrame = fromFrame
        self.image = image
        super.init()
    }
}


extension ZoomInPresentationManager: UINavigationControllerDelegate{
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        switch operation {
        case .push:
            return ZoomInPresentationAnimator(isPresentation: true, fromFrame: fromFrame, toFrame: toFrame, image: image)
        default:
            return ZoomInPresentationAnimator(isPresentation: false, fromFrame: toFrame, toFrame:fromFrame, image: image)
        }
    }
    
}
