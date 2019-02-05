import Foundation
class Map{

    var _size : Int = 10
    var _board : [[String]] = []
    var _playerPosition : (Int, Int) = (0,0)
    var _endindPoint : (Int, Int) = (0,0)

    
    init(_ size : Int) {
        _playerPosition = (Int.random(in:0...size-1), Int.random(in:0...size-1))
        repeat {
            _endindPoint = (Int.random(in:0...size-1), Int.random(in:0...size-1))
        }while(_playerPosition == _endindPoint)

        for i in 0..<_size{
            _board += [[]]
            for _ in 0..<_size {
                _board[i] += ["\u{25A1}"]
            }
        }
        _size = size
        _board[_endindPoint.0][_endindPoint.1] = "🏁"
        _board[_playerPosition.0][_playerPosition.1] = "\u{2612}"
    }

    func display(){
        print("------------------------------------------------------")
        for i in 0..<_size{
            var mapLine : String = "| "
            for j in 0..<_size {
                mapLine += "  "
                mapLine += _board[i][j]
                mapLine += "  "
            }
            mapLine += " |"
            print(mapLine)
        }
        print("------------------------------------------------------")
    }


    func move(_ value: Any?){
        guard let unwrappedValue = value else{
            return
        }
        switch(unwrappedValue){ 
            //case 5 let classToken = Double.self classToken.init(value) ?? 1.5
            case 1 as Int :
                fallthrough
            case "n" as String:
                fallthrough
            case 1.5 as Double:
                goNorth()

            case 2 as Int:
                fallthrough
            case "s" as String:
                fallthrough
            case 2.5 as Double:
                goSouth()

            case 3 as Int :
                fallthrough
            case "o" as String:
                fallthrough
            case 3.5 as Double:
                goWest()            
                
                
            case 4 as Int :
                fallthrough
            case "e" as String:
                fallthrough
            case 4.5 as Double:
                goEast()
            default:
                goNorth()
        }
    }

    func goNorth(){
        if _playerPosition.0 > 0 {
            _board[_playerPosition.0][_playerPosition.1] = "\u{25A1}"
            _playerPosition.0 -= 1
            _board[_playerPosition.0][_playerPosition.1] = "\u{2612}"

        }
    }

    func goSouth(){
        if _playerPosition.0+1 < _size {
            _board[_playerPosition.0][_playerPosition.1] = "\u{25A1}"
            _playerPosition.0 += 1
            _board[_playerPosition.0][_playerPosition.1] = "\u{2612}"

        }
    }

        func goWest(){
        if _playerPosition.1+1 < _size {
            _board[_playerPosition.0][_playerPosition.1] = "\u{25A1}"
            _playerPosition.1 += 1
            _board[_playerPosition.0][_playerPosition.1] = "\u{2612}"

        }
    }

        func goEast(){
        if _playerPosition.1 > 0 {
            _board[_playerPosition.0][_playerPosition.1] = "\u{25A1}"
            _playerPosition.1 -= 1
            _board[_playerPosition.0][_playerPosition.1] = "\u{2612}"

        }
    }

    func isArrived() -> Bool{
        return _playerPosition.0 == _endindPoint.0 && _playerPosition.1 == _endindPoint.1
    }
    
    
} 