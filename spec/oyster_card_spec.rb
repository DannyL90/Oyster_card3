require 'oyster_card'

describe OysterCard do

  it "Oyster card default balance" do
    expect(subject.balance).to eq(0)
  end

  describe "#top_up" do
    it "Top up the card" do
      # subject.top_up(10)
      # expect(subject.balance).to eq(10)
      expect{ subject.top_up 1 }.to change { subject.balance }.by 1
    end

    it "raises an error when the balace reaches £90" do
      # subject.top_up(90)
      # expect { subject.top_up 1 }.to raise_error "The maximum limit of £90 is reached"
      maximum_balance = OysterCard::DEFAULT_LIMIT
      subject.top_up(maximum_balance)
      expect{ subject.top_up 1 }.to raise_error "The maximum limit of £#{maximum_balance} is reached"
    end
  end

  it "deduct amount from a balance" do
    subject.top_up(10)
    expect{ subject.deduct 1 }.to change { subject.balance }.by -1
  end

  describe "#touch_in" do
    it "touches in oyster card" do
      subject.top_up(10)
      expect(subject.touch_in).to eq true
    end

    it "raises error when your balance less then £1" do
      expect{ subject.touch_in }.to raise_error "Not enough fund"
    end
  end

  it "touches out oyster card" do
    subject.top_up(10)
    subject.touch_in
    expect(subject.touch_out).to eq false
  end

  it "return true if 'In use'" do
    subject.top_up(10)
    subject.touch_in
    expect(subject.in_journey?).to eq true
  end

end