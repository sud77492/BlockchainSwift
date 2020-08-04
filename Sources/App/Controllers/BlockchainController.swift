//
//  BlockchainController.swift
//  App
//
//  Created by Sudhanshu Sharma (HLB) on 02/08/2020.
//

import Foundation
import Vapor

class BlockchainController {
    
    private (set) var blockchainService : BlockchainService!
    
    init(){
        self.blockchainService = BlockchainService()
    }
    
    func getNodes(req: Request) -> [BlockchainNode] {
        return self.blockchainService.getNodes()
    }
    
    func registerNodes(res: Request, nodes: [BlockchainNode]) -> [BlockchainNode]{
        return self.blockchainService.registerNodes(nodes: nodes)
    }
    
    func mine(req: Request, transaction: Transaction) -> Block {
        self.blockchainService.getNextBlock(transactions:[transaction])
    }
    
    func getBlockchain(req: Request) -> Blockchain {
        return self.blockchainService.getBlockchain()
    }
    
    func greet(req : Request) -> Future<String> {
        
        Future.map(on: req) { () -> String in
            return "Welcome to Blockchain"
        }
        
    }
}
