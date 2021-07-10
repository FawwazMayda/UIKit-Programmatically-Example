//
//  ViewController.swift
//  UIKitProg
//
//  Created by Muhammad Fawwaz Mayda on 10/07/21.
//

import UIKit

class ViewController: UIViewController {
    
    var annies: [Character] = [
        Character(name: "Annie Leonhart", army: "Survey Corps", gender: "female", imgName: "annie_1"),
        Character(name: "Annie Leonhart", army: "Cadet 104 th", gender: "female", imgName: "annie_2")
    ]
    
    // Views
    lazy var topLabel: UILabel = {
        let label = UILabel()
        label.text = "Save your Balls"
        label.frame = CGRect(x: 20, y: 20, width: 200, height: 50)
        return label
    }()
    
    lazy var bottomLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 20, y: 80, width: 200, height: 50)
        label.text = "Don't save your Box"
        return label
    }()
    
    lazy var rectangele: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 10, y: 10, width: 300, height: 300)
        view.backgroundColor = .green
        return view
    }()
    
    lazy var simpleButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 50, y: 50, width: 170, height: 30)

        button.isUserInteractionEnabled = true
        // The default text of the button
        button.setTitle("Tap Me", for: .normal)
        
        button.setTitleColor(UIColor.systemBlue, for: .normal)
            
        return button
    }()
    
    lazy var simpleTableView: UITableView = {
        let tableView = UITableView()
        tableView.frame = CGRect(x: 30, y: 30, width: 100, height: 300)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
        setupConstraint()
        setupTableView()
    }
    
    func setupView() {
        self.view.addSubview(simpleTableView)
        self.view.addSubview(topLabel)
        self.view.addSubview(bottomLabel)
        self.view.addSubview(simpleButton)
    }
    
    func setupConstraint() {
        // constraint topLabel
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        topLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        topLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        // constraint tableView
        simpleTableView.translatesAutoresizingMaskIntoConstraints = false
        simpleTableView.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 30).isActive = true
        simpleTableView.bottomAnchor.constraint(equalTo: simpleButton.bottomAnchor, constant: -30).isActive = true
        simpleTableView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        simpleTableView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        
        
        // constraint button
        simpleButton.translatesAutoresizingMaskIntoConstraints = false
        simpleButton.bottomAnchor.constraint(equalTo: bottomLabel.topAnchor, constant: -10).isActive = true
        simpleButton.leadingAnchor.constraint(equalTo: bottomLabel.leadingAnchor, constant: 10).isActive = true
        
        //constraint bottomLabel
        bottomLabel.translatesAutoresizingMaskIntoConstraints = false
        bottomLabel.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        bottomLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
    func setupTableView() {
        //simpleTableView.estimatedRowHeight = 44.0
        simpleTableView.register(CustomCell.self, forCellReuseIdentifier: "cell")
        
        simpleTableView.delegate = self
        simpleTableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return annies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = simpleTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomCell {
            cell.character = annies[indexPath.row]
            return cell
        } else {
            return CustomCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

