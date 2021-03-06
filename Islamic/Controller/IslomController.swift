//
//  IslomController.swift
//  Islamic
//
//  Created by coder on 29/10/20.
//

import UIKit

class IslomController: UIViewController {
    
    let namesArray = ["iyman", "namaz", "zakat", "haj", "ruza", "women"]
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBAction func back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}


extension IslomController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        namesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "islomCell", for: indexPath) as! CustomCollectionCell
                
        cell.iconImage.image = UIImage(named: namesArray[indexPath.row])
        cell.iconTitle.text = namesArray[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.view.frame.width / 2) - 30, height: (self.view.frame.width / 2) - 15)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "tableInIslomViewController") as! TableInIslomViewController
        vc.title = namesArray[indexPath.row]
        navigationController?.show(vc, sender: nil)
    }
}
