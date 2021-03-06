//
//  FakeMessageRepository.swift
//  Example
//
//  Created by Luciano Polit on 6/12/16.
//  Copyright © 2016 Luciano Polit. All rights reserved.
//

import RepositoryKit

class MessageRepository: CRUDNetworkingRepository, PatchableRepository {
    
    // It is the entity that the repository operates.
    typealias Entity = Message
    
    // It will make the requests.
    var store: Networking
    
    // The path that represents the repository.
    var path: String = "messages"
    
    // Initialize it with a networking store.
    init(store: Networking) {
        self.store = store
    }
    
}
