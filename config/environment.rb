# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Mywork::Application.initialize!

Mywork::Application.configure do

	config.action_mailer.delivery_method = :smtp

	config.action_mailer.smtp_settings = {
	:address	=> "smtp.gmail.com" ,
	:port	=> 587,
	:domain	=> "gmail.com" ,
	:authentication => "plain" ,
	:user_name	=> "arun.wgl@gmail.com" ,
	:password	=> "kiprosh1234" ,
	:enable_starttls_auto => true
	}
end


