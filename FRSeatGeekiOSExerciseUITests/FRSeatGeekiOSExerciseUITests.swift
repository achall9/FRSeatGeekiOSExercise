//
//  FRSeatGeekiOSExerciseUITests.swift
//  FRSeatGeekiOSExerciseUITests
//
//  Created by Brandon Baker on 1/23/21.
//

import XCTest

class FRSeatGeekiOSExerciseUITests: XCTestCase {
    
    var app = XCUIApplication()
    
    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    /// To search an event UISearchBar should be used and it
    /// should be placed on the top of the UITableView
    func testSearchEvents() throws {
        let searchBar = app.searchFields.firstMatch
        let clearButton = searchBar.buttons["Clear text"]

        // searching a space should show at least one result
        searchBar.tap()
        searchBar.typeText(" ")
        XCTAssertTrue(app.cells.firstMatch.exists)

        // clearing should keep cells in the tableview
        clearButton.tap()
        XCTAssertTrue(app.cells.firstMatch.exists)

        // cancelling should keep cells in the tableview
        app.buttons["Cancel"].tap()
        XCTAssertTrue(app.cells.firstMatch.exists)

        // searching unique text should not show any results
        searchBar.tap()
        searchBar.typeText("$--unique_text--$")
        XCTAssertFalse(app.cells.firstMatch.exists)

        // pressing cancel should clear search and show
        // cells again
        app.buttons["Cancel"].tap()
        XCTAssertTrue(app.cells.firstMatch.exists)

        // tapping without typing should not clear any cells
        searchBar.tap()
        XCTAssertTrue(app.cells.firstMatch.exists)

        // cancelling empty search field should not clear any cells
        app.buttons["Cancel"].tap()
        XCTAssertTrue(app.cells.firstMatch.exists)
    }


    /// Tapping on Event UITableViewCell should display the corresponding event in a detail
    /// screen. Tapping on the back button should take user back to the events tableview.
    func testDetailNavigation() throws {

        // Show Detail View
        XCTAssertTrue(app.tables["SearchEventsTableViewController"].firstMatch.exists)
        app.cells.firstMatch.tap()
        XCTAssertFalse(app.tables["SearchEventsTableViewController"].firstMatch.exists)
        XCTAssertTrue(app.otherElements["EventDetailViewController"].firstMatch.exists)


        // Press back to return to tableView
        app.navigationBars.buttons.element(boundBy: 0).tap()
        XCTAssertFalse(app.otherElements["EventDetailViewController"].firstMatch.exists)
        XCTAssertTrue(app.tables["SearchEventsTableViewController"].firstMatch.exists)
    }
    
    /// User should be able to favorite events from the detail screen by hitting the favorite
    /// button. Favorited events should be displayed on the events tableview as shown below.
    /// A user should be able to unfavorite the event as well.
    func testFavoriteButton() throws {
        let solid = "solidHeart"
        let hollow = "hollowHeart"
        // Show Detail View
        app.cells.firstMatch.tap()
        XCTAssertTrue(app.otherElements["EventDetailViewController"].firstMatch.exists)

        let startHeart = app.buttons[solid].firstMatch.exists ? solid : hollow
        let oppositeHeart = startHeart == solid ? hollow : solid

        // Favorite then unfavorite or vice versa
        app.buttons[startHeart].tap()
        XCTAssertTrue(app.buttons[oppositeHeart].exists)
        app.buttons[oppositeHeart].tap()
        XCTAssertTrue(app.buttons[startHeart].exists)

        // Back to table view
        app.navigationBars.buttons.element(boundBy: 0).tap()

        // ensure the cell is the same as start
        XCTAssertTrue(app.cells.firstMatch.buttons[startHeart].exists)

        // Favorite/Unfavorite just once
        app.cells.firstMatch.tap()
        app.buttons[startHeart].tap()
        XCTAssertTrue(app.buttons[oppositeHeart].exists)

        // Back to table view
        app.navigationBars.buttons.element(boundBy: 0).tap()

        // ensure the cell has an opposite heart from what it started with
        XCTAssertTrue(app.cells.firstMatch.buttons[oppositeHeart].exists)

    }

    /// Even when searching or closing the application, a favorited event should remain
    /// favorited.
    func testFavoritePersistence() throws {
        
        let solid = "solidHeart"
        let hollow = "hollowHeart"
        
        // Show Detail View
        app.cells.firstMatch.tap()
        XCTAssertTrue(app.otherElements["EventDetailViewController"].firstMatch.exists)
        
        let startHeart = app.buttons[solid].firstMatch.exists ? solid : hollow
        let oppositeHeart = startHeart == solid ? hollow : solid
        
        // Favorite/Unfavorite just once
        app.buttons[startHeart].tap()
        XCTAssertTrue(app.buttons[oppositeHeart].exists)
        
        // Back to table view
        app.navigationBars.buttons.element(boundBy: 0).tap()
        // ensure the cell has an opposite heart from what it started with
        XCTAssertTrue(app.cells.firstMatch.buttons[oppositeHeart].exists)
        
        // build new application and relaunch app
        app = XCUIApplication()
        app.launch()
        
        // ensure the heart is the opposite from how it started in both the cell
        // and in the detail view controller
        XCTAssertTrue(app.cells.firstMatch.buttons[oppositeHeart].exists)
        app.cells.firstMatch.tap()
        XCTAssertTrue(app.buttons[oppositeHeart].exists)
        
    }
}


