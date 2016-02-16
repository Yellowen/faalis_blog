class Faalis::Comments::Dashboard::CommentsController < Dashboard::ApplicationController

  engine 'Faalis::Comments::Engine'

  protected

  def model
    Faalis::Comments::Comment
  end

end
