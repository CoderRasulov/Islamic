import UIKit
import AVFoundation

var audioPlayer = AVAudioPlayer()

class TasbehController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var label33: UILabel!
    
    var sound = true

    @IBAction func plyusButton(_ sender: UIButton) {
        var num = Int(label33.text!)!
        var total = Int(totalLabel.text!)!
        
        total = total + 1 ; num = num + 1
        totalLabel.text = "\(total)"
        
        if num == 33 {
            if Int(totalLabel.text!)! % 5 == 0 {
                nameLabel.text = "Subhanalloh"
            } else
            if Int(totalLabel.text!)! % 5 == 3 {
                nameLabel.text = "Alhamdulillah"
            } else
            if Int(totalLabel.text!)! % 5 == 1 {
                nameLabel.text = "Allohu Akbar"
            } else
            if Int(totalLabel.text!)! % 5 == 4 {
                nameLabel.text = "Laa Ilaha Ilallah"
            } else
            if Int(totalLabel.text!)! % 5 == 2 {
                nameLabel.text = "Astag'firullahu va atubu ilayh"
            }
        }
        
        if num > 33 {
            label33.text = "1"
        } else {
            label33.text = "\(num)"
        }
        
        if sound {
            playSoundWith(fileName: "Button", fileExtinsion: "wav")
        }
    }
    
    
    @IBAction func refresh(_ sender: UIButton) {
        nameLabel.text = "Subhanalloh"
        totalLabel.text = "0"
        label33.text = "0"
    }
    
    @IBAction func sound(_ sender: UIButton) {
        if sound {
            sender.setTitle("🔕", for: .normal)
            sound = false
        } else {
            sender.setTitle("🔔", for: .normal)
            sound = true
        }
    }
    
    
    
    @IBAction func back(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    func playSoundWith(fileName: String, fileExtinsion: String) -> Void {
        
        let audioSourceURL = Bundle.main.url(forResource: fileName, withExtension: fileExtinsion)
        
        do {
            audioPlayer = try AVAudioPlayer.init(contentsOf: audioSourceURL!)
            audioPlayer.prepareToPlay()
            audioPlayer.play()
        } catch {
            print(error)
        }
        
    }
}
