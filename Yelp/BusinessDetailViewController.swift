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
    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var thumbImageView: UIImageView!
    
    
    var business: Business! {
        didSet {
            print(business.snippetText ?? "NO TEXT")
            if business.snippetText != nil {
                descriptionLabel.text = business.snippetText!
            }
            if business.distance != nil {
                distanceLabel.text = business.distance!
            }
            if business.url != nil {
                urlLabel.text = business.url!
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
            if business.ratingImageURL != nil {
                ratingImageView.setImageWith(business.ratingImageURL!)
            }
            if business.reviewCount != nil {
                reviewCountLabel.text = "\(business.reviewCount!)"
            }
            if business.imageURL != nil {
                thumbImageView.setImageWith(business.imageURL!)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
