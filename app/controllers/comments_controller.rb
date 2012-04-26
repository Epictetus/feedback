class CommentsController < ApplicationController
  
  before_filter :find_commentable
  
  def index
    @comments = @commentable.comments
  end
  
  private
  
  def find_commentable
    params.each do |name, value|  
      if name =~ /(.+)_id$/  
        @commentable = $1.classify.constantize.find(value)  
      end  
    end
    render :status => 404 unless @commentable
  end
end