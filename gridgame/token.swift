class Token {
    var tokens : [(Int, [Any])] = [(1, [1,2,3,4]), (2, ["n", "s", "o", "e"]), (3, [1.5, 2.5, 3.5, 4.5])]
    var choosenToken : (Int, [Any]) = (0, [])

    init(_ i : Int){
        for token in tokens{
            if token.0 == i { 
                choosenToken = token
                break
            }
        }
    }
}