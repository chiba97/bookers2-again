class EventMailer < ApplicationMailer
  def send_mail(group_users, title, content)
    @title = title
    @content = content
    mail bcc: group_users.pluck(:email), subject: title
  end
  
  def send_when_signup(email, name) 
    @name = name
    mail to: email, subject: 'Registration Complete! Thanks for Joining!'
  end
end
