//
//  ViewController.swift
//  Dynamic-ChessBoard
//
//  Created by Georgios Zervos on 26/5/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var text_value: UILabel!
    @IBOutlet weak var numberSelector: UISlider!
    
    func passData() -> Int {
        return Int(numberSelector.value)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        text_value.text = "Chess Board Dimension: " + String(Int(numberSelector.value)) + " x " + String(Int(numberSelector.value))

    }

    @IBAction func slider(_ sender: Any) {
        text_value.text = "Chess Board Dimension: " +  String(Int(numberSelector.value)) + " x " + String(Int(numberSelector.value))

    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        
    }
    
}


class ChessBoardViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var temp: UILabel!
    private var board: UICollectionView?
    var d = 6
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        board = UICollectionView(frame: .zero, collectionViewLayout: layout)
        board?.delegate = self
        board?.dataSource = self
        board?.register(ChessBoardCell.self, forCellWithReuseIdentifier: ChessBoardCell.id)
        view.addSubview(board!)
        board?.frame = CGRect(x: 0, y: 300, width: 350, height: 350)
        
        board?.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            board!.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            board!.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            board!.heightAnchor.constraint(equalToConstant: 360),
            board!.widthAnchor.constraint(equalToConstant: 350)
        ])

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChessBoardCell.id, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return d*d
    }

}
var wasB = true

class ChessBoardCell: UICollectionViewCell {
    static let id = "ChessBoardCell"
    var hasPawn = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        if !wasB {
            self.backgroundColor = .black
            wasB = true
        }
        else {
            self.backgroundColor = .green
            wasB = false
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

