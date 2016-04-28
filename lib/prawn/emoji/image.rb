require 'yaml'

module Prawn
  module Emoji
    class Image
      STORE = Emoji.root.join 'emoji', 'images'

      attr_reader :unicode

      def initialize(unicode)
        @unicode = unicode
      end

      def path
        STORE.join("#{codepoint}.png").to_s
      end

      def ==(other)
        unicode == other.unicode
      end

      private

      def codepoint
        @codepoint ||= @unicode.codepoints.map { |c| format_codepoint(c) }.join.upcase
      end

      def format_codepoint(codepoint)
        codepoint = codepoint.to_s(16)
        codepoint = "00#{codepoint}" if codepoint.size == 2
        codepoint
      end
    end
  end
end
