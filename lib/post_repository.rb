class PostRepository
  def all
    sql = 'SELECT * FROM posts'
    result_set = DatabaseConnection.exec_params(sql, [])
    posts = []

    result_set.each do |result|
      post = Post.new
      post.id = result['id']
      post.title = result['title']
      post.content = result['content']
      post.views = result['views']
      post.user_account_id = result['user_account_id']
      posts << post
    end
    posts
  end

  def find(id)
    sql = 'SELECT * FROM posts WHERE id = $1'
    result = DatabaseConnection.exec_params(sql, [id])[0]
    post = Post.new
    post.id = result['id']
    post.title = result['title']
    post.content = result['content']
    post.views = result['views']
    post.user_account_id = result['user_account_id']
    post
  end

  def delete(id)
    sql = 'DELETE FROM posts WHERE id = $1'
    DatabaseConnection.exec_params(sql, [id])
  end

  def create(post)
    sql = 'INSERT INTO posts (id, title, content, views, user_account_id) VALUES ($1, $2, $3, $4, $5)'
    params = [post.id, post.title, post.content, post.views, post.user_account_id]
    DatabaseConnection.exec_params(sql, params)
  end
end