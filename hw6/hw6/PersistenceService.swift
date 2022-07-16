//
//  PersistenceService.swift
//  hw6
//
//  Created by Dmitry Rykov on 16.07.2022.
//

import Foundation
import Combine
import CoreData

class PersistenceService {
    
    static let shared = PersistenceService()
    
    private let context: NSManagedObjectContext
    
    init() {
        let container = NSPersistentContainer(name: "hw6")
        container.loadPersistentStores(completionHandler: { desc, error in
            if let error = error {
                print("Can't init db \(error)")
            }
        })
        context = container.viewContext
    }
    
    func loadArticles() -> Future<[NewsArticle], Error> {
        Future { [weak self] promise in
            do {
                let fetchRequest = CoreArticle.fetchRequest()
                fetchRequest.sortDescriptors = [NSSortDescriptor(key: "order", ascending: true)]
                let articles = try self?.context.fetch(fetchRequest)
                promise(.success(articles?.map { article in
                    NewsArticle(id: article.id ?? UUID().uuidString, title: article.title, author: article.author)
                } ?? []))
            } catch {
                promise(.failure(error))
            }
        }
    }
    
    func saveArticles(articles: [NewsArticle]) {
        do {
            try context.execute(NSBatchDeleteRequest(fetchRequest: CoreArticle.fetchRequest()))
            for (order, article) in articles.enumerated() {
                let coreArticle = CoreArticle(context: context)
                coreArticle.order = Int64(order)
                coreArticle.id = article.id
                coreArticle.title = article.title
                coreArticle.author = article.author
            }
            try context.save()
        } catch {
            print("Can't save articles \(error)")
        }
    }
}
