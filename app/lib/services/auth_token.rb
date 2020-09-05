class EncodeTokenService
  def self.fire(user_id)
    JsonWebToken.encode user_id: user_id
  end
end

class DecodeTokenService
  def self.fire(token)
    JsonWebToken.decode(token)
  end
end
