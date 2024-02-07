class CommentsController < ApplicationController
  
  before_filter :set_article, only: %i[ new ]
  # authorize_resource :class => false # authorize resource if there's no model class backing it.
  
  # You can specify which actions to affect using the :except and :only options, just like a before_filter.
  # load_and_authorize_resource :except => [:new]
  load_and_authorize_resource :article
  load_and_authorize_resource :through => :article, except: [ :show ]

  # skip_authorize_resource :only => :show  
  # skip_authorize_resource :post, :only => :show
  
  
  def new
    @comment = Comment.new
  end

  def create
    @comment = @article.comments.build(comment_params)
    respond_to do |format|
      if @comment.save
        flash.now[:notice] = "Comment was successfully created"
        format.turbo_stream { 
          render turbo_stream: [
            turbo_stream.prepend("comments", partial: "comment", locals: {comment: @comment}),
            turbo_stream.append("flash", partial: "layouts/flash")
          ]
        }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def show
  end
  
  private
    def comment_params
      params.require(:comment).permit(:comment).merge(user: current_user)
    end

    def set_article
      @article = Article.friendly.find(params[:article_id])
    end
end
