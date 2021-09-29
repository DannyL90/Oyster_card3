require "station"

describe Station do
  let(:station) { double("Station", zone: 1, name: "Oxford Circus") }

  it "confirms the zone" do
    expect(station.zone).to eq 1
  end

  it "confirms the name" do
    expect(station.name).to eq "Oxford Circus"
  end
end