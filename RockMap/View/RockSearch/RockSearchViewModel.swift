//
//  RockSearchViewModel.swift
//  RockMap
//
//  Created by TOUYA KAWANO on 2021/01/18.
//

import Foundation

class RockSearchViewModel {
    
    @Published private(set) var rockDocuments: [FIDocument.Rocks] = []
    @Published private(set) var error: Error?
    
    init() {
        fetchRockList()
    }
    
    func fetchRockList() {
        FirestoreManager.fetchCollection { [weak self] (result: Result<[FIDocument.Rocks], Error>) in
            
            guard let self = self else { return }
            
            switch result {
            case .success(let documents):
                self.rockDocuments = documents
                
            case .failure(let error):
                self.error = error
                
            }
        }
    }
}
