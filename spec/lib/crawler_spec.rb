describe Crawler do
  describe '.matches_any?' do
    let(:user_agent) { "Commodo Vestibulum/1.0" }
    subject { Crawler.matches_any?(user_agent) }

    context 'When an unknown user agent is encountered' do
      it { should be_false }
    end

    context 'When a known user agent is encountered' do
      Crawler::ALL.each do |crawler|
        context "such as the #{crawler.name.to_s} bot" do
          let(:user_agent) { "#{crawler.ua_string}" }
          it { should be_true }
        end
      end
    end
  end

  describe '#matches?' do
    Crawler::ALL.each do |crawler|
      describe "Comparing #{crawler.name.to_s}'s known UA string" do
        it 'with a matching string' do
          crawler.matches?(crawler.ua_string).should == true
        end

        it 'with a non-matching string' do
          crawler.matches?('Commodo Vestibulum/1.0').should == false
        end
      end
    end
  end
end
