//
//  CustomTableViewCell.swift
//  SampleTableView
//
//  Created by Vijay Vikram Singh on 04/10/20.
//  Copyright © 2020 Vijay Vikram Singh. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userId: UILabel!
    @IBOutlet weak var userTime: UILabel!
    @IBOutlet weak var userCommentView: UIView!
    @IBOutlet weak var userCommentLabel: UILabel!
    var imageName = ["1","2","3","4"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateUserInfo() {
       
        userImage.image = UIImage(named: imageName.randomElement()!)
//        nameLabel.text = (userData.firstName ?? "") + " " + (userData.lastName ?? "")
//        commentLabel.text = userData.message
//
//        userNameLabel.text = "@" + (userData.firstName ?? "").lowercased() + "_" + (userData.lastName ?? "").lowercased()
//        timeLabel.text = imageName.randomElement()! + "m"
    }
}
