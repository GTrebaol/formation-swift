class Concession {

    var parcAutomobile : [Vehicule] = []

    let parcAuto = [(type: "Voiture", marque:"Nissan", options:["Park assist", "Navigation GPS"]), 
                (type: "Voiture", marque: "Peugeot", options:["Climatisation", "Radio, CD, MP3, Bluetooth"]),
                (type: "Voiture", marque: "Nissan", options:["Climatisation", "Radio, CD, MP3, Bluetooth", "Direction assistée"]),
                (type: "Voiture", marque: "Citroën", options:["Climatisation", "Navigation GPS", "Direction assistée"])]


    init(){
        for vehicule in parcAuto {
            parcAutomobile.append(Vehicule(vehicule))
        }
    }

    
    subscript(marque : String, options : [String]?) -> Vehicule? {
        get{
            for vehicule in parcAutomobile {
                if marque == vehicule.marque {
                    guard let unwrappedOptions = options else{
                        return vehicule
                    }
                    return vehicule[unwrappedOptions]
                }
            }
            return nil
        }
        set{

        }
    }
    
    
    
}