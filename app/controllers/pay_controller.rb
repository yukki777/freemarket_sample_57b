class PayController < ApplicationController
  require 'payjp'
  
  Payjp::api_key = ENV['PAYJP_PRIVATE_KEY']

  # カードトークンの生成
  def self.create_token(number, cvc, exp_month, exp_year)
    token = Payjp::Token.create(
      card: {
        number:     number,
        cvc:        cvc,
        exp_year:   exp_year,
        exp_month:  exp_month,
      }
    )
    return token.id
  end
end