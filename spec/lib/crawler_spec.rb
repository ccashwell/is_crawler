describe Crawler do
  let(:user_agent) { "Commodo Vestibulum/1.0" }
  describe '.matches_any?' do
    subject { Crawler.matches_any?(user_agent) }

    context 'When an unknown user agent is encountered' do
      it { should be_false }
    end

    context 'When a known user agent is encountered' do
      Crawler.all.each do |crawler|
        context "such as the #{crawler.name.to_s} bot" do
          let(:user_agent) { "#{crawler.ua_string}" }
          it { should be_true }
        end
      end
    end
  end

  describe '#matches?' do
    Crawler.all.each do |crawler|
      describe "Comparing #{crawler.name.to_s}'s known UA string" do
        subject { crawler.matches?(user_agent) }
        context "with a string containing '#{crawler.ua_string}'" do
          let(:user_agent) { "Mozilla/5.0 #{crawler.ua_string}/1.1 (KHTML, like Gecko)" }
          it { should be_true }
        end

        context 'with a non-matching string' do
          it { should be_false }
        end
      end
    end
  end

  describe '#which_crawler' do
    subject { Crawler.which_crawler(user_agent) }
    context 'When the provided string matches a crawler' do
      let(:user_agent) { "facebookexternalhit/1.1" }
      it { should be :facebook }
    end

    context 'When the provided string matches no crawlers' do
      it { should be_nil }
    end
  end

  describe 'Custom Crawler' do
    let(:custom_crawler) { Crawler.new(:custom, "Custom/1.0") }
    before { Crawler::CUSTOM << custom_crawler }
    context '.matches_any' do
      subject { Crawler.matches_any?(user_agent) }
      context 'When the provided string matches the custom crawler' do
        let(:user_agent) { "Custom/1.0" }
        it { should be_true }
      end

      context 'When the provided string does not match the custom crawler' do
        it { should be_false }
      end
    end

    context '.which_crawler' do
      subject { Crawler.which_crawler(user_agent) }
      context 'When the provided string matches the custom crawler' do
        let(:user_agent) { "Custom/1.0" }
        it { should be custom_crawler.name }
      end

      context 'When the provided string does not match the custom crawler' do
        it { should_not be custom_crawler.name }
      end
    end

    context '#matches?' do
      subject { custom_crawler.matches?(user_agent) }
      context 'When the provided string matches the custom crawler' do
        let(:user_agent) { "Custom/1.0" }
        it { should be_true }
      end

      context 'When the provided string does not match the custom crawler' do
        it { should be_false }
      end
    end
  end
end
