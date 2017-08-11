class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount, :completed
  def initialize (sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
    @completed = false
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      true
    else
      false
    end
  end

    def execute_transaction
      if sender.balance > amount && @completed == false
        @sender.balance -= @amount
        @receiver.balance += @amount
        @status = "complete"
        @completed = true
      elsif sender.balance < amount
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    end

    def reverse_transfer
      if @completed == true
        @sender.balance += @amount
        @receiver.balance -= @amount
        @status = "reversed"

      end

    end
end
