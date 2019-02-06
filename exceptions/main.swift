import Foundation

enum ErreurMachine: Error{
    case ErreurMachineInconnue(message : String)
    case ErreurMachineEnPanne(message : String, machine : Machine)
}


class Machine{

    let erreurALancer: ErreurMachine
    var tentativeRedemarrageMax : Int = 3
    var isEnPanne = false

    init(_ err: ErreurMachine = .ErreurMachineInconnue(message : "Erreur machine inconnue")){
        erreurALancer = err
    }

    func fonctionner() throws {
        if(!isEnPanne){
            print()
            print("La \(self.description) est en marche")
            let randomPanne = Int.random(in: 0 ..< 10)
            sleep(2)
            
            switch randomPanne{
                case 0...5:
                    isEnPanne = true
                    throw ErreurMachine.ErreurMachineEnPanne(message : "La \(self.description) est en panne :(", machine : self)
                case 5...10:
                    fallthrough
                default:
                    break
            }
        }else{
            print()
            print("La \(self.description) est en panne")
            isEnPanne = tentativeRedemarrage()
        }
    }

    var description: String {
        return "Machine"
    }

    func tentativeRedemarrage() -> Bool{
        print("Tentative de redémarrage de la \(self.description)")
        sleep(1)
        let randomDemarrage = Int.random(in: 0 ..< 3)
        let isRedemarrageSucess = randomDemarrage < 2 && tentativeRedemarrageMax > 0
        if !isRedemarrageSucess{
            tentativeRedemarrageMax -= 1
        }

        print(isRedemarrageSucess ? "Redemarrage réussi !" : "Redemarrage en echec...")
        print("Tentatives restantes : \(tentativeRedemarrageMax)")
        return isRedemarrageSucess
    }

}

class MachineFermentation: Machine{
    override var description: String {
        return "machine de fermentation"
    }
}

class MachinePasteurisation: Machine{
    override var description: String {
        return "machine de pasteurisation"
    }

}

class MachineEmballage: Machine{
    override var description: String {
        return "machine d'emballage"
    }

}

class ChaineProduction{

    public func faireFonctionnerChaine() {
        let machine1 = MachineEmballage()
        let machine2 = MachineFermentation()
        let machine3 = MachinePasteurisation()
        var pannes : Int = 0
        while(pannes < 3){
            do {
                try machine1.fonctionner()
                try machine2.fonctionner()
                try machine3.fonctionner()
            }catch ErreurMachine.ErreurMachineEnPanne(message : let message, machine: let machine){
                print(message)
                let succes = machine.tentativeRedemarrage()
                if !succes{
                    pannes += 1
                }
                print("nb machines en panne : \(pannes)")
            }catch ErreurMachine.ErreurMachineInconnue(message : let message){
                print(message)
            }catch{
                print("erreur")
            }
        }
    }
}

var chaine = ChaineProduction()
chaine.faireFonctionnerChaine()