describe AngularXss::Escaper do
  describe '.escape' do
    it 'replaces double braces with a closed variant' do
      expect(described_class.escape('{{')).to eq('{{ $root.DOUBLE_LEFT_CURLY_BRACE }}')
    end

    it 'does not handle HTML safe strings differently' do
      expect(described_class.escape('{{'.html_safe)).to eq('{{ $root.DOUBLE_LEFT_CURLY_BRACE }}')
    end
  end

  describe '.escape_if_unsafe' do
    it 'replaces double braces with a closed variant' do
      expect(described_class.escape_if_unsafe('{{')).to eq('{{ $root.DOUBLE_LEFT_CURLY_BRACE }}')
    end

    it 'does not modify HTML safe strings' do
      expect(described_class.escape_if_unsafe('{{'.html_safe)).to eq('{{')
    end
  end
end
