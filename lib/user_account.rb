class UserAccount
  def initialize(id = 0, email = '', username = '')
    @id, @email, @username = id, email, username
  end
  attr_accessor :id, :email, :username
end

#example (5, 'jimBob12@gmail.com', 'BobJim12')