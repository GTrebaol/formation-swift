class StartApp{
    lazy var loader = Loader()
    var etudiants:Array<Etudiant> = []
    var etudiantsSansPromotion :Array<Etudiant> = []
    var promotionScientifique: Promotion
    var promotionEconomie: Promotion
    var promotionLitteraire: Promotion


    init() {
        promotionScientifique = Promotion(Section.Scientifique, 14.0, 4, [])
        promotionEconomie = Promotion(Section.Economie, 16.0, 100, [])
        promotionLitteraire = Promotion(Section.Litteraire, 0, 10, [Section.Scientifique, Section.Economie])

        etudiants = loader.chargementEtudiants()
    }
    

    func start() {
        promotionScientifique.fetchEtudiants(etudiants)
        promotionEconomie.fetchEtudiants(etudiants)
        promotionLitteraire.fetchEtudiants(etudiants)
        for etudiant in etudiants {
            if(!etudiant._isPlaced){
                etudiantsSansPromotion.append(etudiant)
            }
        }
    }

    func conclusion() {
        promotionScientifique.displayStudents()
        promotionEconomie.displayStudents()
        promotionLitteraire.displayStudents()
        print("il reste \(etudiantsSansPromotion.count) etudiants sans promotion")
    }
}

var myStartApp = StartApp()
myStartApp.start()
myStartApp.conclusion()