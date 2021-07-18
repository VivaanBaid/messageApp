//
//  MyTableViewCell.swift
//  messagingAPP
//
//  Created by Vivaan Baid on 17/07/21.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cover_image: UIImageView!
    
    
    @IBOutlet weak var cover_name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
        
    }
    
    func setupUI(){
        cover_image.makeCircle()
        cover_image.image = UIImage(named: "Vivaan")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension UIImageView{
    func makeCircle(){
            self.layer.masksToBounds = false
            self.layer.borderColor = UIColor.black.cgColor
            self.layer.cornerRadius = self.frame.height / 2
            self.clipsToBounds = true
    }
}
