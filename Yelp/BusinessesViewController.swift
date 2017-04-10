//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Timothy Lee on 4/23/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, FiltersViewControllerDelegate {
    
    var businesses: [Business]!
    var filteredBusinsses: [Business]!
    var searchController: UISearchController!
    
    @IBOutlet weak var filterButton: UIBarButtonItem!
    @IBOutlet weak var mapButton: UIBarButtonItem!
    @IBOutlet weak var businessTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if searchController.isActive && searchController.searchBar.text != "" {
            return filteredBusinsses!.count
        }
        if businesses != nil {
            return businesses!.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = businessTableView.dequeueReusableCell(withIdentifier: "BusinessCell", for: indexPath) as! BusinessCell
        if searchController.isActive && searchController.searchBar.text != "" {
            cell.business = filteredBusinsses[indexPath.section]
        } else {
            cell.business = businesses[indexPath.section]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 5, y: 5, width: 30, height: 30))
        let backgroundColor = UIColor.init(colorLiteralRed: 253/255.0, green: 207/255.0, blue: 9/255.0, alpha: 1)
        headerView.backgroundColor = backgroundColor
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 2.0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if sender is UIBarButtonItem {
            let navigationController = segue.destination as! UINavigationController
            let filtersViewController = navigationController.topViewController as! FiltersViewController
            filtersViewController.delegate = self
        } else {
            let vc = segue.destination as! BusinessDetailViewController
            let indexPath = businessTableView.indexPath(for: sender as! BusinessCell)!
            var business = businesses[indexPath.section]
            if searchController.isActive && searchController.searchBar.text != "" {
                business = filteredBusinsses[indexPath.section]
            }
            vc.business = business
        }
        
    }

    
    func filterViewConroller(filtersViewController: FiltersViewController, didUpdateFilters filters: [String : Any]) {
        let categories = filters["categories"] as? [String]
        let sort = filters["sort"] as? YelpSortMode
        let deal = filters["deal"] as? Bool
        let distance = filters["distance"] as? String
        
        Business.searchWithTerm(term: "Restaurants", sort: sort, categories: categories, distance: distance, deals: deal) { (businesses: [Business]!, error: Error!) -> Void in
            self.businesses = businesses
            self.businessTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapButton.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "Nunito-Bold", size: 18)!], for: UIControlState())
        filterButton.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "Nunito-Bold", size: 18)!], for: UIControlState())
        businessTableView.delegate = self
        businessTableView.dataSource = self
        businessTableView.rowHeight = UITableViewAutomaticDimension
        businessTableView.estimatedRowHeight = 135
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Business Names"
        searchController.hidesNavigationBarDuringPresentation = false
        navigationItem.titleView = searchController.searchBar
        Business.searchWithTerm(term: "Restaurants", completion: { (businesses: [Business]?, error: Error?) -> Void in
            
            self.businesses = businesses
            self.businessTableView.reloadData()
            if let businesses = businesses {
                for business in businesses {
                    print(business.name!)
                    print(business.address!)
                }
            }
            }
        )
        
        /* Example of Yelp search with more search options specified
         Business.searchWithTerm("Restaurants", sort: .Distance, categories: ["asianfusion", "burgers"], deals: true) { (businesses: [Business]!, error: NSError!) -> Void in
         self.businesses = businesses
         
         for business in businesses {
         print(business.name!)
         print(business.address!)
         }
         }
         */
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    func filterContentForSearchText(_ searchText: String) {
        self.filteredBusinsses = self.businesses.filter({(business) -> Bool in
            let businessName = business.name!
            return businessName.lowercased().contains(searchText.lowercased())
        })
        businessTableView.reloadData()
    }
    
}

extension BusinessesViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentForSearchText(searchBar.text!)
    }
}

extension BusinessesViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}
