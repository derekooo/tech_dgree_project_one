//Part one:
//Create each player with dictionary
var playerOne: [String:String] = ["name":"Joe Smith","Height":"42","Experience":"Yes","Guardian Names":"Jim and Smith"]
var playerTwo:[String:String] = ["name":"Jill Tanner","Height":"36","Experience":"Yes", "Guardian Names":"Clara Tanner"]
var playerThree:[String:String] = ["name":"Bill Bon","Height":"43","Experience":"Yes", "Guardian Names":"Sara and Jenny Bon"]
var playerFour:[String:String] = ["name":"Eva Gordon","Height":"45","Experience":"No", "Guardian Names":"Wendy and Mike Gordon"]
var playerFive:[String:String] = ["name":"Matt Gill","Height":"40","Experience":"No", "Guardian Names":"Charles and Sylvia Gill"]
var playerSix :[String:String] = ["name":"Kimmy Stein","Height":"41","Experience":"No", "Guardian Names":"Bill and Hillary Stein"]
var playerSeven:[String:String] = ["name":"Sammy Adams","Height":"45","Experience":"No", "Guardian Names":"Jeff Adams"]
var player_eight:[String:String] = ["name":"Karl Saygan","Height":"42","Experience":"Yes", "Guardian Names":"Heather Bledsoe"]
var playerNine:[String:String] = ["name":"Suzane Greenberg","Height":"44","Experience":"Yes", "Guardian Names":"Aaron and Jill Finkelstein"]
var playerTen:[String:String] = ["name":"Sal Dali","Height":"41","Experience":"No", "Guardian Names":"Gala Dali"]
var playerEleven:[String:String] = ["name":"Joe Kavalier","Height":"39","Experience":"No", "Guardian Names":"Sam and Elaine Kavalier"]
var playerTwelve:[String:String] = ["name":"Ben Finkelstein","Height":"44","Experience":"No", "Guardian Names":"Aaron and Jill Finkelstein"]
var playerThirteen:[String:String] = ["name":"Diego Soto","Height":"41","Experience":"Yes", "Guardian Names":"Robin and Sarika Soto"]
var playerFourteen:[String:String] = ["name":"Chloe Alaska","Height":"47","Experience":"No", "Guardian Names":"David and Jamie Alaska"]
var playerFifteen:[String:String] = ["name":"Arnold Willis","Height":"43","Experience":"No", "Guardian Names":"Claire Willis"]
var playerSixteen:[String:String] = ["name":"Phillip Helm","Height":"44","Experience":"Yes", "Guardian Names":"Thomas Helm and Eva Jones"]
var playerSeveteen:[String:String] = ["name":"Les Clay","Height":"42","Experience":"Yes", "Guardian Names":"Wynonna Brown"]
var playerEigteen:[String:String] = ["name":"Herschel Krustofski","Height":"45","Experience":"Yes", "Guardian Names":"Hyman and Rachel Krustofski"]






//put all player into players array collection
let players = [playerOne,playerTwo,playerThree,playerFour,playerFive,playerSix
                ,playerSeven,player_eight,playerNine,playerTen,playerEleven,playerTwelve,
                 playerThirteen,playerFourteen,playerFifteen,playerSixteen,playerSeveteen,
                 playerEigteen]

//--------------------------------------------
//Part two:

//create two array - one is the team contain all experience players, another one dose not.
var exTeam:[[String:String]] = []    // group of experience players
var nonExteam:[[String:String]] = [] // group of non-experience players

for player in players{
    if player["Experience"] == "Yes"{
        exTeam.append(player)
    }else{
        nonExteam.append(player)
    }
}
//create three empty team
var NewteamDragons = [[String:String]]()
var NewteamSharks = [[String:String]]()
var NewteamRaptors = [[String:String]]()


//function to caculate team requirement no matter how many player is.

func getLimit(numOfTeam:Int, totalPlayer:Int) -> Int {
    if totalPlayer%numOfTeam == 0 || totalPlayer%numOfTeam == 1{
        let result = totalPlayer/numOfTeam
        return result
    }else {
        let result = (totalPlayer/numOfTeam) + 1
        return result
    }
}
//  requirement of number player per team

let NumberTeam = 3
let exLimit = getLimit(numOfTeam: NumberTeam, totalPlayer: exTeam.count)
let noExLimit = getLimit(numOfTeam: NumberTeam, totalPlayer: nonExteam.count)


//First, put experience player into three teams one by one based on the limited number of experience player
for player in exTeam{
    if NewteamDragons.count < exLimit {
        NewteamDragons.append(player)
    }else if NewteamSharks.count < NewteamDragons.count {
        NewteamSharks.append(player)
    }else {
        NewteamRaptors.append(player)
    }
}
//second, put non-experience player into three teams one by one
for player in nonExteam {
    if NewteamDragons.count < (exLimit + noExLimit) {
        NewteamDragons.append(player)
    }else if NewteamSharks.count < NewteamDragons.count {
        NewteamSharks.append(player)
    }else {
        NewteamRaptors.append(player)
    }
}







//Part Three -- letters
let DragonsTime  = "March 17, 1pm"
let SharksTime = "March 17, 3pm"
let RaptorsTime = "March 18, 1pm"
func generate_letter(player:[String:String], game_time:String, team:String) -> String{
    return """
Hi there:
    Dear \(player["Guardian Names"]!)
    Your Child \(player["name"]!) will play with team \(team),
    and the team practice time is \(game_time)
    Thank you so much.
    Sincerely
    
    Town’s youth soccer league
    
    
"""
}

var letters = [String]()

for player in NewteamSharks {
    let letter = generate_letter(player: player, game_time: SharksTime, team: "team Sharks")
    letters.append(letter)
}
for player in NewteamDragons {
    let letter = generate_letter(player: player, game_time: DragonsTime, team: "team Dragons")
    letters.append(letter)
}
for player in NewteamRaptors {
    let letter = generate_letter(player: player, game_time: RaptorsTime, team: "team Raptors")
    letters.append(letter)
}
for letter in letters {
    print(letter)
}

