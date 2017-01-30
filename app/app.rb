module PadrinoProj
  class App < Padrino::Application
    use ConnectionPoolManagement
    register Padrino::Mailer
    register Padrino::Helpers
    # register Padrino::Login
    # register Padrino::Access
    enable :sessions
    set :login_model, :user
    # enable :login_bypass
    # set_access :*, :allow => :login

    # Add these routes below to the app file...
    get "/" do
      redirect_to url_for(:posts, :index)
    end

    get :about, :map => '/about_us' do
      render :haml, "%p This is a sample blog created to demonstrate how Padrino works!"
    end
  end
end
