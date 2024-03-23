//
//  ContentView.swift
//  Photo Picker
//
//  Created by Алексей Никулин on 22.03.2024.
//

import SwiftUI
import UIKit

struct ContentView: View {
    @State private var isShowIcon = true
    @State private var isShowPhotoLibrary = false
    @State private var isShowCamera = false
    @State private var isConfirmDialog = false
    @State private var image = UIImage()
    var body: some View {
        VStack {
            Image(uiImage: self.image)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .onTapGesture {
                    self.isShowPhotoLibrary = true
                }
            VStack {
                RoundedRectangle(cornerRadius: 50)
                    .stroke(style: StrokeStyle())
                    .foregroundColor(.gray)
                    .frame(width: 100, height: 100)
                   
                
                    .overlay {
                        if isShowIcon == true {
                            RoundedRectangle(cornerRadius: 50)
                                .foregroundColor(.gray)
                                .frame(width: 100, height: 100)
                                .onTapGesture {
                                    isConfirmDialog = true
                                }
                        } else {
                           
                        }
                    }
            }
            
            Text("Hello, world!")
        }.sheet(isPresented: $isShowPhotoLibrary, content: {
            ImagePicker(selectedImage: self.$image, sourceType: .photoLibrary)
            
        })
        .sheet(isPresented: $isShowCamera, content: {
            ImagePicker(selectedImage: self.$image, sourceType: .camera)
        })
        .confirmationDialog("", isPresented: $isConfirmDialog, actions: {
            Button("Galery") {
                isShowPhotoLibrary = true
            }
            Button("Camera") {
                isShowCamera = true
            }
        })
        .padding()
    }
}

#Preview {
    ContentView()
}
