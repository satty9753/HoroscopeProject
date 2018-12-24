//
//  MainVC.swift
//  HoroscopeProject
//
//  Created by michelle on 2018/12/17.
//  Copyright © 2018年 michelle. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var zoomInPresentationDelegate:ZoomInPresentationManager?
    
    var horoscopes = [Horoscope]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        scrollViewDidScroll(tableView)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let backButton = UIBarButtonItem(title: "", style: .plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton
        navigationItem.title = "Horoscopes"
        
    }

}

//MARK: - UITableViewDelegate, UITableViewDataSource Method
extension MainVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return horoscopes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ParallaxCell", for: indexPath) as? ParallaxCell
        let imageName = horoscopes[indexPath.row].squareImageName
        let name = horoscopes[indexPath.row].name
        cell?.cellImageView.image = UIImage(named: imageName!)
        cell?.titleLabel.text = name
        return cell!
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height * 0.2
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let descriptionVC = self.storyboard?.instantiateViewController(withIdentifier: "DescriptionVC") as? DescriptionVC
        descriptionVC?.horoscope = horoscopes[indexPath.row]
    
        let cell = tableView.cellForRow(at: indexPath) as? ParallaxCell
        
        //get image frame in NEXT page
        let navigationBarheight = self.navigationController?.navigationBar.frame.height ?? 0
        let statusbarHeight = UIApplication.shared.statusBarFrame.height
        let nextVCImageViewFrame = CGRect(x: 0, y: navigationBarheight + statusbarHeight, width: self.view.frame.width, height: self.view.frame.height*0.3)
        
        //get image frame related to screen in THIS page
        let rect = self.tableView.rectForRow(at: indexPath)
        let rectInScreen = self.tableView.convert(rect, to: tableView.superview)
        
        //transition animation
        zoomInPresentationDelegate = ZoomInPresentationManager(toFrame: nextVCImageViewFrame, fromFrame: rectInScreen, image: (cell!.cellImageView?.image)!)
        self.navigationController?.delegate = zoomInPresentationDelegate

        self.navigationController?.pushViewController(descriptionVC!, animated: true)
    }
    
}

//MARK: - UIScrollViewDelegate Method
extension MainVC: UIScrollViewDelegate{
    
    //MARK: - For Parallax Effect
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        for cell in tableView.visibleCells{
            if let imageCell = cell as? ParallaxCell{
                imageCell.changeImagePosition(tableView: tableView, didscrollView: view)
            }
        }
    }
}

