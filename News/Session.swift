//
//  Session.swift
//  News
//
//  Created by Francisco Rios on 7/03/23.
//

class Session {
    static let shared = Session() // Singleton instance
    
    var authToken: String?
    var userId: String?
    var userFullname: String?
    var userPicture: String?
    var userEmail: String?
    
    private init() { }
    
    func clear() {
        authToken = nil
        userId = nil
        userFullname = nil
        userPicture = nil
        userEmail = nil
    }
}
