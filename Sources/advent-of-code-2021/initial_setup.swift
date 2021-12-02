import ArgumentParser

enum Command {}

extension Command {
  struct Main: ParsableCommand {
    static var configuration: CommandConfiguration {
      .init(
        commandName: "advent-of-code-2021",
        abstract: "A cli program to run advent of code 2021 algorithms",
        version: "0.0.1",
        subcommands: [
          Command.Day1Part1.self,
          Command.Day1Part2.self,
        ]
      )
    }
  }
}