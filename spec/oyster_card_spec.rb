require 'oyster_card'

describe OysterCard do

  it "Oyster card default balance" do
    expect(subject.balance).to eq(0)
  end

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

  it "deduct amount from a balance" do
    subject.top_up(10)
    expect{ subject.deduct 1 }.to change { subject.balance }.by -1
  end


end