//
//  DialogViewController.swift
//  MoneyCounter
//
//  Created by mac on 1/27/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import DLRadioButton
class DialogViewController: UIViewController {
    
    @IBOutlet weak var SelectCurrency: DLRadioButton!
    
    @IBAction func selectCurrency(_ sender: DLRadioButton) {
        performSegue(withIdentifier: "close", sender: self)
        /*
        let controller = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier:"popVC")
        
        navigationController?.pushViewController(controller, animated: false)
        // self.performSegue(withIdentifier: "close", sender: self)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    */
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC: CurrencyViewController = segue.destination as! CurrencyViewController
        destinationVC.labelcurrencyDestination = SelectCurrency.titleLabel?.text ??  "Гривна"
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
}

}
