# frozen_string_literal: true

class InquiryMailer < ApplicationMailer
  default from: '11111@riku.com'

  def received_email(inquiry)
    @inquiry = inquiry
    mail(to: inquiry.email, subject: 'お問い合せありがとうございました。')
  end
end
