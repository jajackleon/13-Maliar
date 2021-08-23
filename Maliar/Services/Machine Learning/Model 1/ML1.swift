//
//  ML1.swift
//  Maliar
//
//  Created by Nicholas on 23/08/21.
//

import Foundation
import NaturalLanguage
import CoreML

struct ML1Helper {
    
    static func getTagger(input: String, newsTitle: String, newsLink: String) -> [String: [String]] {
        var wordTaggerList : [String: [String]] = [
            "ORG": [],
            "PER": [],
            "DIST": [],
            "NOA": [],
            "AN": [],
            "PROV": [],
            "CTIME": []
        ]
        
        let text = "Tersangka JN dituduh sebagai pembunuh gajah Sumatera di Desa Jambo Reuhat, Kecamatan Banda Alam, Kabupaten Aceh Timur, Aceh, Minggu 11 Juli 2021. Gajah Sumatera itu ditemukan mati dengan kepala hilang. Empat mpat tersangka lainnya ditangkap atas dugaan memperdagangkan gading gajah S yang dibunuh itu. Kapolres Aceh Timur, AKBP Eko Widiantoro, memaparkan, pengungkapan kasus pembunuhan gajah dan perdagangan satwa dilindungi berawal saat polisi menangkap tersangka JN di Desa Beururu, Kecamatan Peudada, Kabupaten Bireuen, Aceh, pada 10 Agustus 2021. “Kemudian, dari keterangan JN bahwa benar mereka dengan rekannya IS (buron) yang melakukan eksekusi terhadap gajah itu,” kata Eko, Kamis (19/8). Berdasarkan keterangan JN, dirinya telah melakukan perburuan satwa yang dilindungi dengan cara meracuni sebanyak lima kali sejak tahun 2017. JN melakukannya bersama IS yang saat ini masih buron.s"

        do {
            let mlModel = try Model1(configuration: MLModelConfiguration()).model

            let customModel = try NLModel(mlModel: mlModel)
            let customTagScheme = NLTagScheme("NumberOfAnimal")
            
            let tagger = NLTagger(tagSchemes: [customTagScheme])
            
            tagger.string = text
            tagger.setModels([customModel], forTagScheme: customTagScheme)
            
            tagger.enumerateTags(in: text.startIndex..<text.endIndex, unit: .word,
                                 scheme: customTagScheme, options: .omitWhitespace) { tag, tokenRange  in
                if let tag = tag {
                    if tag.rawValue != "NONE"{
                        wordTaggerList["\(tag.rawValue)"]?.append(String(text[tokenRange]))
                    }
                }
                return true
            }
            
            //Masukkin ke Database
            APIRequest.addNewsCase(animalName: wordTaggerList["AN"]?.joined(separator: ", ") ?? "", numberOfAnimal: wordTaggerList["NOA"]?.joined(separator: ",") ?? "", province: wordTaggerList["PROV"]?.joined(separator: ", ") ?? "", newsTitle: newsTitle, link: newsLink, district: wordTaggerList["DIST"]?.joined(separator: ", ") ?? "") { (Data) in
                
            }
            
            return wordTaggerList
        } catch {
            return wordTaggerList
        }

    }
}

