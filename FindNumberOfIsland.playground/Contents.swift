import UIKit


// O (n^2) dfs O(|V| + |E|)

//Inputs

//[[1,1,0],[1,0,0],[0,0,1]] => [3,1]
//var matrix: [[Int]] = [[1,1,0],[1,0,0],[0,0,1]]

//[[1,1],[1,0]] => [3]
//var matrix: [[Int]] = [[1,1],[1,0]]

//[[1,0,1],[0,0,0],[0,1,1]] => [1,1,2]
var matrix: [[Int]] = [[1,0,1],[0,0,0],[0,1,1]]

let arrayOfIslands = findIslands(matrix: &matrix)
print("array:= \(arrayOfIslands)")

func findIslands(matrix: inout [[Int]]) -> [Int] {
    var result = [Int]()
    
    if matrix.isEmpty {
        return []
    }
    
    let matrixSize = matrix.first!.count
    
    for i in 0...matrixSize {
        for j in 0...matrixSize {
            let value = dfs(matrix: &matrix, i:i, j:j ,size:matrixSize)
            if value > 0 {
                result.append(value)
            }
        }
    }
    
    return result
}
    
func dfs(matrix: inout [[Int]], i: Int, j: Int, size: Int) -> Int {
    
    if (i >= size || j >= size || i < 0 || j < 0){
        return 0
    }
    var count = 0
 
    if (matrix[i][j] == 1) {
        matrix[i][j] = 0
        count = count + 1
        count = count + dfs(matrix: &matrix, i: i+1, j: j, size: size)
        count = count + dfs(matrix: &matrix, i: i-1, j: j, size: size)
        count = count + dfs(matrix: &matrix, i: i, j: j+1, size: size)
        count = count + dfs(matrix: &matrix, i: i, j: j-1, size: size)
    }
    return count
}



