//
//  ViewController.swift
//  Download Image From web
//
//  Created by Minh Pham on 11/25/16.
//  Copyright © 2016 Minh Pham. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let documentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        
        if documentPath.count  > 0 {
            let documentDirectory = documentPath[0]
            let restorePath = documentDirectory + "/tiger.jpg"
            
            imageView.image = UIImage(contentsOfFile: restorePath)
           
            
        }
        
        let url = URL(string: "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQBLVUTEfwcBSoQz_SNLw41VH_B76zVbXMgw1FPlQ26cYgC61MyPA")!
        
        let request = NSMutableURLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request as URLRequest){
            data, response, error in
            if error != nil {
                print(error)
            } else {
                if let data = data {
                    if let image = UIImage(data: data){
                        self.imageView.image = image
                        
                        let documentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
                        
                        if documentPath.count  > 0 {
                            let documentDirectory = documentPath[0]
                            let savePath = documentDirectory + "/tiger.jpg"
                                
                                do {
                                    try UIImageJPEGRepresentation(image, 1)?.write(to: URL(fileURLWithPath: savePath))
                                } catch {
                                    print("Error")
                                }
                            
                        }
                    }
                }
            }
        }
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

