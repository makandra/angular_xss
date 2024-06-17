describe ActiveSupport::SafeBuffer do

  describe '#<<' do
    it 'escapes angular braces' do
      subject << "{{unsafe}}"
      expect(subject.to_s).to eq("{{ $root.DOUBLE_LEFT_CURLY_BRACE }}unsafe}}")
    end

    it 'allows concatting nil' do
      expect { subject << nil }.to_not raise_error
    end
  end

  describe '#+' do
    it 'escapes angular braces' do
      combined_string = subject + "{{unsafe}}"
      expect(combined_string.to_s).to eq("{{ $root.DOUBLE_LEFT_CURLY_BRACE }}unsafe}}")
    end
  end

end
