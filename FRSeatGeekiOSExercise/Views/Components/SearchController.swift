//
//  SearchControllerViewController.swift
//  FRSeatGeekiOSExercise
//
//  Created by Brandon Baker on 1/23/21.
//

import UIKit

// MARK: SearchController
class SearchController: UISearchController {
    
    init(delegate: SearchEventsTableViewController) {
        super.init(searchResultsController: nil)
        searchResultsUpdater = delegate
        obscuresBackgroundDuringPresentation = false
        hidesNavigationBarDuringPresentation = false
        definesPresentationContext = true
        searchBar.placeholder = "Search Events"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
