describe ActionView::OutputBuffer do
  describe '#<<' do
    it 'escapes angular braces' do
      expect((subject << "{{unsafe}}").to_s).to eq("{{ $root.DOUBLE_LEFT_CURLY_BRACE }}unsafe}}")
    end

    it 'does not change behavior for already HTML safe strings' do
      expect((subject << "{{safe}}".html_safe).to_s).to eq("{{safe}}")
    end

    it 'allows concatting nil' do
      expect { subject << nil }.to_not raise_error
    end
  end

  describe '#concat' do
    it 'escapes angular braces' do
      expect((subject.concat "{{unsafe}}").to_s).to eq("{{ $root.DOUBLE_LEFT_CURLY_BRACE }}unsafe}}")
    end

    it 'does not change behavior for already HTML safe strings' do
      expect((subject.concat "{{safe}}".html_safe).to_s).to eq("{{safe}}")
    end

    it 'allows concatting nil' do
      expect { subject.concat nil }.to_not raise_error
    end
  end

  describe '#append=' do
    it 'escapes angular braces' do
      subject.append = "{{unsafe}}"
      expect(subject.to_s).to eq("{{ $root.DOUBLE_LEFT_CURLY_BRACE }}unsafe}}")
    end

    it 'does not change behavior for already HTML safe strings' do
      subject.append = "{{safe}}".html_safe
      expect(subject.to_s).to eq("{{safe}}")
    end

    it 'allows concatting nil' do
      expect { subject.append = nil }.to_not raise_error
    end
  end
end
