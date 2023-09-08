//
//  AlbumDetailViewController.swift
//  CYGNVSProject
//
//  Created by Vinitha Rao A on 08/09/23.
//

import UIKit

class AlbumDetailViewController: UIViewController {
    
    var textFieldTappedClosure: ((String) -> Void) = { _ in }
    
    var viewModel = AlbumDetailViewModel()
    
    //MARK: - View
    
    private var keyboardAccessoryView: UIToolbar {
        
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 44))
        
        let done = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(dismissKeyBoard))
        
        toolBar.items = [UIBarButtonItem.flexibleSpace(), done]
        
        return toolBar
    }
    
    private lazy var thumbNailPictureView: UIImageView = {
        let  thumbNailPictureView = UIImageView()
        thumbNailPictureView.contentMode = .scaleAspectFit
        thumbNailPictureView.clipsToBounds = true
        thumbNailPictureView.image = self.viewModel.generateImage(url: self.viewModel.albumData.url)
        thumbNailPictureView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        thumbNailPictureView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        thumbNailPictureView.translatesAutoresizingMaskIntoConstraints = false
        return thumbNailPictureView
        
    }()
    
    private lazy var albumImageView: UIImageView = {
        let albumImageView = UIImageView()
        albumImageView.contentMode = .scaleAspectFit
        albumImageView.clipsToBounds = true
        albumImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        albumImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        albumImageView.translatesAutoresizingMaskIntoConstraints = false
        return albumImageView
    }()
    
    private lazy var titleTextField: UITextField = {
        let titleTextField: UITextField = UITextField()
        titleTextField.font = UIFont.systemFont(ofSize: 18, weight: .heavy)
        titleTextField.delegate = self
        titleTextField.text = self.viewModel.albumData.title
        titleTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        titleTextField.returnKeyType = UIReturnKeyType.next
        titleTextField.keyboardType = UIKeyboardType.default
        titleTextField.inputAccessoryView = keyboardAccessoryView
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        return titleTextField
    }()
    
    private lazy var stackView: UIStackView = {
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.addArrangedSubview(thumbNailPictureView)
        stackView.addArrangedSubview(titleTextField)
        stackView.addArrangedSubview(albumImageView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var holderView: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.black.cgColor
        let viewDict: [String : Any] = ["view": stackView]
        var constraints = [NSLayoutConstraint]()
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[view]-10-|", options: [], metrics: nil, views: viewDict))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[view]-10-|", options: [], metrics: nil, views: viewDict))
        NSLayoutConstraint.activate(constraints)
        return view
    }()
    
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetup()
        
    }
    
    func initialSetup() {
        
        hidesBottomBarWhenPushed = true
        view.backgroundColor = .white
        
        self.albumImageView.image = self.viewModel.generateImage(url: self.viewModel.albumData.url)
        
        self.view.addSubview(holderView)
        holderView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
        holderView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        holderView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20).isActive = true
        
    }
    
}

extension AlbumDetailViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textFieldTappedClosure(textField.text ?? "")
    }
    
    @objc func dismissKeyBoard(){
        titleTextField.endEditing(true)
    }
}
