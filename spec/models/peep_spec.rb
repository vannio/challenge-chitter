describe Peep do
  describe "#extract_hashtags" do
    let!(:user) { create_user }

    it "should recognise hashtag in a peep and create a hashtag" do
      peep = described_class.create(
        text: "Example #peep",
        timestamp: Time.new(2000, 01, 01),
        user: user
      )

      p peep

      expect { peep.extract_hashtags }.to change { Hashtag.all.count }.by(1)
    end
  end
end
