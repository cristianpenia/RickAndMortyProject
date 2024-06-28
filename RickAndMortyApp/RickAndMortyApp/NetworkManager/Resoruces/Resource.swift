//
//  Resource.swift
//  RickAndMortyApp
//
//  Created by Cristian Peña Barrios on 27/06/24.
//

import Foundation
import Alamofire

public protocol Resource {
    
    var resource: (method: HTTPMethod, route: String) { get }
}
