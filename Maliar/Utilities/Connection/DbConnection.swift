//
//  DbConnection.swift
//  FireBaseDummy
//
//  Created by Jackie Leonardy on 30/07/21.
//

import Foundation
import Firebase

class DbConnection {
    public static var shared = DbConnection()
    private var connection = Firestore.firestore()
    
    let data = [NewsCase]()
    @Published var dataSnapshot = [NewsCase]()
    
    let tableData = Firestore.firestore().collection("tableDatas")
    
    public func setUp(){
        
    }
    
    init() {
        
    }
    
    public func addData(animalName: String, district: String, link: String, newsTitle: String, numberOfAnimal: Int, province: String, subDistrict: String){
        
        tableData.document().setData(["id": tableData.document().documentID,"newsTitle":newsTitle, "animalName": animalName, "numberOfAnimal": numberOfAnimal, "province": province, "district": district, "subdistrict": subDistrict, "link": link, "createdAt" : FieldValue.serverTimestamp(), "isNotified": true]) { (error) in
            
            if let catchedError = error{
                print(catchedError)
            }
        }
    }
    
    /// Ini adalah fungsi yang digunakan untuk menghapus dokument
    /// - Parameter documentID: dokumenId didapatkan dari hasil query
    public func removeDocument(documentID: String){
        connection.collection("tableDatas").document(documentID).delete { (error) in
            if let catchedError = error{
                print(catchedError)
            }
        }
        
        tableData.document(documentID).delete { (error) in
            if let catchedError = error{
                print(catchedError)
            }
        }
        
        //deletingField
        connection.collection("tableDatas").document(documentID).updateData(["animalName": FieldValue.delete()]) { (error) in
            if let catchedError = error{
                print(catchedError)
            }
        }
        
       tableData.document(documentID).updateData(["animalName": FieldValue.delete()]) { (error) in
            if let catchedError = error{
                print(catchedError)
            }
        }
        
    }
    
    public func filterData(){
        tableData.whereField("district", isEqualTo: "TANGERANG")
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        print("\(document.documentID) => \(document.data())")
                    }
                }
            print("aa")
        }
        print("bb")
    }
    
    public func getAllData(limit: Int = 100){
        //getting Specific DocumentID
//        tableData.document("aa").getDocument { (document, error) in
//            if error == nil{
//                if let document = document, document.exists{
//                    let documentData = document.data()
//                }
//            }
//        }
        tableData.order(by: "createdAt", descending: true).limit(to: limit).getDocuments{ (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    let data = document.data()
                    print("\(data["animalName"] ?? "")")
                    print("\(data["createdAt"] ?? "")")
                    print()
                    print()
                }
            }
        }
    }
    
    public func fetchData(){
        tableData.addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No Document")
                return
            }
            
            self.dataSnapshot = documents.map({ (queryDocumentSnapShot) -> NewsCase in
                let mappedDocument = queryDocumentSnapShot.data()

                let animalName = mappedDocument["animalName"] as? String ?? ""
                let district = mappedDocument["district"] as? String ?? ""
                let link = mappedDocument["link"] as? String ?? ""
                let newsTitle = mappedDocument["newsTitle"] as? String ?? ""
                let numberOfAnimal = mappedDocument["numberOfAnimal"] as? String ?? ""
                let province = mappedDocument["province"] as? String ?? ""

                return NewsCase(animalName: animalName, district: district, link: link, newsTitle: newsTitle, numberOfAnimal: numberOfAnimal, province: province, newsTime: "", caseTime: "")
            })
            
            guard let snapshot = querySnapshot else {
                print("Error fetching snapshots: \(error!)")
                return
            }
            
            snapshot.documentChanges.forEach { diff in
                if (diff.type == .added) {
                    print("New city: \(diff.document.data())")
                }
                if (diff.type == .modified) {
                    print("Modified city: \(diff.document.data())")
                }
                if (diff.type == .removed) {
                    print("Removed city: \(diff.document.data())")
                }
            }
        }
    }
    
    /// Update data digunakan untuk menmperbaharui data pada dokumen terentu pada database FireStore
    /// - Parameter data: data berupa key dan value
    /// - Parameter documentId: id dari dokumen yang diselect dan akan diganti
    public func updateData(data: [String: String], documentId: String){
        tableData.document("ySlaEASk9VhqyDFZ6jLG").updateData(data) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
            }
        }
    }
}
