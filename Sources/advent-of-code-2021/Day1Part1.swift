import Foundation
import ArgumentParser

extension Command {
  struct Day1Part1: ParsableCommand {
    static var configuration: CommandConfiguration {
      .init(
        commandName: "day1part1",
        abstract: "Counts number of larger than previous in number array"
      )
    }

    // @Argument(help: "JSON containing the array of nums to check")
    // var numsArrayJSON: String

    func run() throws {
      // let resp = loadJson(filename: numsArrayJSON)
      // print(resp)

      // guard let sampleInput = loadJson(filename: numsArrayJSON) as? [Int] else {
      //   print("Issue decoding json")
      //   return
      // }
      // print(sampleInput)
      // let contents = try String(contentsOfFile: numsArrayJSON)
      // let lines = contents.split(separator:"\n")
      // print(lines)

      // let j = try! JSONParser(text: numsArrayJSON).flatten()
      // let nums = j["numbers"] as! [Int]
      // print(nums)


// let file = numsArrayJSON //this is the file. we will write to and read from it

// if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {

//     let fileURL = dir.appendingPathComponent(file)

//     //reading
//     do {
//       print(fileURL)
//         let text2 = try String(contentsOf: fileURL, encoding: .utf8)
//         print(text2)
//     }
//     catch {print("error")}
        let sampleInput = [		
            199,
            200,
            208,
            210,
            200,
            207,
            240,
            269,
            260,
            263
        ]

        let answer = countLargerThanPrevious(nums: sampleInput)
        print(answer)
// }

    }

    func countLargerThanPrevious(nums: [Int]) -> Int{
        var bigger = 0
        for (index, num) in nums.enumerated() {
            if index > 0 && num > nums[index-1] {
                bigger += 1
            }
        }
        return bigger
    }

  }
}

// private func readLocalFile(forName name: String) -> Data? {
//     do {
//         if let bundlePath = Bundle.main.path(forResource: name,
//                                              ofType: "json"),
//             let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
//             return jsonData
//         }
//     } catch {
//         print(error)
//     }
    
//     return nil
// }

// struct ResponseData: Decodable {
//     var numbers: [Int]
// }

// func loadJson(filename fileName: String) -> [Int]? {
//     if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
//       print("goose")
//         do {
//             let data = try Data(contentsOf: url)
//             let decoder = JSONDecoder()
//             let jsonData = try decoder.decode(ResponseData.self, from: data)
//             return jsonData.numbers
//         } catch {
//             print("error:\(error)")
//         }
//     }
//     return nil
// }