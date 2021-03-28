# "存錢" 
# "可以存錢"
# "不可以存 0 元或是小於 0 元的金額（越存錢越少！）" 

# "領錢" 
# "可以領錢"
# "不能領 0 元或是小於 0 元的金額（越領錢越多！）"
# "不能領超過本身餘額" 

require './atm'

RSpec.describe ATM do
	context "存錢" do
		it "可以存錢" do
			atm = ATM.new(10)
			atm.deposit(5)
			expect(atm.balance).to be 15
		end

		it "不可以存 0 元或是小於 0 元的金額（越存錢越少！）" do
			atm = ATM.new(10)
			atm.deposit(-5)
			expect(atm.balance).to be 10
		end
	end

	context "領錢" do
		it "可以領錢" do 
			atm = ATM.new(10)
			money = atm.withdraw(5)
			expect(atm.balance).to be 5
			expect(money).to be 5
		end

		it "不能領 0 元或是小於 0 元的金額（越領錢越多！)" do
			atm = ATM.new(10)
			money = atm.withdraw(-5)
			expect(atm.balance).to be 10
			expect(money).to be 0
		end

		it "不能領超過本身餘額" do
			atm = ATM.new(10)
			money = atm.withdraw(15)
			expect(atm.balance).to be 10
			expect(money).to be 0
		end
	end
end