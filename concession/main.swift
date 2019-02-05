import Foundation

class StartApp{

    let clients = [(souhait: ["marque": "Peugeot", "type": "Voiture"], nom: "Hector"),
        (souhait: ["marque":"Nissan", "type":"Voiture", "options":["Climatisation", "Direction assistée", "Navigation GPS"]], nom:"Elsa"),
        (souhait: ["marque":"Citroën", "type":"Voiture", "options":["Park assist"]], nom: "Albert"),
        (souhait: ["marque":"Nissan", "type":"Voiture", "options":["Park assist", "Navigation GPS"]], nom: "Anna")]

    var concession : Concession = Concession()
    func start(){
        for client in clients {
            let marqueSouhaitee : String = client.souhait["marque"] as! String
            let nomClient : String = client.nom
            let optionsSouhaitees : [String]? = client.souhait["options"] as? [String]
            print("Un nouveau client est arrivé : \(nomClient)")
            print("Il recherche un véhicule de la marque \(marqueSouhaitee)")
            print("Recherche d'un véhicule en cours...")
            sleep(2)
            guard let voitureTrouve = concession[marqueSouhaitee, optionsSouhaitees] else {
                print("Ho noooooon, aucune voiture n'a été trouvée pour \(nomClient)...")
                print("Au suivant !")
                print("\n")
                sleep(1)
                continue;
            }
            print("Félicitations, une voiture \(voitureTrouve.description) trouvée pour \(nomClient)")
            print("Au suivant !")
            print("\n")
            sleep(1)
        }
        print("Plus de client, fin de journée, tchâo !")
    }
}

var myStartApp = StartApp()
myStartApp.start()