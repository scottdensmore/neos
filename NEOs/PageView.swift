//
//  PageView.swift
//  NEOs
//
//  Created by Scott Densmore on 11/25/22.
//

import SwiftUI

struct PageView: View {
    let items: [String] = ["1", "2", "3", "4", "5"]
    var body : some View {
        GeometryReader { geometry in
            ScrollView(.horizontal) {
                HStack {
                    ForEach(self.items, id: \.self) { row in
                        Text(row)
                            .padding(geometry.size.width / 5)
                            .background(Color.green)
                    }
                }
            }.background(Color.white)

        }
        .padding()
        .background(Color.red)
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView()
    }
}
