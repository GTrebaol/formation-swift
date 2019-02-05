public class Promotion{
    var _students : [Etudiant] = []
    var _section : Section
    var _capacity: Int
    var _grade : Double
    var _allowedSections : Array<Section>
    var _nbEtudiantMalPlaces: Int = 0
    

    init(_ section: Section, _ grade : Double, _ capacity:Int, _ allowedSections: Array<Section>) {
        self._section = section
        self._capacity = capacity
        self._grade = grade
        self._allowedSections = allowedSections
    }


    func fetchEtudiants(_ students: [Etudiant]) {
        for student in students {
            if !student._isPlaced && _nbEtudiantMalPlaces < 4 && (student._wantedSection == self._section || self._allowedSections.contains(student._wantedSection)) 
            && student._grade >= self._grade && self._students.count < self._capacity {
                if(student._wantedSection != self._section){
                    _nbEtudiantMalPlaces +=  1
                }
                student._isPlaced = true
                _students.append(student)
            }
        }
    }

    func displayStudents(){ 
        print("####################")
        print("PROMOTION \(_section)")
        for student in _students{
            print(student.description)
        }
        print("####################")
    }
    
}