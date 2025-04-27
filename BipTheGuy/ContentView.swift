//
//  ContentView.swift
//  BipTheGuy
//
//  Created by VINCENT CINA on 4/27/25.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    
    @State private var audioPlayer: AVAudioPlayer!
    @State private var isFullSize = true
    
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Image("clown")
                .resizable()
                .scaledToFit()
                .scaleEffect(isFullSize ? 1.0 : 0.9)
                .onTapGesture {
                    playSound(soundName: "punchSound")
                    isFullSize = false
//                    scale = scale + 0.1 // increase image size by 10%
                    withAnimation (.spring(response: 0.3, dampingFraction: 0.3)) {
                        isFullSize = true // will go from 90% to 100% size using the .spring animation
                    }
                }
//                .animation(.spring(response: 0.3, dampingFraction: 0.3), value: scale)
            
            
            Spacer()
            
            Button {
                //TODO: Button Action here
            } label: {
                Label("Photo Library", systemImage: "photo.fill.on.rectangle.fill")
            }
            
        }
        .padding()
    }
    
    func playSound(soundName: String) {
        // play the sound
        if audioPlayer != nil && audioPlayer.isPlaying {
            audioPlayer.stop()
        }
        guard let soundFile = NSDataAsset(name: soundName) else {
            print("😡 Could not read file named \(soundName)")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        } catch {
            print("😡 ERROR: \(error.localizedDescription) creating audioPlayer.")
        }
    }
}

#Preview {
    ContentView()
}
