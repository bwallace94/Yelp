//
//  BusinessDetailViewController.swift
//  Yelp
//
//  Created by Bria Wallace on 4/10/17.
//  Copyright © 2017 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessDetailViewController: UIViewController {
    
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingImageView: UIImageView!
    @IBOutlet weak var reviewCountLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var categoriesLabel: UILabel!
    @IBOutlet weak var displayNumberLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var thumbImageView: UIImageView!
    
    
    var business: Business!
    
    
    func loadData() {
        if let snippet = business.snippetText{
            self.descriptionLabel.text = snippet
        }
        if business.distance != nil {
            distanceLabel.text = business.distance!
        }
        if business.displayPhone != nil {
            displayNumberLabel.text = business.displayPhone!
        }
        if business.categories != nil {
            categoriesLabel.text = business.categories!
        }
        if business.address != nil {
            addressLabel.text = business.address!
        }
        if business.name != nil {
            nameLabel.text = business.name!
        }
        if business.rating != nil {
            setRatingImage()
        }
        if business.reviewCount != nil {
            reviewCountLabel.text = "\(business.reviewCount!) Reviews"
        }
        if business.imageURL != nil {
            thumbImageView.setImageWith(business.imageURL!)
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "Nunito-Bold", size: 22)!]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
