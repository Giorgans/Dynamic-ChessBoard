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

    override func viewDidLoad() {
        super.viewDidLoad()
        text_value.text = "Chess Board Dimension: " + String(Int(numberSelector.value)) + " x " + String(Int(numberSelector.value))
    }

    @IBAction func slider(_ sender: Any) {
        text_value.text = "Chess Board Dimension: " +  String(Int(numberSelector.value)) + " x " + String(Int(numberSelector.value))

    }
    
    @IBAction func buttonPressed(_ sender: Any) {
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        // Get a reference to the second view controller
        let vc = segue.destination as! ChessBoardViewController

        // Set a variable in the second view controller with the String to pass
        vc.d =  Int(numberSelector.value)
        
    }

}

var startingPointIsChosen = false
var endingPointIsChosen = false


class ChessBoardViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    
    @IBOutlet weak var check: UIButton!
    
    @IBOutlet weak var temp: UILabel!
    private var board: UICollectionView?
    var d : Int = 0
    var count = 0
    var row = 0 , col = 0
    var colorFlag = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // create the alert
        let alert = UIAlertController(title: "Starting Point", message: "Choose a starting point to place the knight", preferredStyle: UIAlertController.Style.alert)

        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

        // show the alert
        self.present(alert, animated: true, completion: nil)

        let layout = UICollectionViewFlowLayout()
        
        board = UICollectionView(frame: .zero, collectionViewLayout: layout)
        board?.delegate = self
        board?.dataSource = self
        board?.register(ChessBoardCell.self, forCellWithReuseIdentifier: ChessBoardCell.id)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.estimatedItemSize = CGSize(width: (359/CGFloat(d))  , height: (359/CGFloat(d)) )
        temp.text = "This is a " + String(d) + "x" + String(d) + " Chess Board"
        board?.translatesAutoresizingMaskIntoConstraints = false
        if startingPointIsChosen {
            
        }
        view.addSubview(board!)
        
        NSLayoutConstraint.activate([
            board!.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            board!.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            board!.heightAnchor.constraint(equalToConstant: 360),
            board!.widthAnchor.constraint(equalToConstant: 360)
        ])

    }
    
    
    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChessBoardC", for: indexPath) as! ChessBoardCell
        if d % 2 == 0 {
            let chessRow = (indexPath.row ) / d
            if chessRow % 2 == 0 {
                if indexPath.row % 2 == 0 {
                    cell.backgroundColor = UIColor.lightGray
                }
                else{
                    cell.backgroundColor = UIColor.black
                }
            } else{
                if indexPath.row % 2 == 0 {
                    cell.backgroundColor = UIColor.black
                }
                else{
                    cell.backgroundColor = UIColor.lightGray
                }
            }
        }
        else {
            let chessRow = (indexPath.section ) / d
            if chessRow % 2 == 0 {
                if indexPath.row % 2 == 0 {
                    cell.backgroundColor = UIColor.lightGray
                }
                else{
                    cell.backgroundColor = UIColor.black
                }
            } else{
                if indexPath.row % 2 == 0 {
                    cell.backgroundColor = UIColor.black
                }
                else{
                    cell.backgroundColor = UIColor.lightGray
                }
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return d*d
    }
    
    func passDim(dim: Int) {
        d = dim
    }
    
    @IBAction func checkPressed(_ sender: Any) {
        // create the alert
        let alert = UIAlertController(title: "Starting Point", message: "Choose a starting point to place the knight", preferredStyle: UIAlertController.Style.alert)

        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

        // show the alert
        self.present(alert, animated: true, completion: nil)


    }
    
}


class ChessBoardCell: UICollectionViewCell {
    static let id = "ChessBoardC"
    var hasPawn = false
    var row = 0
    var col = 0
    var button = UIButton()
    var ImgView = UIImageView()
    var img = UIImage(named: "knight")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        button.backgroundColor = UIColor(white: 1, alpha: 0)
        button.frame = CGRect(x: 0, y: 0, width: self.frame.width , height: self.frame.height)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        ImgView.image = img
        ImgView.frame = CGRect(x: 0, y: 0, width: self.frame.width , height: self.frame.height)
        ImgView.isHidden = true
        self.addSubview(ImgView)
        self.addSubview(button)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    @objc func buttonPressed() {
        if startingPointIsChosen && !endingPointIsChosen{
            self.backgroundColor = .green
            endingPointIsChosen = true
        }

        if !startingPointIsChosen {
            self.ImgView.isHidden = false
            startingPointIsChosen = true
        }
    }
}


