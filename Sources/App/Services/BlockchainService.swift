//
//  BlockchainService.swift
//  App
//
//  Created by Sudhanshu Sharma (HLB) on 02/08/2020.
//

import Foundation

class BlockchainService {
    
    private (set) var blockchain : Blockchain!
    
    init(){
        self.blockchain = Blockchain(genesisBlock: Block())
    }
    
    func getNodes() -> [BlockchainNode]{
        return self.blockchain.nodes
    }
    
    func registerNodes(nodes: [BlockchainNode]) -> [BlockchainNode] {
        return self.blockchain.registerNodes(nodes: nodes)
    }
    
    func getNextBlock(transactions: [Transaction]) -> Block {
        let block = self.blockchain.getNextBlock(transactions: transactions)
        self.blockchain.addBlock(block)
        return block
    }
    
    func getBlockchain() -> Blockchain {
        return self.blockchain
    }
    
}
