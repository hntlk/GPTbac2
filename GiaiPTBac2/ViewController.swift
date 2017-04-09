//
//  ViewController.swift
//  GiaiPTBac2
//
//  Created by Cntt20 on 4/8/17.
//  Copyright © 2017 Cntt20. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    
    
    @IBOutlet weak var txt_HeSoa: UITextField!
    @IBOutlet weak var txt_HeSob: UITextField!
    @IBOutlet weak var txt_HeSoc: UITextField!
    @IBOutlet weak var lb_KetQua: UILabel!
    @IBOutlet weak var lb_X1: UILabel!
    @IBOutlet weak var lb_X2: UILabel!
    @IBOutlet weak var txt_X1: UITextField!
    @IBOutlet weak var txt_X2: UITextField!
    @IBOutlet weak var Giai: UIButton!
    //Bien
    //var a = Float()
    
    //

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lb_X1.isHidden = true
        lb_X2.isHidden = true
        txt_X1.isHidden = true
        txt_X2.isHidden = true
        lb_KetQua.isHidden = true
        //
        self.txt_HeSoa.delegate = self;
        self.txt_HeSob.delegate = self;
        self.txt_HeSoc.delegate = self;
        //textFieldDidChange()
        //GiaiPTBac2()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //Validation
    func    textFieldDidChange() -> Bool{
        if txt_HeSoa.text == "" || txt_HeSob.text == "" || txt_HeSoc.text == "" || txt_HeSoa.text == "." || txt_HeSob.text == "." || txt_HeSoc.text == "." || txt_HeSoa.text == "" || txt_HeSob.text == "" || txt_HeSoc.text == "" {
            return false
        } else {
            return true
        }
    }
    //Ham
    func GiaiPTBac2(){
        let a:Float! = Float(txt_HeSoa.text!)
        let b:Float! = Float(txt_HeSob.text!)
        let c:Float! = Float(txt_HeSoc.text!)
        
        //textFieldDidChange()
        if(a==0){
            if(b==0){
                lb_KetQua.isHidden = false
                lb_KetQua.text = "Phuong Trinh Vo Nghiem!!!"
            }
            else{
                //var temp = -c/b
                lb_X1.isHidden = false
                txt_X1.isHidden = false
                lb_KetQua.isHidden = false
                lb_KetQua.text = "Phuong Trinh Co 1 Nghiem!!!"
                lb_X1.text = "X = "
                txt_X1.text = String(-c/b)
            }
        }
        else{
            let delta = b*b - 4*a*c
            if(delta < 0){
                //lb_X1.isHidden = false
                lb_KetQua.isHidden = false
                //lb_KetQua.isHidden = false
                lb_KetQua.text = "Phương Trình Vô Nghiệm!!!"
            }
            else{
                if(delta == 0){
                    lb_X1.isHidden = false
                    lb_KetQua.isHidden = false
                    txt_X1.isHidden = false
                    lb_KetQua.text = "Phuong Trinh Co Nghiem Kep!!!"
                    lb_X1.text = "X ="
                    txt_X1.text = String(-b/(2*a))
                }
                else{
                    lb_X1.isHidden = false
                    lb_X2.isHidden = false
                    txt_X1.isHidden = false
                    txt_X2.isHidden = false
                    lb_KetQua.isHidden = false
                    lb_KetQua.text = "Phuong Trinh Co 2 Nghiem Phan Biet!!!"
                    lb_X1.text = "X1 = "
                    lb_X2.text = "X2 = "
                    txt_X1.text = String((-b+sqrt(delta))/(2*a))
                    txt_X2.text = String((-b-sqrt(delta))/(2*a))
                }
            }
        }
        
    }
    @IBAction func actGiai(_ sender: Any) {
        if(textFieldDidChange() == true){
            //lb_X1.isHidden = true
            //lb_X2.isHidden = true
            //txt_X1.isHidden = true
            //txt_X2.isHidden = true
            //lb_KetQua.isHidden = true
            GiaiPTBac2()
        }
        else{
            lb_KetQua.isHidden = false
            lb_KetQua.text = "Vui lòng nhập đủ 3 hệ số!!!"
        }
        
    }
    @IBAction func actResetText(_ sender: Any) {
        //textFieldDidChange()
        txt_HeSoa.text = ""
        txt_HeSob.text = ""
        txt_HeSoc.text = ""
        lb_X1.isHidden = true
        lb_X2.isHidden = true
        txt_X1.isHidden = true
        txt_X2.isHidden = true
        lb_KetQua.isHidden = true
        
    }
    //Validation
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let aSet = NSCharacterSet(charactersIn:"0123456789-.").inverted
        let compSepByCharInSet = string.components(separatedBy: aSet)
        let numberFiltered = compSepByCharInSet.joined(separator: "")
        return string == numberFiltered
    }
    


}

