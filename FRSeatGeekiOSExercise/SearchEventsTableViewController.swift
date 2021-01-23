//
//  SearchEventsViewController.swift
//  FRSeatGeekiOSExercise
//
//  Created by Brandon Baker on 1/23/21.
//

import UIKit

// MARK: SearchEventsViewController
class SearchEventsTableViewController: UITableViewController {
    
    private var searchController: SearchController {
        return SearchController(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.searchController = searchController
    }
    
}

// MARK: UISearchResultsUpdating
extension SearchEventsTableViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else {
            
            return
        }
        print(searchText)
    }
    
}

// MARK: TableViewDelegate & TableViewDataSource
extension SearchEventsTableViewController {
    
    
}
