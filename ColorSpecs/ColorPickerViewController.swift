//
//  ColorPickerViewController.swift
//  ColorSpecs
//
//  Created by Apple on 10/17/17.
//  Copyright © 2017 Sophia's Secret Garden. All rights reserved.
//

import UIKit

class ColorPickerViewController: UIViewController {

    var completionHandler: ((ColorSpec) -> Void)?
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var colorPreview: UIView!
    
    static func present(over presenter: UIViewController, completion: @escaping ((ColorSpec) -> Void))
    {
        if let navigation = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "colorPickerNav") as? UINavigationController,
            let colorController = navigation.childViewControllers.first as? ColorPickerViewController
        {
            colorController.completionHandler = completion
            presenter.present(navigation, animated: true, completion: nil)
        }
        
    }
    
    
    @IBAction func updateColorView(_ sender: Any) {
        let newColor = UIColor.init(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1)
        colorPreview.backgroundColor = newColor
        
    }
    
    
    @IBAction func doneTapped(_ sender: Any) {
        let newColorSpec = ColorSpec.init(color:
            colorPreview.backgroundColor!, colorName: "A New Color")
        self.completionHandler?(newColorSpec)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

}
