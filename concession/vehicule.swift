class Vehicule {

    var type : String
    var marque : String
    var options : [String]?
    

    
    init(_ vehicule:(String, String, [String])) {
        self.type = vehicule.0
        self.marque = vehicule.1
        self.options = vehicule.2
    }

    var description: String {
        var string : String = ""
        string += marque
        guard let unwrappedOption = options else {
            return string
        }
        string += " avec les options : "
        for option in unwrappedOption {
            string += option
            string += ", "
        }
        return string
    }

    
    subscript(optionsRequired : [String]) -> Vehicule? {
        for option in optionsRequired {
            if !(options!.contains(option)){
                return nil
            }
        }
        return self
    }
    
    
}