//
//  PetRow.swift
//  VeterinaryClinic
//
//  Created by hiroshi on 2020/07/07.
//  Copyright © 2020 hiroshi. All rights reserved.
//

import SwiftUI

struct PetRow: View {
    var pet: Pet
    
    var body: some View {
        HStack {
            pet.image.frame(width: 60, height: 60)
            Text(pet.title)
        }
    }
}

struct PetRow_Previews: PreviewProvider {
    static var previews: some View {
        PetRow(pet: petData[0])
    }
}
