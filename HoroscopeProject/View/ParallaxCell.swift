//
//  ParallexCell.swift
//  HoroscopeProject
//
//  Created by michelle on 2018/12/17.
//  Copyright © 2018年 michelle. All rights reserved.
//

import UIKit

class ParallaxCell: UITableViewCell{

    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var parallaxPosition:CGRect!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func changeImagePosition(tableView:UITableView, didscrollView view:UIView){
//        //convert coordinate to view
//        let rectInSuperView = tableView.convert(self.frame, to: view)
//
//        //the distance between cellCenter to superviewCenter
//        let distanceFromCenter = view.frame.height / 2 - rectInSuperView.midY
//
//        //the distance between imageView and cell height
//        let parallaxHeight = cellImageView.frame.height - self.frame.height
//
//        let move = (distanceFromCenter/self.frame.height) * parallaxHeight
//
//        var imageRect = cellImageView.frame
//
//        imageRect.origin.y = -parallaxHeight/2 + move
//
//        cellImageView.frame = imageRect
    
        let parallaxHeight = cellImageView.frame.height - self.frame.height

        var maxScrollDistance: CGFloat!

        if tableView.contentSize.height > tableView.frame.height{
             maxScrollDistance = tableView.contentSize.height - tableView.frame.height
        }else{
             maxScrollDistance = tableView.contentSize.height
        }

        let move = (tableView.contentOffset.y / maxScrollDistance) * parallaxHeight

        var imageRect = cellImageView.frame

        imageRect.origin.y = -parallaxHeight + move

        cellImageView.frame = imageRect
        
    }

}
