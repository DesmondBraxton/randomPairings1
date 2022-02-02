import UIKit

import Foundation
//Intergender boxing match

var fighters = ["Hildy", "Alyson", "Ayoola",  "Bee", "Krystal", "Ian", "Michelle", "Levi", "Angela", "Anthony", "Mariel", "Adam", "Alex", "Tia", "Kary", "Phoenix", "Eric M", "Kevin", "Liana", "Albert", "Aaron", "Neema", "Fredlyne", "Sam", "Jason", "Wally", "Sunni", "Jack", "Eric W", "Kimball", "Rad"]
//Injured: "Malcolm", "Josh", "Jocelyn"
var previousPairs: [String:String] = [
    "Hildy" : "Wally",
    "Alyson" : "Jocelyn",
    "Ayoola" : "Adam",
//    "Jocelyn" : "Alyson",
    "Bee" : "Malcolm",
    "Krystal" : "Sunni",
    "Ian" : "Kary",
    "Michelle" : "Alex",
    "Levi" : "Fredlyne",
    "Angela" : "Liana",
    "Anthony" : "Eric W",
    "Mariel" : "Tia",
    "Adam" : "Ayoola",
    "Alex" : "Michelle",
    "Tia" : "Mariel",
    "Kary" : "Ian",
    "Phoenix" : "Eric M",
    "Eric M" : "Phoenix",
    "Kevin" : "Neema",
    "Liana" : "Angela",
    "Albert" : "Kimball",
    "Aaron" : "Jason",
    "Neema" : "Kevin",
    "Fredlyne" : "Levi",
    "Sam" : "",
    "Jason" : "Aaron",
    "Wally" : "Hildy",
    "Sunni" : "Krystal",
//    "Malcolm" : "Bianca",
    "Jack" : "",
    "Eric W" : "Anthony",
    "Kimball" : "Albert",
    "Rad": ""]


var Opponents = [(String,String)]()

func getRandomFighter() -> String? {
    if let Opponents = fighters.randomElement() {
        fighters.removeAll(where: {a in
            a == fighters
        })
        return fighters
    }
    return nil
}

func getNewPair(_ fighter1: String) -> (String,String) {
    var pairFound = false
    while !pairFound {
        let potentialPair = fighters.randomElement()
        if let p = potentialPair, p != fighter1 && p != previousPairs[fighter1] {
            fighters.removeAll(where: {a in
                a == p
            })
            return (fighter1,p)
        }
    }
}

func addFighterPair(_ pair: (String, String)) {
    Opponents.append(pair)
}

func createPair() {
    if let fighter1 = getRandomFighter() {
        if fighters.count > 0 {
            let pair = getNewPair(fighter1)
            addFighterPair(pair)
        } else {
            addFighterPair((fighter1,"let's triple you with the pair above"))
        }
    }
}

func printPairings() {
    let date = Date()
    let format = DateFormatter()
    format.dateFormat = "yyyy-MM-dd"
    let formattedDate = format.string(from: date)
    print("Here are the pairs for the date \(formattedDate)")
    for i in Opponents {
        print("\(i.0) and \(i.1), You'll be sparring together today!")
    }
}

func setupPairings(){
    while fighters.count > 0 {
        createPair()
    }
    printPairings()
}

setupPairings()
