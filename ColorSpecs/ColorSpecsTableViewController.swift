//
//  ColorSpecsTableViewController.swift
//  ColorSpecs
//
//  Created by Apple on 10/17/17.
//  Copyright © 2017 Sophia's Secret Garden. All rights reserved.
//

import UIKit
struct ColorSpec {
    var color: UIColor
    var colorName: String
    
}
class ColorSpecsTableViewController: UITableViewController {
    
    var colorSpecs:[ColorSpec] = [ColorSpec.init(color: UIColor.red, colorName: "Red"), ColorSpec.init(color: UIColor.blue, colorName: "Blue")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func addColor(_ sender: Any) {
        ColorPickerViewController.present(over: self) {
            (colorSpec) in self.colorSpecs.append(colorSpec)
            self.tableView.reloadData()
        }
    }
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colorSpecs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        let colorSpec = colorSpecs[indexPath.row]
        cell.textLabel?.text = colorSpec.colorName
        cell.textLabel?.textColor = colorSpec.color
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ColorDetailViewController, let tableViewCell = sender as? UITableViewCell, let index = tableView.indexPath(for: tableViewCell)?.row
        {
            let colorSpec = colorSpecs[index]
            destination.colorSpec = colorSpec
            
        }
    }
 
}
