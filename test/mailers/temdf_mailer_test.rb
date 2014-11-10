require 'test_helper'

class TemdfMailerTest < ActionMailer::TestCase

	test "request_account" do
		email = TemdfMailer.request_account.deliver
    	assert_not ActionMailer::Base.deliveries.empty?
		assert_equal ['temdf.unb@gmail.com'], email.from
		assert_equal ['temdf.unb@gmail.com'], email.to
		assert_equal 'Nova solicitacao de medico', email.subject
		#assert_equal read_fixture('arquivo_medico').join, email.body.to_s
	end

	test "send_mail" do

		subject = "assunto"
		message = "mensagem Qualquer"
		emailname = "roberto@gmail.com"
		name = "Roberto"

		email = TemdfMailer.send_mail(subject, message, emailname, name)
		email.deliver
    	assert_not ActionMailer::Base.deliveries.empty?
		assert_equal ['temdf.unb@gmail.com'], email.from
		assert_equal ['temdf.unb@gmail.com'], email.to
		assert_equal subject, email.subject
		assert_equal "From: " + emailname +"\nNome: "+ name + "\n\n" + message, email.body.decoded
	end
end
