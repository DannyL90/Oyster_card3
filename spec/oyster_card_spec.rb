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
    subject.top_up(90)
    expect { subject.top_up 1 }.to raise_error "The maximum limit of £90 is reached"
  end


end