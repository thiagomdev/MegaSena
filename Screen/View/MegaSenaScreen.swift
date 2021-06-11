//
//  MegaSenaScreen.swift
//  MegaSena
//
//  Created by Thiago Monteiro  on 20/05/21.
//

    import UIKit
    protocol MegaSenaScreenProtocol: AnyObject {
        func playButton()
        func clear()
    }


class MegaSenaScreen: UIView {
    // MARK: - Properties
    weak var delegate: MegaSenaScreenProtocol?
    
    
    // MARK: - Elements
    lazy var customImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "img")
        img.layer.shadowOpacity = .greatestFiniteMagnitude
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    
    lazy var labelTitle: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Torne-se o novo Milionário 😎"
        lb.textAlignment = .center
        lb.textColor = .lightGray
        lb.alpha = 7.5
        lb.numberOfLines = .zero
        lb.font = UIFont.boldSystemFont(ofSize: 14)
        return lb
    }()
    
    
    lazy var resultLabel: UILabel = {
        let resultLb = UILabel()
        resultLb.translatesAutoresizingMaskIntoConstraints = false
        resultLb.textAlignment = .center
        //resultLb.backgroundColor = .lightGray
        resultLb.textColor = .black
        resultLb.alpha = 7.5
        resultLb.text = "🤑"
        resultLb.numberOfLines = 0
        resultLb.font = UIFont.boldSystemFont(ofSize: 32)
        return resultLb
    }()
    
    
    lazy var buttonTapped: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("Play", for: .normal)
        bt.backgroundColor = .green
        bt.setTitleColor(.systemIndigo, for: .normal)
        bt.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        bt.layer.cornerRadius = 7.5
        bt.alpha = 7.5
        bt.layer.shadowOpacity = .greatestFiniteMagnitude
        bt.addTarget(self, action: #selector(self.play), for: .touchUpInside)
        return bt
    }()
    
    // MARK: - Play Button Method
    @objc func play() {
        self.delegate?.playButton()
    }
    
    
    lazy var buttonClear: UIButton = {
        let btClear = UIButton()
        btClear.translatesAutoresizingMaskIntoConstraints = false
        btClear.setTitle("Clear", for: .normal)
        btClear.backgroundColor = .lightGray
        btClear.setTitleColor(.systemIndigo, for: .normal)
        btClear.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        btClear.layer.cornerRadius = 7.5
        btClear.alpha = 7.5
        btClear.layer.shadowOpacity = .greatestFiniteMagnitude
        btClear.addTarget(self, action: #selector(self.clear), for: .touchUpInside)
        return btClear
    }()
    
    // MARK: - Clear Button methods
    @objc func clear() {
        self.delegate?.clear()
    }
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addNewSubView()
        self.setupConstraint()
    }
    
    // MARK: - Methods
    func delegate(_ delegate: MegaSenaScreenProtocol?) {
        self.delegate = delegate
    }
    
    
    private func addNewSubView() {
        self.addSubview(labelTitle)
        self.addSubview(customImageView)
        self.addSubview(buttonTapped)
        self.addSubview(resultLabel)
        self.addSubview(buttonClear)
    }
    
    // MARK: - Constraints Method
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            // MARK: - Constraint Label Title
            self.labelTitle.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.labelTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            
            // MARK: - constraint Image View
            self.customImageView.topAnchor.constraint(equalTo: self.labelTitle.bottomAnchor, constant: 20),
            self.customImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            
            // MARK: - Constraint Button Tapped
            self.buttonTapped.topAnchor.constraint(equalTo: self.customImageView.bottomAnchor, constant: 80),
            self.buttonTapped.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
            self.buttonTapped.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.buttonTapped.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100),
            
            
            // MARK: - Constraint Result Label
            self.resultLabel.topAnchor.constraint(equalTo: self.customImageView.bottomAnchor, constant: 30),
            self.resultLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.resultLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            
            // MARK: - Constraint Clear Button
            self.buttonClear.topAnchor.constraint(equalTo: self.buttonTapped.bottomAnchor, constant: 10),
            self.buttonClear.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.buttonClear.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
            
            
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
