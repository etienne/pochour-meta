class ArticlePolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def show?
    record.community.users.include? user or record.community.public
  end
  
  def edit?
    record.community.users.include? user
  end

  def update?
    edit?
  end
end
