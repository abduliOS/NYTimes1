//
//  ViewController.swift
//  NYTimes
//
//  Created by Abdul on 22/06/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var activityInd: UIActivityIndicatorView!
    @IBOutlet weak var listTableView: UITableView!
    let viewModelNYT = NYTViewModel()

    override func viewWillAppear(_ animated: Bool) {
                   self.navigationController?.navigationBar.isHidden = true

       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityInd.isHidden = false
        activityInd.startAnimating()
        self.listTableView.dataSource = self
        self.listTableView.delegate = self
        self.navigationController?.navigationBar.isHidden = true
        let textFieldCell = UINib(nibName: "NYTTableViewCell",
                                           bundle: nil)
        self.listTableView.register(textFieldCell,
                                         forCellReuseIdentifier: "NYTCell")
                
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let url : NSString = String(format:"https://api.nytimes.com/svc/mostpopular/v2/viewed/30.json?api-key=%@" ,appDelegate.APIKEY) as NSString
        //let urlStr = url.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""

         let fetchURL : NSURL = NSURL(string: url as String)!
         let request = URLRequest(url: fetchURL as URL)
        
        viewModelNYT.fetchNYTApiResults(request: request){ (ok, obj) in

                                 print("success")
                                

                               DispatchQueue.main.async {
                                   self.activityInd.isHidden = true
                                    self.activityInd.stopAnimating()
                                 self.listTableView.reloadData()
                               }
                  }

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           
           
           
           return viewModelNYT.viewModelTableData?.results?.count ?? 0
          
       }
       
      func numberOfSections(in tableView: UITableView) -> Int {
          return 1
      }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 130
       }
    
    func tableView(_ tableView: UITableView,
                      cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           if let cell = tableView.dequeueReusableCell(withIdentifier: "NYTCell") as? NYTTableViewCell {
               
              
               
               let
               dataSource = viewModelNYT.viewModelTableData?.results?[indexPath.row]
            cell.titleLbl.text =  dataSource?.title ?? ""
            cell.detailLbl.text = dataSource?.byline ?? "--"
            cell.timeVal.text = dataSource?.published_date ?? "--"
            cell.previewImg.image = #imageLiteral(resourceName: "ic_Preview")
            cell.naviGateImg.image = #imageLiteral(resourceName: "ic_Next")
            
            let backgroundView = UIView()
            backgroundView.backgroundColor = UIColor.clear
            cell.selectedBackgroundView = backgroundView
            
               return cell
           }
           
           return UITableViewCell()
       }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        let dataSource = viewModelNYT.viewModelTableData?.results?[indexPath.row]
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "DetailsView") as! DetailsViewController
        newViewController.titleNav = "NY Times"
        newViewController.loadURL = dataSource?.url ?? ""
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
}

