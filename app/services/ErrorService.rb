class ErrorService
  class << self
    def notify(ex, ctx_hash)
      puts "Uh oh, An error with message #{ex.message} has occured."
    end
  end
end
