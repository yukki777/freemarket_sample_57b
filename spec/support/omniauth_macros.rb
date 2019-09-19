module OmniauthMacros
  def facebook_mock
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
      {
        provider: 'facebook',
        uid: '12345',
        info: {
          name: 'mockuser',
          email: 'sample@test.com',
          first_name: 'ほげ',
          last_name: 'ふが'
        },
        credentials: {
          token: 'hogefuga'
        }
      }
    )
  end
  def google_oauth2
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(
      {
        provider: 'google_oauth2',
        uid: '12345',
        info: {
          name: 'mockuser',
          email: 'sample@test.com',
          first_name: 'ほげ',
          last_name: 'ふが'
        },
        credentials: {
          token: 'hogefuga'
        }
      }
    )
  end
end