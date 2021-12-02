
import ArgumentParser

extension Command {
  struct Add: ParsableCommand {
    static var configuration: CommandConfiguration {
      .init(
        commandName: "add",
        abstract: "Sums two numbers"
      )
    }

    @Argument(help: "The first number")
    var factor1: Double

    @Argument(help: "The second number")
    var factor2: Double

    func run() throws {
      let sum = self.factor1 + self.factor2
      print("\(self.factor1)+\(self.factor2)=\(sum)")
    }

  }
}