module Hack2asm
  module JumpTranslator
    def self.translate(jump)
      bytecode = @@translation_table[jump]
      raise ParserError if bytecode.nil?

      bytecode
    end

    private
    @@translation_table = {
      nil => '000',
      'JNE' => '101'
    }
  end
end