describe IsCrawler do
  let(:user_agent) { "Commodo Vestibulum/1.0" }

  describe '#is_crawler?' do
    context 'When specific crawlers are provided' do
      subject { Test.new.is_crawler?(user_agent, :facebook, :google) }
      context 'and the provided string matches a crawler' do
        context 'and it is in the specified list' do
          context 'as the first element' do
            let(:user_agent) { "facebookexternalhit/1.1" }
            it { is_expected.to be true }
          end

          context 'as a subsequent element' do
            let(:user_agent) { "Googlebot/1.1" }
            it { is_expected.to be true }
          end
        end

        context 'but it is not in the specified list' do
          let(:user_agent) { "Twitterbot/1.1" }
          it { is_expected.to be false }
        end
      end

      context 'but the provided string matches no crawlers' do
        it { is_expected.to be false }
      end
    end

    context 'When no specific crawlers are provided' do
      subject { Test.new.is_crawler?(user_agent) }
      it 'defers to Crawler#matches_any' do
        expect(Crawler).to receive(:matches_any?).with(user_agent)
        subject
      end
    end
  end

  Crawler.all.each do |crawler|
    describe "#is_#{crawler.name}_crawler?" do
      let(:crawler) { Crawler.all.first }
      subject { Test.new.send("is_#{crawler.name}_crawler?", user_agent) }
      it "provides method sugar for each crawler" do
        expect(subject).to be false
      end
    end
  end
end

class Test; include IsCrawler; end
