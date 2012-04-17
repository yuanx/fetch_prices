class ReminderMailer < ActionMailer::Base
  default :from => "Xin Yuan <yuanx416@gmail.com>"
  
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.reminder_mailer.reminder.subject
  #
  def reminder(usr, info)
    @info = info
    mail :to => usr, :subject=> "Remind you the great deal"
  end
end

