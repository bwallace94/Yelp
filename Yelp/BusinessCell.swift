//
//  BusinessCell.swift
//  Yelp
//
//  Created by Bria Wallace on 4/5/17.
//  Copyright © 2017 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessCell: UITableViewCell {

    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var ratingImageView: UIImageView!
    @IBOutlet weak var reviewsCountLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var categoriesLabel: UILabel!
    
    var business: Business! {
        didSet {
            thumbImageView.setImageWith(business.imageURL!)
            nameLabel.text = business.name
            distanceLabel.text = business.distance
            reviewsCountLabel.text = "\(business.reviewCount!) Reviews"
            addressLabel.text = business.address
            categoriesLabel.text = business.categories
            setRatingImage()
            //ratingImageView.setImageWith(business.ratingImageURL!)
            
        }
    }
    
    func setRatingImage() {
        if business.rating == 0.5 {
            ratingImageView.image = #imageLiteral(resourceName: "half-star")
        } else if business.rating == 1.0 {
            ratingImageView.image = #imageLiteral(resourceName: "one-star")
        } else if business.rating == 1.5 {
            ratingImageView.image = #imageLiteral(resourceName: "one-half-star")
        } else if business.rating == 2.0 {
            ratingImageView.image = #imageLiteral(resourceName: "two-star")
        } else if business.rating == 2.5 {
            ratingImageView.image = #imageLiteral(resourceName: "two-half-star")
        } else if business.rating == 3.0 {
            ratingImageView.image = #imageLiteral(resourceName: "three-star")
        } else if business.rating == 3.5 {
            ratingImageView.image = #imageLiteral(resourceName: "three-half-star")
        } else if business.rating == 4.0 {
            ratingImageView.image = #imageLiteral(resourceName: "four-star")
        } else if business.rating == 4.5 {
            ratingImageView.image = #imageLiteral(resourceName: "four-half-star")
        } else if business.rating == 5.0 {
            ratingImageView.image = #imageLiteral(resourceName: "five-star")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        thumbImageView.layer.cornerRadius = 3
        thumbImageView.clipsToBounds = true
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
