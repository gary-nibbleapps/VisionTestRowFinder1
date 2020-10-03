//
//  Classifier.swift
//  VisionTest2
//
//  Created by gary on 03/10/2020.
//

import Foundation


/// Classifier.
///
/// Wrap up the KMeans and Clusters
struct Classifier {
    private let convergeDistance = 0.001
    private let kMeans: KMeans<Clusters.Label>
    private let clusters: Clusters


    init(vectors: [Vector]) {
        self.kMeans = KMeans(labels: Clusters.labels)
        self.kMeans.trainCenters(vectors, convergeDistance: convergeDistance)
        self.clusters = Clusters(kMeans: kMeans)
    }


    func isNewRow(_ vector: Vector) -> Bool {
        let label = kMeans.fit(vector)
        return clusters.isNewRow(label)
    }
}
