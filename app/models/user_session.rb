class UserSession < Authlogic::Session::Base
  include ActiveModel::Naming
  def to_key
     new_record? ? nil : [ self.send(self.class.primary_key) ]
  end
  
  def persisted?
    false
  end

  def parents
    []
  end

  def name
    "UserSession"
  end
end