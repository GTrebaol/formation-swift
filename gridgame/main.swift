let map = Map(10)
let menu = """
1 - Déplacement par entiers
2 - Déplacement par caractères
3 - Déplacement par doubles
"""

print("Choississez un token")
print(menu)
var choix = Int(readLine()!) ?? 1
var token : Token = Token(choix)


repeat{
    map.display()
    print("Déplacez vous en saisissant une valeur parmi : ")
    print(token.choosenToken.1)
    let deplacement = readLine()!
    switch(choix){
        case 1:
            map.move(Int(deplacement))
        case 2:
            map.move(deplacement)
        case 3:
            map.move(Double(deplacement))
        default:
            break;
    }

}while(!map.isArrived())