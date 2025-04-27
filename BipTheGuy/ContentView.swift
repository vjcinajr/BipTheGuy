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
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Image("clown")
                .resizable()
                .scaledToFit()
                .onTapGesture {
                playSound(soundName: "punchSound")
            }
            
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
