describe IsCrawler do
  describe '#is_any_crawler?' do
    let(:user_agent) { "Commodo Vestibulum/1.0" }
    subject { Test.new.is_any_crawler?(user_agent) }
    it 'defers to Crawler#matches_any?' do
      Crawler.should_receive(:matches_any?).with(user_agent)
      subject
    end
  end
end

class Test; include IsCrawler; end
