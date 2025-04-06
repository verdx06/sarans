//
//  AnimalsView.swift
//  RepeatAgain
//
//  Created by Виталий Багаутдинов on 06.04.2025.
//

import SwiftUI

class AnimalsViewModel: ObservableObject {
    
    @Published var currentAnimal: AnimalPair?
    @Published var animals: [AnimalPair] = [
        .init(url: "https://cdnn21.img.ria.ru/images/07e5/06/18/1738448523_0:0:864:962_1440x900_80_1_1_ff6c8caca15ec7cb0f300c64e9c189fb.jpg?source-sid=rian_photo", text: "Cat"),
        .init(url: "https://storage.yandexcloud.net/yac-wh-sb-prod-s3-media-03002/uploads/article/479/986f7b060354304438c245f8f3eed143.webp", text: "Dog"),
        .init(url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrC4I5-qDCit81ONtrdVDTF7MJnbvuatM7gA&s", text: "Nosorog"),
    ]
    
    func startGame() {
        currentAnimal = animals.removeFirst()
    }
    
    func check(text: String) -> Bool {
        if text == currentAnimal?.text {
            return true
        } else {
            return false
        }
    }
    
}
