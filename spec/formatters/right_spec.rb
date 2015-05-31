# encoding: utf-8
require "spec_helper"

describe Lumos::Formatters::Right do
  context "messages" do
    it "returns wrapped message" do
      expect(described_class.new(message: "Ferula").result).to eq("Ferula #")
    end

    it "returns multiline message" do
      expect(described_class.new(message: "Coffee has long had a reputation as being unhealthy. But in almost every single respect that reputation is backward. The potential health benefits are surprisingly large.").result).to eq("Coffee has long had a reputation as being unhealthy. But in almost eve #\nry single respect that reputation is backward. The potential health be #\nnefits are surprisingly large.                                         #")
    end

    it "returns multiline message with defined length" do
      expect(described_class.new(message: "Coffee has long had a reputation as being unhealthy. But in almost every single respect that reputation is backward. The potential health benefits are surprisingly large.", length: 35).result).to eq("Coffee has long had a reputation as #\n being unhealthy. But in almost eve #\nry single respect that reputation i #\ns backward. The potential health be #\nnefits are surprisingly large.      #")
    end
  end

  context "paddings" do
    it "returns zero-padding message" do
      expect(described_class.new(message: "Finite Incantatum", padding: 0).result).to eq("Finite Incantatum#")
    end

    it "returns 1-digit padding message" do
      expect(described_class.new(message: "Finite Incantatum", padding: 1).result).to eq("Finite Incantatum #")
    end

    it "returns 2-digits padding message" do
      expect(described_class.new(message: "Finite Incantatum", padding: 2).result).to eq("Finite Incantatum  #")
    end
  end

  it "returns delimiter message" do
    expect(described_class.new(message: "Fidelius", delimiter: "->").result).to eq("Fidelius ->")
  end

end