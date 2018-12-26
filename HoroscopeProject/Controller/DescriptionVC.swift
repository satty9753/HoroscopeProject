//
//  DescriptionVC.swift
//  HoroscopeProject
//
//  Created by michelle on 2018/12/17.
//  Copyright © 2018年 michelle. All rights reserved.
//

import UIKit

class DescriptionVC: UIViewController {

    var horoscope:Horoscope?
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var textView: UITextView!
    private var beginToScrollHeight:CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpScrollView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        guard horoscope != nil else{
            return
        }
        navigationItem.title = horoscope!.name
        imageView.image = UIImage(named: horoscope!.squareImageName!)
        textView.text = horoscope?.description
    }
    
    
    private func setUpScrollView(){
        scrollView.bounces = true
        scrollView.maximumZoomScale = 1.1
        scrollView.bouncesZoom = true
        scrollView.isScrollEnabled = false
        scrollView.delegate = self
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//MARK: - UIScrollViewDelegate Method
extension DescriptionVC: UIScrollViewDelegate{
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
        beginToScrollHeight = view?.frame.height
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        scrollView.frame.size = imageView.frame.size
        let distance = imageView.frame.height - beginToScrollHeight
        textView.transform = textView.transform.translatedBy(x: 0, y: distance)
        beginToScrollHeight = imageView.frame.height
        
    }
    
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        
        scrollView.frame = CGRect(origin:CGPoint(x: 0, y: statusBarHeight+self.navigationController!.navigationBar.frame.height), size: CGSize(width: self.view.frame.width, height: view!.frame.height))
        
    }
    
}






