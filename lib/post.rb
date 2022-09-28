class Post
  def initialize(id = 0, title = '', content = '', views = 0, user_account_id = 0)
    @id, @title, @content, @views, @user_account_id = [id, title, content, views, user_account_id]
  end
  attr_accessor :id, :title, :content, :views, :user_account_id
end