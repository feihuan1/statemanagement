//
//  CatModel.swift
//  ImageGallery
//
//  Created by Feihuan Peng on 3/6/24.
//

import SwiftUI

struct CatModel: Identifiable {
    let id: String = UUID().uuidString
    var name: String
    let imageName: String
}

class CatViewModel: ObservableObject {
    @Published var catArray: [CatModel] = []
    @Published var errorCount: Int = 0
    
    init() {
        let data: [(String, String)] = [
            ("Lunalia", "1"),
            ("Ginger", "2"),
            ("Pepper", "3"),
            ("Hopeful", "4"),
            ("Feihuan", "5")
        ]
        for (name, imageName) in data {
            catArray.append(CatModel(name: name, imageName: imageName))
        }
    }
    
    func updateName(imageName: String, newName: String) {
        if let index = catArray.firstIndex(where: { $0.imageName == imageName }) {
            catArray[index].name = newName
        }
    }
    
    func errorPlus () {
        errorCount += 1
    }
    
    func resetError() {
        errorCount = 0
    }
    
}



