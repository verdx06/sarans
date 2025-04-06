//
//  SpeechView.swift
//  RepeatAgain
//
//  Created by Виталий Багаутдинов on 06.04.2025.
//

import SwiftUI
import Speech

class SpeechRec: ObservableObject {
    @Published private(set) var recognizedText = ""
    @Published private(set) var isRunning = false
    
    let speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "en_US"))
    var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    var recognitionTask: SFSpeechRecognitionTask?
    let audioEngine = AVAudioEngine()
    
    func start() {
        
        
        
        SFSpeechRecognizer.requestAuthorization { status in
            DispatchQueue.main.async {
                self.startRecognition()
            }
        }
    }
    
    func startRecognition() {
        recognizedText = ""
        do {
            recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
            guard let recognitionRequest = recognitionRequest else { return }
            
            
            recognitionTask = speechRecognizer?.recognitionTask(with: recognitionRequest) { result, error in
                if let result = result {
                    let newText = result.bestTranscription.formattedString
                    self.recognizedText = newText

                    
                }
            }
            
            let recordingFormat = audioEngine.inputNode.outputFormat(forBus: 0)
            audioEngine.inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { buffer, _ in
                recognitionRequest.append(buffer)
            }
            
            audioEngine.prepare()
            try audioEngine.start()
            
            self.isRunning = true
        } catch {
            print("Error starting recognition: \(error.localizedDescription)")
        }
    }
    
    func stop() {
        audioEngine.inputNode.removeTap(onBus: 0)
        audioEngine.stop()
        recognitionRequest?.endAudio()
        recognitionTask?.cancel()
        self.isRunning = false
    }
}

struct SpeechView: View {
    @ObservedObject var speechRec = SpeechRec()
    var body: some View {
        VStack {
            Text(speechRec.recognizedText)
                .font(.largeTitle)
                .padding()
            
            Button(action: {
                if self.speechRec.isRunning {
                    self.speechRec.stop()
                } else {
                    self.speechRec.start()
                }
            }) {
                Text(self.speechRec.isRunning ? "Stop" : "Start")
                    .font(.title)
                    .padding()
            }
        }
    }
}

#Preview {
    SpeechView()
}
