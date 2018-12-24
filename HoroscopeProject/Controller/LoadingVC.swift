//
//  LoadingVC.swift
//  HoroscopeProject
//
//  Created by michelle on 2018/12/17.
//  Copyright © 2018年 michelle. All rights reserved.
//

import UIKit

class LoadingVC: UIViewController {

    @IBOutlet weak var coverImageView: UIImageView!

    var scrollView:UIScrollView!
    var pageControl:UIPageControl!
    var data = HoroscopeDataStore()
    var currentNumberPage = 0
    var timer:Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view. 
        setUpScrollView()
        let tap = UITapGestureRecognizer(target: self, action: #selector(gotoNextPage))
        self.view.addGestureRecognizer(tap)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let barAppearace = UIBarButtonItem.appearance()
        barAppearace.setBackButtonTitlePositionAdjustment(UIOffset(horizontal: 0, vertical: -60), for:UIBarMetrics.default)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if timer != nil{
            timer?.invalidate()
        }
        self.navigationController?.navigationBar.isHidden = false
    }
    
    
    private func setUpScrollView(){
        scrollView = UIScrollView(frame: CGRect(x: 0, y: self.view.frame.height * 0.3, width: self.view.frame.width, height: self.view.frame.height * 0.25))
        
        scrollView.backgroundColor = .clear
        self.view.addSubview(scrollView)
        
        scrollView.contentSize = CGSize(width: scrollView.frame.width * 12, height: scrollView.frame.height)
        scrollView.isUserInteractionEnabled = false
        scrollView.isScrollEnabled = true
    
        var imageView:UIImageView!
        
        for i in 0..<data.horoscopes.count{
            imageView = UIImageView(frame: CGRect(x: scrollView.frame.width * CGFloat(i), y: 0, width: scrollView.frame.width, height: scrollView.frame.height))
            imageView.contentMode = .scaleAspectFit
            imageView.alpha = 0.9
            let imageName = data.horoscopes[i].name
            imageView.image = UIImage(named: imageName!)
            self.scrollView.addSubview(imageView)
        }
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onAutoChangePageAction), userInfo: nil, repeats: true)
    }
    
    @objc func onAutoChangePageAction(){
        scrollView.setContentOffset(CGPoint(x: self.scrollView.frame.size.width * CGFloat(currentNumberPage), y: 0), animated: true)
        self.currentNumberPage += 1
        if self.currentNumberPage == data.horoscopes.count - 1{
            gotoNextPage()
        }
    }
    
    
    @objc func gotoNextPage(){
        let mainVC = self.storyboard?.instantiateViewController(withIdentifier: "MainVC") as? MainVC
        mainVC?.horoscopes = data.horoscopes
        self.navigationController?.pushViewController(mainVC!, animated: true)
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

