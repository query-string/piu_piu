require "spec_helper"

describe Lumos::LeftMessage do
  context "messages" do
    it "returns wrapped message" do
      expect(described_class.new(message: "Engorgio").message).to eq("# Engorgio")
    end

    it "returns multiline message" do
      expect(described_class.new(message: "Coffee has long had a reputation as being unhealthy. But in almost every single respect that reputation is backward. The potential health benefits are surprisingly large.").message).to eq("Real case here")
    end
  end

  context "paddings" do
    it "returns zero-digit padding message" do
      expect(described_class.new(message: "Episkey", padding: 0).message).to eq("#Episkey")
    end

    it "returns 1-digit padding message" do
      expect(described_class.new(message: "Episkey", padding: 1).message).to eq("# Episkey")
    end

    it "returns 2-digits padding message" do
      expect(described_class.new(message: "Episkey", padding: 2).message).to eq("#  Episkey")
    end
  end

  it "returns delimiter message" do
    expect(described_class.new(message: "Ennervate", delimiter: "☭").message).to eq("☭ Ennervate")
  end
end