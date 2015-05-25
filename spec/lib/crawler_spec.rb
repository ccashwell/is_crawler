describe Crawler do
  let(:chrome_user_agent) { 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17' }
  let(:google_user_agent) { 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)' }
  let(:facebook_user_agent) { 'facebookexternalhit/1.0 (http://www.facebook.com/externalhit_uatext.php)' }

  describe '.matches_any?' do
    subject { Crawler.matches_any?(user_agent) }

    context 'When an unknown user agent is encountered' do
      let(:user_agent) { chrome_user_agent }
      it { is_expected.to be false }
    end

    context 'When a known user agent is encountered' do
      context 'such as the facebook crawler' do
        let(:user_agent) { facebook_user_agent }
        it { is_expected.to be true }
      end

      context 'such as the Googlebot' do
        let(:user_agent) { google_user_agent }
        it { is_expected.to be true }
      end
    end
  end

  describe '#matches?' do
    describe 'Comparing Googlebot\'s known UA string' do
      subject { Crawler.new(:google, 'Googlebot').matches?(user_agent) }
      context "with a matching string" do
        let(:user_agent) { google_user_agent }
        it { is_expected.to be true }
      end

      context 'with a non-matching string' do
        let(:user_agent) { chrome_user_agent }
        it { is_expected.to be false }
      end
    end
  end

  describe '.which_crawler' do
    subject { Crawler.which_crawler(user_agent) }
    context 'When the provided string matches a crawler' do
      let(:user_agent) { facebook_user_agent }
      it { is_expected.to be :facebook }
    end

    context 'When the provided string matches no crawlers' do
      let(:user_agent) { chrome_user_agent }
      it { is_expected.to be_nil }
    end
  end

  describe 'Custom Crawler' do
    let(:custom_crawler) { Crawler.new(:custom, "Custom/1.0") }
    let(:user_agent) { custom_crawler.ua_string }
    before { Crawler::CUSTOM << custom_crawler }
    context '.matches_any' do
      subject { Crawler.matches_any?(user_agent) }
      context 'When the provided string matches the custom crawler' do
        it { is_expected.to be true }
      end

      context 'When the provided string does not match the custom crawler' do
        let(:user_agent) { chrome_user_agent }
        it { is_expected.to be false }
      end
    end

    context '.which_crawler' do
      subject { Crawler.which_crawler(user_agent) }
      context 'When the provided string matches the custom crawler' do
        it { is_expected.to be custom_crawler.name }
      end

      context 'When the provided string does not match the custom crawler' do
        let(:user_agent) { chrome_user_agent }
        it { is_expected.to_not be custom_crawler.name }
      end
    end

    context '#matches?' do
      subject { custom_crawler.matches?(user_agent) }
      context 'When the provided string matches the custom crawler' do
        it { is_expected.to be true }
      end

      context 'When the provided string does not match the custom crawler' do
        let(:user_agent) { chrome_user_agent }
        it { is_expected.to be false }
      end
    end
  end
end
