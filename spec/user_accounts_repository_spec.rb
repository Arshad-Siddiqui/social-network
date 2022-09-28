require_relative '../lib/user_account_repository.rb'
require_relative '../lib/user_account.rb'

def reset_user_accounts_repository_table
  seed_sql = File.read('spec/seeds_user_accounts.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network' })
  connection.exec(seed_sql)
end

RSpec.describe UserAccountRepository do
  before(:each) do 
    reset_user_accounts_repository_table
  end

  describe '#all' do
    it 'returns an array of user_account objects' do
      repo = UserAccountRepository.new
      expect(repo.all.first.id).to eq "1"
      expect(repo.all.first.email).to eq 'coolestdude7@gmail.com'
      expect(repo.all.last.id).to eq "4"
    end
  end

  describe '#find' do
    it 'returns a single instance of user_account object from the database' do
      repo = UserAccountRepository.new
      expect(repo.find(1).email).to eq 'coolestdude7@gmail.com'
      expect(repo.find(2).username).to eq 'lightning_lord89'
    end
  end

  describe '#create' do
    it 'takes a user_account object and represents it in the database' do
      repo = UserAccountRepository.new
      user_account = UserAccount.new(5, 'jimBob12@gmail.com', 'BobJim12')
      repo.create(user_account)
      expect(repo.all.last.username).to eq 'BobJim12'
      expect(repo.all.last.id).to eq '5'
      expect(repo.all.last.email).to eq 'jimBob12@gmail.com'

      user_account2 = UserAccount.new(6, 'stevenUniverse@gmail.com', 'steven12')
      repo.create(user_account2)
      expect(repo.all.last.username).to eq 'steven12'
    end
  end

  describe '#delete' do
    it 'removes a user_account from the database' do
      repo = UserAccountRepository.new
      repo.delete(1)
      expect(repo.all.first.username).to eq 'lightning_lord89'
    end
  end

  describe '#update' do
    it 'updates a value on the database' do
      repo = UserAccountRepository.new
      repo.update('username', 'cooldude8', "1")
      expect(repo.all.last.username).to eq 'cooldude8'
    end
  end
end