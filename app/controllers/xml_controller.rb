class XmlController < ApplicationController
  def xml
    if !session[:current_user_id].nil?
      @xml = User.all.map {|a| [a.email, a.password_digest]}.to_xml
      render xml: @xml
    end
  end
end
