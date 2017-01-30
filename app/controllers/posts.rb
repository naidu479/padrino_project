PadrinoProj::App.controllers :posts do
  disable :login_controller

  get :index do
    @posts = Post.order('created_at desc').all
    render 'posts/index'
  end

  get :show, with: :id do
    @post = Post.find_by_id params[:id]
    render 'posts/show'
  end

  get :new do
    @post = Post.new()
    render 'posts/new'
  end

  post :create do
    @post = Post.new(params[:post])
    if @post.save
      redirect_to url_for(:posts, :index)
    else
      render 'posts/new'
    end
  end
end
