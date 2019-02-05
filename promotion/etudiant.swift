import Foundation

class Etudiant: Personne{
    var _wantedSection: Section
    var _grade: Double
    var _isPlaced: Bool

    
    init(_ tupleStudent: (String, String, Double)) {
        _wantedSection = Section(rawValue:tupleStudent.1)!
        _grade = tupleStudent.2
        _isPlaced = false
        super.init(tupleStudent.0)
    }

    override var description: String {
        return _name;
    }
    
}