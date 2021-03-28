class ATM
	attr_reader :balance
	
	def initialize(balance)
		@balance = balance
	end

	def deposit(money)
		@balance += money if money > 0
	end

	def withdraw(money)
		if money > 0 &&  enough?(money)
			@balance -= money 
		else
			0
		end
	end
	
	private
	def enough?(money)
		money <= @balance
	end
end