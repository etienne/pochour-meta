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
    record.user == user
  end

  def update?
    edit?
  end
  
  def destroy?
    edit?
  end
end
