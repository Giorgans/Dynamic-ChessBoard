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
    var d = 16
    var count = 0
    var row = 0 , col = 0
    var colorFlag = false
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.estimatedItemSize = CGSize(width: (359/CGFloat(d))  , height: (359/CGFloat(d)) )
        
        board = UICollectionView(frame: .zero, collectionViewLayout: layout)
        board?.delegate = self
        board?.dataSource = self
        board?.register(ChessBoardCell.self, forCellWithReuseIdentifier: ChessBoardCell.id)
        view.addSubview(board!)
        
        board?.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            board!.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            board!.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            board!.heightAnchor.constraint(equalToConstant: 360),
            board!.widthAnchor.constraint(equalToConstant: 360)
        ])
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChessBoardCell", for: indexPath)

        let chessRow = indexPath.row / d
        if chessRow % 2 == 0 {
            if indexPath.row % 2 == 0 {
                 cell.backgroundColor = UIColor.lightGray
            }else{
                cell.backgroundColor = UIColor.black
            }
        } else{
            if indexPath.row % 2 == 0 {
                cell.backgroundColor = UIColor.black
            }else{
                cell.backgroundColor = UIColor.lightGray
            }
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return d*d
    }

}

class ChessBoardCell: UICollectionViewCell {
    static let id = "ChessBoardCell"
    var hasPawn = false
    var row = 0
    var col = 0
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

