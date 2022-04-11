//
//  Configurator.swift
//  
//
//  Created by Dmitry Rykov on 10.04.2022.
//

import Foundation

public class Configurator {
    
    public static let shared = Configurator()
    
    public func register() {
        ServiceLocator.shared.register(service: NewsServiceImpl() as NewsService)
    }
}
