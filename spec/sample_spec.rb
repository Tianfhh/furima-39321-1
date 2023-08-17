RSpec.describe "簡単なテストコード" do
  describe "数字の計算" do
    it "1 + 1は2である" do
      expect(1 + 1).to eq(2)
    end
  end
  describe "文字列の結合" do
    it "「カレー」と「ライス」をつなげるとカレーライスになること" do
      expect("カレー" + "ライス").to eq("カレーライス")
    end
  end
end