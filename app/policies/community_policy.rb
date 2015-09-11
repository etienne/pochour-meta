class CommunityPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def show?
    record.users.include? user or record.public
  end
  
  def edit?
    record.users.include? user
  end

  def update?
    edit?
  end
end
