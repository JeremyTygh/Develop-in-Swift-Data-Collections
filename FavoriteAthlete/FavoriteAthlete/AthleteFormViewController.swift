//
//  AthleteFormViewController.swift
//  FavoriteAthlete
//
//  Created by Jeremy Tygh on 1/1/21.
//

import UIKit

class AthleteFormViewController: UIViewController {
    
    struct PropertyKeys {
        static let unwindToListSegue = "unwindToAthleteTableViewController"
    }

    var athlete: Athlete?
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var ageField: UITextField!
    @IBOutlet var leagueField: UITextField!
    @IBOutlet var teamField: UITextField!
    
    init?(coder: NSCoder, athlete: Athlete?) {
        self.athlete = athlete
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateView()
    }
    
    func updateView() {
        guard let athlete = athlete else{return}
        
        nameField.text = athlete.name
        ageField.text = String(athlete.age)
        leagueField.text = athlete.league
        teamField.text = athlete.team
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        guard let name = nameField.text,
              let ageString = ageField.text,
              let age = Int(ageString),
              let league = leagueField.text,
              let team = teamField.text else {return}
        
        athlete = Athlete(name: name, age: age, league: league, team: team)
        
        performSegue(withIdentifier: PropertyKeys.unwindToListSegue, sender: self)

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
