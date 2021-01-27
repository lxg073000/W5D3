require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end
    

class Users
  attr_accessor :id, :fname, :lname

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM users")
    data.map { |table|  Users.new(table) }   
  end

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end
  
  # def [](id)
  #   self[]
  # end

  def self.find_by_id(<<-SQL


    SQL
  end


end

class Questions
  attr_accessor :id, :title, :body, :author_id

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM questions")
    data.map { |table|  Questions.new(table) }   
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @author_id = options['author_id']
  end  
end

class Question_follows
  attr_accessor :id, :question_id, :user_id

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM question_follows")
    data.map { |table|  Question_follows.new(table) }   
  end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @user_id = options['user_id']
  end  
end

class Replies
  attr_accessor :id, :body, :question_id, :parent_reply_id, :author_id

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM replies")
    data.map { |table|  Replies.new(table) }   
  end

  def initialize(options)
    @id = options['id']
    @body = options['body']
    @question_id = options['question_id']
    @parent_reply_id = options['parent_reply_id']
    @author_id = options['author_id']
  end  
end

class Question_likes
  attr_accessor :id, :likes, :question_id, :user_id

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM question_likes")
    data.map { |table|  Question_likes.new(table) }   
  end

  def initialize(options)
    @id = options['id']
    @likes = options['likes']
    @question_id = options['question_id']
    @user_id = options['user_id']
  end  
end

