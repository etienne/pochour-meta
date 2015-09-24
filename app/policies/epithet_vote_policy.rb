class EpithetVotePolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def create?
    edit?
  end
  
  def edit?
    Pundit.policy!(user, record.article).show? and record.user == user
  end

  def destroy?
    edit?
  end
end
