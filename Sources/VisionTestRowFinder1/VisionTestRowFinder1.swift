//
//  RowFinder1.swift
//  VisionTest2
//
//  Created by gary on 03/10/2020.
//

import Foundation

public struct VisionTestRowFinder1: RowFinder {
    private typealias PairAndVector = (r1: Item, r2: Item, v: Vector)


    public init() {}


    public func rows(from results: [Item]) -> [[Item]] {
        let pairsAndVectors = makePairsAndVectors(results: results)
        let classifier = Classifier(vectors: pairsAndVectors.map({ $0.v }))

        var result: [[Item]] = []
        var currentRow: [Item] = [results.first!]
        for (_, r2, v) in pairsAndVectors {
            if classifier.isNewRow(v) {
                result.append(currentRow)
                currentRow = [r2]
            } else {
                currentRow.append(r2)
            }
        }
        result.append(currentRow)
        return result
    }
}


private extension VisionTestRowFinder1 {
    private func makePairsAndVectors(results: [Item]) -> [PairAndVector] {
        var result: [PairAndVector] = []
        for (r1, r2) in zip(results, results[1...]) {
            let v = Vector(item1: r1, item2: r2)
            result.append((r1, r2, v))
        }
        return result
    }
}


// MARK: - Private

private extension Vector {
    init(item1: Item, item2: Item) {
        let dy = abs(item1.bottomY - item2.bottomY)
        self.x = 0
        self.y = Double(dy)
    }
}
