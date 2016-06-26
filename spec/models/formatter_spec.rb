describe Formatter do
  subject { described_class }

  let(:peep_input) do
    "@one lorem @two ipsum http://test.com #one#two"
  end

  let(:time) { Time.new(2016, 06, 26, 22, 10) }

  let(:html_output) do
    "<a href=\"/users/profile/one\">@one</a> lorem "\
    "<a href=\"/users/profile/two\">@two</a> ipsum "\
    "<a href=\"http://test.com\" target=\"_blank\">http://test.com</a> "\
    "<a href=\"/hashtag/one\">#one</a> "\
    "<a href=\"/hashtag/two\">#two</a>"
  end

  describe "#html" do
    it "should turn urls and words after @ or # into links" do
      expect(subject.html(peep_input)).to eq(html_output)
    end
  end

  describe "#date_time" do
    it "should format the date and time, nicely" do
      expect(subject.date_time(time)).to eq("Sunday 26 June 2016, 22:10")
    end
  end
end
