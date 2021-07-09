//
//  Places.swift
//  In-Place
//
//  Created by Иван Карамазов on 30.05.2021.
//

import Foundation

struct Places: Codable {
    var placeName: String
    var placeDescription: String
    var placeImages: [String]
    var city: String
    var liked: Bool
    var bookings: Bookings
   

}

struct Bookings: Codable {
    var userAvatars: [String]
    var numberOfBookings: Int
}
