//
//  SearchEventsViewController.swift
//  FRSeatGeekiOSExercise
//
//  Created by Brandon Baker on 1/23/21.
//

import UIKit

// MARK: SearchEventsViewController
class SearchEventsTableViewController: UITableViewController {
    
    var allEvents: [Event] = []
    var events: [Event] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.accessibilityIdentifier = "SearchEventsTableViewController"
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .primaryBackground
        navigationItem.searchController = SearchController(delegate: self)
        
        SeatGeekAPIManager.queryEvents { events in
            guard let events = events else {
                print("unable to load events in SearchEventsTableViewController")
                return
            }
            self.allEvents = events
            self.events = events
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }
    
}

// MARK: UISearchResultsUpdating
extension SearchEventsTableViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        defer { tableView.reloadData() }
        guard let searchText = searchController.searchBar.text, !searchText.isEmpty else {
            events = allEvents
            return
        }
        events = allEvents.filter { $0.allText.contains(searchText) }
    }
    
}

// MARK: TableViewDelegate & TableViewDataSource
extension SearchEventsTableViewController {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return EventTableViewCell(events[indexPath.row])
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailViewController = EventDetailViewController()
        detailViewController.event = events[indexPath.row]
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Theme.cardHeight
    }
    
    override func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? EventTableViewCell {
            cell.setSelected(true, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? EventTableViewCell {
            cell.setSelected(false, animated: true)
        }
    }
    
}
