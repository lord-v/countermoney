//
//  CurrencyViewController.swift
//  MoneyCounter
//
//  Created by mac on 1/23/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import DLRadioButton
class CurrencyViewController: UIViewController,UIPickerViewDelegate {
    @IBOutlet weak var currency: UITextField!
    var labelcurrencyDestination: String = ""

    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapped))
        tapGesture.numberOfTapsRequired = 1
        currency?.addGestureRecognizer(tapGesture)
    }
    
    @objc func tapped() {
        let popVC = storyboard?.instantiateViewController(withIdentifier: "popVC")
        popVC?.modalPresentationStyle = .popover
        
        let popOverVC = popVC?.popoverPresentationController
        popOverVC?.delegate = self
        popOverVC?.sourceView = self.currency
        popOverVC?.sourceRect = CGRect(x: self.currency.bounds.midX, y: self.currency.bounds.maxY, width: 0, height: 0)
        popVC?.preferredContentSize = CGSize(width: 200, height: 200)
        self.present(popVC!, animated: true)
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGestures()
        currency.text = labelcurrencyDestination
    }

}
extension CurrencyViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
        }
}
