//
//  TeamTableViewController.swift
//  TeamFit
//
//  Created by Loren Colcol on 1/9/15.
//  Copyright (c) 2015 TeamFit. All rights reserved.
//

import UIKit

class TeamTableViewController: UITableViewController, UISearchBarDelegate, UISearchDisplayDelegate{
    
    var teams = [Team]()
    // array of sample teams
    
    var filteredTeams = [Team]()
    // array to hold filtered search results
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //sample teams for teams array
        self.teams = [Team(name:"Team Avatar"), Team(name:"WeAreFit"), Team(name:"Lean Machines"), Team(name: "Team Swole")]
        
        //reload the table
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    /*
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    // #warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0
    }
    */
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.searchDisplayController!.searchResultsTableView {
            return self.filteredTeams.count
        } else {
            return self.teams.count
            //tells the tableView that it should cotain as many rows as there are itesm in the teams in the teams array we made earlier
        }
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //function with 3 steps
        // first, dequeue a cell to use for this indexPath
        // second, access the teams array, reference the indexPath to decide which Team object to pull
        // third, use that Team object to populate the UITableViewCell
        //ask for a reusable cell from the tableView, the tableView will create a new one if it doesn't have any
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell
        var team : Team
        
        
        if tableView == self.searchDisplayController!.searchResultsTableView {
            team = filteredTeams[indexPath.row]
        } else {
            team = teams[indexPath.row]
        }
        
        //configure the cell
        cell.textLabel!.text = team.name
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        return cell
    }
    
    func filterContentForSearchText(searchText: String) {
        // filter the array for using the filter method
        self.filteredTeams = self.teams.filter({( team: Team) -> Bool in
            let stringMatch = team.name.rangeOfString(searchText)
            return (stringMatch != nil)
        })
    }
    
    func searchDisplayController(controller: UISearchDisplayController!, shouldReloadTableForSearchString searchString: String!) -> Bool {
        self.filterContentForSearchText(searchString)
        return true
    }
    
    func searchDisplayController(controller: UISearchDisplayController!, shouldReloadTableForSearchScope searchOption: Int) -> Bool {
        self.filterContentForSearchText(self.searchDisplayController!.searchBar.text)
        return true
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return NO if you do not want the specified item to be editable.
    return true
    }
    */
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return NO if you do not want the item to be re-orderable.
    return true
    }
    */
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    }
    */
    
}
