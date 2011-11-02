class ProjectMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def questionnaire_email(user, subject = "Esteem Questionnaire for #{Time.now.strftime('%B %d')}")
    @user = user
    mail(to: user.email, subject: subject)
  end
end
