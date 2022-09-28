require 'post_repository'
require 'post'

def reset_post_repository_table
  seed_sql = File.read('spec/seeds_posts.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network' })
  connection.exec(seed_sql)
end

RSpec.describe PostRepository do
  before(:each) do 
    reset_post_repository_table
  end

  describe '#all' do
    it 'returns a list of all posts' do
      repo = PostRepository.new
      expect(repo.all.first.id).to eq "1"
      expect(repo.all.first.title).to eq 'Good work on this exercise'
    end
  end

  describe '#find' do
    it 'returns a specific post from database' do
      repo = PostRepository.new
      expect(repo.find(1).title).to eq 'Good work on this exercise'
      expect(repo.find(2).content).to eq 'that was a title'
    end
  end

  describe '#delete' do
    it 'removes a post from the database' do
      repo = PostRepository.new
      repo.delete(1)
      expect(repo.all.first.title).to eq 'Some title'
    end 
  end
  
  describe '#create' do
    it 'adds a post to the database' do
      post = Post.new(5, 'Cool title 8', 'cool contents 9', 10, 2)
      repo = PostRepository.new
      repo.create(post)
      expect(repo.all.last.title).to eq 'Cool title 8'
    end
  end

  # describe '#update' do
    
  # end
end
