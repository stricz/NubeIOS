//
//  ViewController.swift
//  Accediendo a la Nube
//
//  Created by Macbook pro  on 28/01/16.
//  Copyright © 2016 Stricz Labs. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UISearchBarDelegate {

    @IBOutlet weak var searchISBNBar: UISearchBar!
    @IBOutlet weak var limpiarButton: UIButton!
    @IBOutlet weak var resultadoTextView: UITextView!
    
    @IBAction func limpiarBusqueda(){
        searchISBNBar.text = ""
        resultadoTextView.text = ""
    }
    
    
    @IBAction func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        resultadoTextView.text = ""
        let isbn = searchISBNBar.text!
        
        let url = NSURL(string : "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:\(isbn)")
        let datos:NSData? = NSData(contentsOfURL: url!)
        
        if datos != nil{
            let texto = NSString( data:datos!, encoding: NSUTF8StringEncoding )
            resultadoTextView.text! = String(texto!);
            searchBar.resignFirstResponder()
        }
        else{
            let alertDialog = UIAlertController(title: "Error de Conexión.", message: "No se puede conectar a la red, intentalo más tarde o habilita tu red de datos. ", preferredStyle: UIAlertControllerStyle.Alert)
            alertDialog.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alertDialog, animated: true, completion: nil)
        }

    }
    
    @IBAction func backgroundTap(sender: UIControl){
        searchISBNBar.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        searchISBNBar.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

