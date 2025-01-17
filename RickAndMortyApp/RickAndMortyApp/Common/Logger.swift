//
//  Logger.swift
//  RickAndMortyApp
//
//  Created by Cristian Peña Barrios on 26/12/24.
//

import Foundation
import os

struct LogManager {
    
    static let logger = Logger(subsystem: "com.RickAndMortyApp", category: "General")

    static func log(
        _ message: String,
        type: CustomLogType = .info,
        file: String = #file,
        function: String = #function
    ) {
        let timestamp = DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .medium)
        let filename = (file as NSString).lastPathComponent
        let formattedMessage = "[\(timestamp)] [\(type.rawValue.uppercased())] [\(filename) -> \(function)] - \(message)"
        
        
    }
    
    static func log(
        _ message: String,
        type: CustomLogType = .network,
        from file: String,
        and function: String
    ) {
        let timestamp = DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .medium)
        let filename = (file as NSString).lastPathComponent
        let formattedMessage = "[\(timestamp)] [\(type.rawValue.uppercased())] [\(filename) -> \(function)] - \(message)"
        
        show(the: formattedMessage, type: type.osLogType)
    }
    
    static func show(the message: String, type: OSLogType){
        logger.log(level: type, "\(message)")
    }
}

enum CustomLogType: String {
    case info
    case debug
    case warning
    case error
    case fault
    case network
    case database
    case view

    // Mapear a OSLogType
    var osLogType: OSLogType {
        switch self {
        case .info, .network, .view:
            return .info
        case .debug:
            return .debug
        case .warning:
            return .default // Usar default para warnings
        case .error, .database:
            return .error
        case .fault:
            return .fault
        }
    }
}
