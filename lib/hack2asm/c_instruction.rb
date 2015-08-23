module Hack2asm
  module CInstruction
    def self.translate(instruction)
      matched = /(.+=)?([^;]+)(;([A-Z]+))?/.match(instruction)
      destination = matched[1]
      computation = matched[2]
      jump = matched[4]

      bytecode = '1110000000000000'
      bytecode[3..9] = ComputationTranslator.translate(computation)
      bytecode[10..12] = DestinationTranslator.translate(destination)
      bytecode[13..15] = JumpTranslator.translate(jump)

      bytecode
    end
  end
end