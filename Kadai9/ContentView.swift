//
//  ContentView.swift
//  Kadai9
//

import SwiftUI

struct ContentView: View {
    @State private var selectedPrefecture: String = "未選択"
    @State private var isShowInputView: Bool = false
    var body: some View {
        NavigationView {
            HStack(spacing: 50) {
                Text("都道府県")
                Text("\(selectedPrefecture)")
                Button("入力") {
                    isShowInputView = true
                }
                .fullScreenCover(isPresented: $isShowInputView) {
                    SelectView(inputPrefecture: $selectedPrefecture, isActive: $isShowInputView)
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
    }
}

struct SelectView: View {
    @Binding var inputPrefecture: String
    @Binding var isActive: Bool
    private let prefectureList: [String] = ["東京都", "神奈川県", "埼玉県", "千葉県"]

    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 20) {
                ForEach(prefectureList, id: \.self) { prefecture in
                    Button("\(prefecture)") {
                        inputPrefecture = prefecture
                        isActive = false
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        isActive = false
                    }
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
