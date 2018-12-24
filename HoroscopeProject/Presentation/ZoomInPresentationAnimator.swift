//
//  FadeInPresentationAnimator.swift
//  HoroscopeProject
//
//  Created by michelle on 2018/12/18.
//  Copyright © 2018年 michelle. All rights reserved.
//

import UIKit

class ZoomInPresentationAnimator: NSObject {
    let isPresentation:Bool
    var fromFrame:CGRect
    var toFrame:CGRect
    var image:UIImage!
    fileprivate var imageView:UIImageView!
    
    init(isPresentation:Bool, fromFrame:CGRect, toFrame:CGRect, image:UIImage) {
        self.isPresentation = isPresentation
        self.fromFrame = fromFrame
        self.toFrame = toFrame
        self.image = image
        super.init()
    }
}

extension ZoomInPresentationAnimator: UIViewControllerAnimatedTransitioning{
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {

        let fromVC = transitionContext.viewController(forKey: .from)
        let toVC = transitionContext.viewController(forKey: .to)

        transitionContext.containerView.addSubview(toVC!.view)
        toVC?.view.alpha = 0.0
        fromVC?.view.alpha = 0.0
        
        //Add image at same position
        imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = fromFrame
        transitionContext.containerView.addSubview(imageView)
        
        let animationDuration = transitionDuration(using: transitionContext)
        UIView.animate(withDuration: animationDuration, delay: 0.0, options: [.curveLinear], animations: {
            if self.isPresentation{
                fromVC?.view.alpha = 0.0
            }else{
                toVC?.view.alpha = 0.0
            }
            self.imageView.frame = self.toFrame
        }) { (finished) in
                fromVC?.view.alpha = 0.0
                toVC?.view.alpha = 1.0
            
            //transition finished, remove image
            self.imageView.removeFromSuperview()
            transitionContext.completeTransition(finished)
        }
        
    }
    
    
    

    
    
}
