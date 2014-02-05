class LockCode

  def self.set code
    App::Persistence["screen_lock_code"] = code
  end

  def self.get
    App::Persistence["screen_lock_code"]
  end

  def self.enabled?
    !!get
  end

  def self.disabled?
    !self.enabled?
  end

  def self.matches? input_code
    LockCode.get == input_code 
  end

  def self.does_not_match? input_code
    !matches?(input_code)
  end

end
