//
//  FavoriteManager.swift
//  FRSeatGeekiOSExercise
//
//  Created by Brandon Baker on 1/24/21.
//

import UIKit


protocol FavoriteObserver {
    var uuid: String { get }
    func favoriteStatusDidChange(_ isFavorite: Bool)
}

class FavoriteManager {
    
    private static let instance = FavoriteManager()
    
    private var observers = [String: [FavoriteObserver]]()
    
    private var favoriteEvents: [String] {
        get { return UserDefaults().stringArray(forKey: "favoriteEvents") ?? [] }
        set { UserDefaults().set(newValue, forKey: "favoriteEvents") }
    }
    
    private func addEvent(_ id: String) {
        if !favoriteEvents.contains(id) {
            favoriteEvents.append(id)
        }
        notify(id)
    }
    
    private func removeEvent(_ id: String) {
        if let index = favoriteEvents.firstIndex(of: id) {
            favoriteEvents.remove(at: index)
        }
        notify(id)
    }
    
    private func isFavorite(_ id: String) -> Bool {
        return favoriteEvents.contains(id)
    }
    
    private func notify(_ id: String) {
        guard let observers = observers[id] else { return }
        for observer in observers {
            observer.favoriteStatusDidChange(isFavorite(id))
        }
    }
    
    private func subscribe(_ id: String,_ observer: FavoriteObserver) {
        var currentObservers = observers[id] ?? []
        currentObservers.append(observer)
        observers[id] = currentObservers
    }
    
    private func unsubscribe(_ id: String,_ observer: FavoriteObserver) {
        guard let observers = self.observers[id],
              let observerIndex = observers.firstIndex(where: {$0.uuid == observer.uuid }) else { return }
        var currentObservers = self.observers[id] ?? []
        currentObservers.remove(at: observerIndex)
        self.observers[id] = currentObservers
    }
    
}


// MARK: Public Interface
extension FavoriteManager {
    
    public static func pressedFavorite(for id: String) {
        if isFavorite(id) {
            instance.removeEvent(id)
        } else {
            instance.addEvent(id)
        }
        HapticManager.success()
    }
    
    public static func isFavorite(_ id: String) -> Bool {
        return instance.isFavorite(id)
    }
    
    public static func subscribe(_ id: String,_ observer: FavoriteObserver) {
        instance.subscribe(id, observer)
    }
    
    public static func unsubscribe(_ id: String,_ observer: FavoriteObserver) {
        instance.unsubscribe(id, observer)
    }
    
}
