//
//  GitHubRepoViewController.swift
//  WasmaCompanyProject
//
//  Created by mac on 2/20/20.
//  Copyright © 2020 iti. All rights reserved.
//

import UIKit
import Alamofire
class GitHubRepoViewController: UIViewController  , UITableViewDelegate , UITableViewDataSource , UIScrollViewDelegate , UIGestureRecognizerDelegate{
    
    var githubData: [GitHubData] = []
    
    @IBOutlet weak var gittableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        //        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: "longPress:")
        //        self.view.addGestureRecognizer(longPressRecognizer)
        
        self.gittableview.addSubview(self.refreshControl)
        gittableview.delegate = self
        gittableview.dataSource =  self
        getRickAndMortyData()
        
        let longPressGesture:UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(self.handleLongPress))
        longPressGesture.minimumPressDuration = 1.0 // 1 second press
        longPressGesture.delegate = self
        self.gittableview.addGestureRecognizer(longPressGesture)
        
//
//        Helper.getApiToken(key: "repoowner")
//        Helper.getApiToken(key: "reponame")
//        Helper.getApiToken(key: "descripe")
    }
    
    
    func getRickAndMortyData(){
        let session = URLSession.shared
        if let url = URL(string: "https://api.github.com/users/JeffreyWay/repos"){
            
            /*
             https://api.github.com/users/JeffreyWay/repos?page=1&per_page=15
             
             */
            let request = URLRequest(url: url)
            let task = session.dataTask(with: request) {
                (data, response, error) in
                
                do {
                    if let data = data{
                        let repodata = try JSONDecoder().decode([GitHubData].self, from: data)
                        self.githubData = repodata
                        DispatchQueue.main.async {
                            self.gittableview.reloadData()
                        }
                    }
                }
                catch{}
            }
            task.resume()
        }
        
    }
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
            #selector(GitHubRepoViewController.handleRefresh(_:)),
                                 for: UIControl.Event.valueChanged)
        refreshControl.tintColor = UIColor.orange
        refreshControl.attributedTitle = NSAttributedString(string: "Fetching Repo Data ...")
        return refreshControl
    }()
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        
        getRickAndMortyData()
        
        refreshControl.endRefreshing()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return githubData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let count = githubData.count
        if count < 1{
            let lastElement = count - 10
            if indexPath.row == lastElement {
                //call get api for next page
                getRickAndMortyData()
            }
        }
        
        let cell = gittableview.dequeueReusableCell(withIdentifier: "cellid" , for: indexPath)
        cell.textLabel?.text = githubData[indexPath.row].owner.avatar_url
//        if githubData[indexPath.row]. == false {
//            cell.backgroundColor = UIColor.green
//        }
        
//        if githubData[indexPath.row].fork == nil {
//            cell.backgroundColor = UIColor.green
//        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let storyboard =  UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "GitHubDetailsVC") as! GitHubDetailsVC
        vc.repoowner = githubData[indexPath.row].owner.login
//        Helper.saveApiToken(value: githubData[indexPath.row].owner.login!, key: "repoowner")
        vc.fullname = githubData[indexPath.row].full_name
//        Helper.saveApiToken(value:githubData[indexPath.row].full_name!, key: "descripe")
        vc.reponame = githubData[indexPath.row].name
//        Helper.saveApiToken(value:  githubData[indexPath.row].name!, key: "reponame")





        self.navigationController?.pushViewController(vc, animated: true)
    }

    
    @objc func handleLongPress(_ gestureRecognizer: UILongPressGestureRecognizer){
        if gestureRecognizer.state == .ended {
            let touchPoint = gestureRecognizer.location(in: self.gittableview)
            if let indexPath = gittableview.indexPathForRow(at: touchPoint) {
                print("longpress")
                
                let alertController = UIAlertController(title: "Alert", message: "Dialogue", preferredStyle: .alert)
                
                // Create OK button
                let ownerAction = UIAlertAction(title: "Owner", style: .default) { (action:UIAlertAction!) in
                    
                    // Code in this block will trigger when OK button tapped.
                    guard let url = URL(string: "\(self.githubData[indexPath.row].html_url ?? "follow")") else { return }
                    UIApplication.shared.open(url)
                    
                }
                alertController.addAction(ownerAction)
                
                // Create OK button
                let repoAction = UIAlertAction(title: "Repo", style: .default) { (action:UIAlertAction!) in
                    
                    // Code in this block will trigger when OK button tapped.
                    
                    
                    guard let url = URL(string: "\(self.githubData[indexPath.row].html_url ?? "follow")") else { return }
                    UIApplication.shared.open(url)
                    
                    
                }
                alertController.addAction(repoAction)
                
                // Create Cancel button
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action:UIAlertAction!) in
                    print("Cancel button tapped");
                }
                alertController.addAction(cancelAction)
                
                // Present Dialog message
                self.present(alertController, animated: true, completion:nil)
                
            }
        }
    }
}


