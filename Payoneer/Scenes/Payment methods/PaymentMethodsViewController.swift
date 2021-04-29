//
//  PaymentMethodsViewController.swift
//  Payoneer
//
//  Created by Mehmed Tukulic on 28. 4. 2021..
//

import UIKit

class PaymentMethodsViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var viewModel = PaymentMethodsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        
        setupBindings()
        setupCollection()
    }
    
    private func setupBindings(){
        //Start observing on viewModel variables
        
        viewModel.paymentOptions.bind{ [weak self] _ in
            self?.collectionView.reloadData()
        }
        
        viewModel.errorMessage.bind{ [weak self] in
            if !$0.isEmpty {
                self?.showError()
            }
        }
    }
    
    private func setupCollection(){
        let methodCell = UINib(nibName: "PaymentMethodViewCell", bundle: nil)
        collectionView.register(methodCell, forCellWithReuseIdentifier: PaymentMethodViewCell.identifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
    }
    
    private func showError(){
        showToast(message: viewModel.errorMessage.value)
    }
}

// MARK: - Collection Methods

extension PaymentMethodsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.paymentOptions.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PaymentMethodViewCell.identifier, for: indexPath) as! PaymentMethodViewCell
        
        let option = viewModel.paymentOptions.value[indexPath.row]
        cell.setup(model: option)
        
        return cell
    }
    
    
}

extension PaymentMethodsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 60)
    }
}


