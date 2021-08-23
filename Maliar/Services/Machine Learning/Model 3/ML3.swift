//
//  ML3.swift
//  Maliar
//
//  Created by Nicholas on 23/08/21.
//

import Foundation
import NaturalLanguage

struct ML3Helper {
    static func getNewsPrediction(input: String) -> String {
        do {
            let newsDetect = try NLModel(mlModel: MaliarML3().model)
            guard let prediction = newsDetect
                    .predictedLabel(for: input)
            else { return "Gagal hasil" }
            return prediction
        } catch {
            return "Failed to load ML Model"
        }
    }
}
