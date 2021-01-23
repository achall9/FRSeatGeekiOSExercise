//
//  SearchControllerViewController.swift
//  FRSeatGeekiOSExercise
//
//  Created by Brandon Baker on 1/23/21.
//

import UIKit

// MARK: SearchController
class SearchController: UISearchController {
    private lazy var customSearchBar = SearchBar()
    override var searchBar: UISearchBar { customSearchBar }
    
    init(_ delegate: UISearchResultsUpdating) {
        super.init(searchResultsController: nil)
        self.obscuresBackgroundDuringPresentation = false
        self.hidesNavigationBarDuringPresentation = false
        self.definesPresentationContext = true
        self.searchResultsUpdater = delegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

}

// MARK: SearchBar
class SearchBar: UISearchBar {
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
