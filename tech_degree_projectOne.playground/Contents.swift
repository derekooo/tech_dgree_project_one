//Part one:
//Create each player with dictionary
var player_one: [String:String] = ["name":"Joe Smith","Height":"42","Experience":"Yes","Guardian Names":"Jim and Smith"]
var player_two:[String:String] = ["name":"Jill Tanner","Height":"36","Experience":"Yes", "Guardian Names":"Clara Tanner"]
var player_three:[String:String] = ["name":"Bill Bon","Height":"43","Experience":"Yes", "Guardian Names":"Sara and Jenny Bon"]
var player_four:[String:String] = ["name":"Eva Gordon","Height":"45","Experience":"No", "Guardian Names":"Wendy and Mike Gordon"]
var player_five:[String:String] = ["name":"Matt Gill","Height":"40","Experience":"No", "Guardian Names":"Charles and Sylvia Gill"]
var player_six :[String:String] = ["name":"Kimmy Stein","Height":"41","Experience":"No", "Guardian Names":"Bill and Hillary Stein"]
var player_seven:[String:String] = ["name":"Sammy Adams","Height":"45","Experience":"No", "Guardian Names":"Jeff Adams"]
var player_eight:[String:String] = ["name":"Karl Saygan","Height":"42","Experience":"Yes", "Guardian Names":"Heather Bledsoe"]
var player_nine:[String:String] = ["name":"Suzane Greenberg","Height":"44","Experience":"Yes", "Guardian Names":"Aaron and Jill Finkelstein"]
var player_ten:[String:String] = ["name":"Sal Dali","Height":"41","Experience":"No", "Guardian Names":"Gala Dali"]
var player_eleven:[String:String] = ["name":"Joe Kavalier","Height":"39","Experience":"No", "Guardian Names":"Sam and Elaine Kavalier"]
var player_twelve:[String:String] = ["name":"Ben Finkelstein","Height":"44","Experience":"No", "Guardian Names":"Aaron and Jill Finkelstein"]
var player_thirteen:[String:String] = ["name":"Diego Soto","Height":"41","Experience":"Yes", "Guardian Names":"Robin and Sarika Soto"]
var player_fourteen:[String:String] = ["name":"Chloe Alaska","Height":"47","Experience":"No", "Guardian Names":"David and Jamie Alaska"]
var player_fifteen:[String:String] = ["name":"Arnold Willis","Height":"43","Experience":"No", "Guardian Names":"Claire Willis"]
var player_sixteen:[String:String] = ["name":"Phillip Helm","Height":"44","Experience":"Yes", "Guardian Names":"Thomas Helm and Eva Jones"]
var player_seveteen:[String:String] = ["name":"Les Clay","Height":"42","Experience":"Yes", "Guardian Names":"Wynonna Brown"]
var player_eigteen:[String:String] = ["name":"Herschel Krustofski","Height":"45","Experience":"Yes", "Guardian Names":"Hyman and Rachel Krustofski"]


//put all player into players array collection
let players = [player_one,player_two,player_three,player_four,player_five,player_six
                ,player_seven,player_eight,player_nine,player_ten,player_eleven,player_twelve,
                 player_thirteen,player_fourteen,player_fifteen,player_sixteen,player_seveteen,
                 player_eigteen]

//--------------------------------------------
//Part two:

//create two array - one is the team contain all experience players, another one dose not.
var ex_team:[[String:String]] = []    // group of experience players
var nonEx_team:[[String:String]] = [] // group of non-experience players

for player in players{
    if player["Experience"] == "Yes"{
        ex_team.append(player)
    }else{
        nonEx_team.append(player)
    }
}


//function that calculate the number of experience player and non-experience player from totol number of people
func get_experience_number(players:[[String:String]])-> (Int,Int){
    var player_with_ex = 0
    var player_without_ex = 0
    for player in players{
        if player["Experience"] == "Yes"{
            player_with_ex += 1
        }else{
            player_without_ex += 1
        }
    }
    return (player_without_ex,player_with_ex)
}


/*function that make a plan to arrage player - 3 cases
ex: 15 total -> (5,5,5) case 1
   16 total -> (5,5,6) case 2
   17 total -> (6,6,5) case 3 */

func arrange_temp(total_player:Double) -> (Int,Int,Int){
    let each_team = Int(total_player)%3
    let each_num = Int(Double(total_player/3).rounded())
    if each_team == 0 {
        let result = (each_num,each_num,each_num)
        return result
    }else if each_team == 1{
        return (each_num,each_num,each_num + 1)
    }else{
        return (each_num,each_num,each_num - 1)
    }
}


// sample test
arrange_temp(total_player: 14) //total 14 player
arrange_temp(total_player: 9)   // 9 ex-player
arrange_temp(total_player: 5)   // 5 no-ex-player
//final_arrangement-> (3ex,2no-ex)(3ex,2no-ex)(3ex,1no-ex) result is balanced

//create three empty team
var teamDragons = [[String:String]]()
var teamSharks = [[String:String]]()
var teamRaptors = [[String:String]]()

//make arrange plan for players
let arrange_plan = arrange_temp(total_player: Double(players.count))
let group_oneLimit = arrange_plan.0
let group_twoLimit = arrange_plan.1
let group_threeLimit = arrange_plan.2

//classfiy different type player
let numOftypePlayer = get_experience_number(players: players)
let arrange_experience = arrange_temp(total_player: Double(numOftypePlayer.1))
let arrange_non_experience = arrange_temp(total_player: Double(numOftypePlayer.0))


func add_experience_player(from team:[[String:String]],
                arrange_plan:(Int,Int,Int)) ->([[String:String]],[[String:String]],[[String:String]]){
                                
    var team_one = [[String:String]]()
    var team_two = [[String:String]]()
    var team_three = [[String:String]]()
    var count_groupOne_index = 0
    while count_groupOne_index < arrange_plan.0  {
        team_one.append(team[count_groupOne_index])
        count_groupOne_index += 1
    }
    let count_oneStop = count_groupOne_index + arrange_plan.1
    while count_groupOne_index < count_oneStop {
        team_two.append(team[count_groupOne_index])
        count_groupOne_index += 1
    }
    let count_twoStop = count_groupOne_index + arrange_plan.2
    
    while count_groupOne_index < count_twoStop {
        team_three.append(team[count_groupOne_index])
        count_groupOne_index += 1
    }
   
    return (team_one,team_two,team_three)
}

// According to balanced plan, add experience player into each tempoary team.
var team_oneTemp = add_experience_player(from: ex_team, arrange_plan: arrange_experience).0
var team_twoTemp = add_experience_player(from: ex_team, arrange_plan: arrange_experience).1
var team_threeTemp = add_experience_player(from: ex_team, arrange_plan: arrange_experience).2


// Accoding to balanced plan, add non-experience player into team which already contain experience player.
var count_groupOne_index = 0
while count_groupOne_index < arrange_non_experience.0  {
    team_oneTemp.append(nonEx_team[count_groupOne_index])
    count_groupOne_index += 1
}
let a = count_groupOne_index + arrange_non_experience.1
while count_groupOne_index < a {
 team_twoTemp.append(nonEx_team[count_groupOne_index])
    count_groupOne_index += 1
}
let b = count_groupOne_index + arrange_non_experience.2
while count_groupOne_index < b {
   team_threeTemp.append(nonEx_team[count_groupOne_index])
    count_groupOne_index += 1
}
// Result
teamDragons = team_oneTemp
teamSharks = team_twoTemp
teamRaptors = team_threeTemp

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

for player in teamSharks {
    let letter = generate_letter(player: player, game_time: SharksTime, team: "team Sharks")
    letters.append(letter)
}
for player in teamDragons {
    let letter = generate_letter(player: player, game_time: SharksTime, team: "team Dragons")
    letters.append(letter)
}
for player in teamRaptors {
    let letter = generate_letter(player: player, game_time: SharksTime, team: "team Raptors")
    letters.append(letter)
}
for letter in letters {
    print(letter)
}

