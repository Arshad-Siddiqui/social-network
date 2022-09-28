class UserAccountRepository
  def all
    sql = 'SELECT * FROM user_accounts'
    result_set = DatabaseConnection.exec_params(sql, [])
    user_accounts = []

    result_set.each do |result|
      user_account = UserAccount.new
      user_account.id = result['id']
      user_account.username = result['username']
      user_account.email = result['email']
      user_accounts << user_account
    end

    user_accounts
  end

  def find(id)
    sql = 'SELECT * FROM user_accounts WHERE id = $1'
    result = DatabaseConnection.exec_params(sql, [id])[0]
    user_account = UserAccount.new
    user_account.id = result['id']
    user_account.username = result['username']
    user_account.email = result['email']
    user_account
  end

  def create(user_account)
    sql = 'INSERT INTO user_accounts (id, username, email) VALUES ($1, $2, $3)'
    params = [user_account.id, user_account.username, user_account.email]
    DatabaseConnection.exec_params(sql, params)
  end

  def delete(id)
    sql = 'DELETE FROM user_accounts WHERE id = $1'
    DatabaseConnection.exec_params(sql, [id])
  end

  def update(column, value, id)
    sql = "UPDATE user_accounts SET #{column} = '#{value}' WHERE id = #{id}"
    DatabaseConnection.exec_params(sql, [])
  end
end